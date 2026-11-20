import { Elysia, t } from 'elysia';
import { cors } from '@elysiajs/cors';
import { staticPlugin } from '@elysiajs/static';
import { existsSync } from 'node:fs';
import { join } from 'node:path';
import {
  MC_QUEST_WHITELIST,
  type TeamColor,
} from '../shared/types';
import {
  getHistoryData,
  initDatabase,
  recordAuditLog,
  recordFlashQuest,
} from './db';
import { GameStateManager } from './rcon/poller';
import { generateSmartFlashQuest } from './ai/quest-director';

function sanitizeMcString(input: string, maxLen = 32): string {
  return input.replace(/["\\\r\n{}]/g, '').trim().slice(0, maxLen);
}

const ADMIN_TOKEN = process.env.ADMIN_TOKEN?.trim() || 'nbs-admin';
const PORT = Number.parseInt(process.env.PORT ?? '3000', 10);

await initDatabase();
const game = new GameStateManager();
game.startPoller();

function requireAdmin(token: string | undefined) {
  return token === ADMIN_TOKEN;
}

const app = new Elysia()
  .use(cors())
  .get('/api/health', () => ({
    ok: true,
    mode: game.getState().mode,
    dbConnected: game.getState().dbConnected,
  }))
  .get('/api/state', () => game.getState())
  .get('/api/history', async () => getHistoryData())
  .get('/api/whitelist', () => MC_QUEST_WHITELIST)
  .get('/api/stream', ({ request }) => {
    const encoder = new TextEncoder();
    let unsubscribe: (() => void) | null = null;
    let heartbeat: ReturnType<typeof setInterval> | null = null;

    const stream = new ReadableStream({
      start(controller) {
        const push = (data: unknown) => {
          controller.enqueue(encoder.encode(`data: ${JSON.stringify(data)}\n\n`));
        };
        push(game.getState());
        unsubscribe = game.subscribe((next) => push(next));
        heartbeat = setInterval(() => {
          controller.enqueue(encoder.encode(': ping\n\n'));
        }, 15_000);

        request.signal.addEventListener('abort', () => {
          if (unsubscribe) unsubscribe();
          if (heartbeat) clearInterval(heartbeat);
          try {
            controller.close();
          } catch {
            // already closed
          }
        });
      },
      cancel() {
        if (unsubscribe) unsubscribe();
        if (heartbeat) clearInterval(heartbeat);
      },
    });

    return new Response(stream, {
      headers: {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        Connection: 'keep-alive',
      },
    });
  })
  .post(
    '/api/admin/verify',
    ({ headers, set }) => {
      if (!requireAdmin(headers['x-admin-token'])) {
        set.status = 401;
        return { ok: false, error: 'รหัสผ่าน Admin ไม่ถูกต้อง' };
      }
      return { ok: true };
    },
  )
  .post(
    '/api/admin/game/action',
    async ({ body, headers, set }) => {
      if (!requireAdmin(headers['x-admin-token'])) {
        set.status = 401;
        return { ok: false, error: 'Unauthorized' };
      }

      const map: Record<string, string> = {
        start: 'function nbs:game/start',
        do_start: 'function nbs:game/do_start',
        auto_ready: 'function nbs:game/auto_ready',
        raid_on: 'function nbs:game/raid_on',
        raid_off: 'function nbs:game/raid_off',
        reset: 'function nbs:game/reset',
      };

      const cmd = map[body.action];
      if (!cmd) {
        set.status = 400;
        return { ok: false, error: 'Invalid action' };
      }

      const result = await game.execGameCommand(cmd);
      game.applyDemoUpdate((draft) => {
        if (body.action === 'start' || body.action === 'do_start') draft.gameState = 1;
        if (body.action === 'reset') draft.gameState = 0;
        if (body.action === 'raid_on') draft.raidDay = true;
        if (body.action === 'raid_off') draft.raidDay = false;
      });
      await recordAuditLog(`game:${body.action}`, body, result);
      return { ok: true, result };
    },
    {
      body: t.Object({
        action: t.Union([
          t.Literal('start'),
          t.Literal('do_start'),
          t.Literal('auto_ready'),
          t.Literal('raid_on'),
          t.Literal('raid_off'),
          t.Literal('reset'),
        ]),
      }),
    },
  )
  .post(
    '/api/admin/team/count',
    async ({ body, headers, set }) => {
      if (!requireAdmin(headers['x-admin-token'])) {
        set.status = 401;
        return { ok: false, error: 'Unauthorized' };
      }
      const count = Math.max(1, Math.min(8, body.count));
      const result = await game.execGameCommand(`function nbs:team/set_count {count:${count}}`);
      game.applyDemoUpdate((draft) => {
        for (const team of draft.teams) {
          team.active = team.id <= count;
        }
      });
      await recordAuditLog('team:set_count', { count }, result);
      return { ok: true, result };
    },
    {
      body: t.Object({
        count: t.Integer({ minimum: 1, maximum: 8 }),
      }),
    },
  )
  .post(
    '/api/admin/team/rename',
    async ({ body, headers, set }) => {
      if (!requireAdmin(headers['x-admin-token'])) {
        set.status = 401;
        return { ok: false, error: 'Unauthorized' };
      }
      const safeName = sanitizeMcString(body.name, 24);
      if (!safeName) {
        set.status = 400;
        return { ok: false, error: 'ชื่อทีมห้ามว่างเปล่า' };
      }
      const result = await game.execGameCommand(
        `function nbs:team/rename {team:${body.team},name:"${safeName}"}`,
      );
      game.applyDemoUpdate((draft) => {
        const target = draft.teams.find((t) => t.id === body.team);
        if (target) target.name = safeName;
      });
      await recordAuditLog('team:rename', { team: body.team, name: safeName }, result);
      return { ok: true, result };
    },
    {
      body: t.Object({
        team: t.Integer({ minimum: 1, maximum: 8 }),
        name: t.String({ minLength: 1, maxLength: 32 }),
      }),
    },
  )
  .post(
    '/api/admin/team/color',
    async ({ body, headers, set }) => {
      if (!requireAdmin(headers['x-admin-token'])) {
        set.status = 401;
        return { ok: false, error: 'Unauthorized' };
      }
      const result = await game.execGameCommand(
        `function nbs:team/set_color {team:${body.team},color:"${body.color}"}`,
      );
      game.applyDemoUpdate((draft) => {
        const target = draft.teams.find((t) => t.id === body.team);
        if (target) target.color = body.color as TeamColor;
      });
      await recordAuditLog('team:set_color', body, result);
      return { ok: true, result };
    },
    {
      body: t.Object({
        team: t.Integer({ minimum: 1, maximum: 8 }),
        color: t.Union([
          t.Literal('red'),
          t.Literal('blue'),
          t.Literal('green'),
          t.Literal('yellow'),
          t.Literal('light_purple'),
          t.Literal('aqua'),
          t.Literal('gold'),
          t.Literal('white'),
          t.Literal('dark_red'),
          t.Literal('dark_aqua'),
        ]),
      }),
    },
  )
  .post('/api/admin/team/auto_assign', async ({ headers, set }) => {
    if (!requireAdmin(headers['x-admin-token'])) {
      set.status = 401;
      return { ok: false, error: 'Unauthorized' };
    }
    const result = await game.execGameCommand('function nbs:team/auto_assign');
    await recordAuditLog('team:auto_assign', {}, result);
    return { ok: true, result };
  })
  .post('/api/admin/team/reset', async ({ headers, set }) => {
    if (!requireAdmin(headers['x-admin-token'])) {
      set.status = 401;
      return { ok: false, error: 'Unauthorized' };
    }
    const result = await game.execGameCommand('function nbs:team/reset_teams');
    game.applyDemoUpdate((draft) => {
      const defaults: TeamColor[] = ['red', 'blue', 'green', 'yellow', 'light_purple', 'aqua', 'gold', 'white'];
      for (const team of draft.teams) {
        team.name = `Team ${team.id}`;
        team.color = defaults[team.id - 1]!;
        team.active = team.id <= 4;
      }
    });
    await recordAuditLog('team:reset', {}, result);
    return { ok: true, result };
  })
  .post('/api/admin/quest/ai', async ({ headers, set }) => {
    if (!requireAdmin(headers['x-admin-token'])) {
      set.status = 401;
      return { ok: false, error: 'Unauthorized' };
    }
    const history = await getHistoryData();
    const recentItems = history.quests.slice(0, 4).map((q) => q.item);
    const quest = await generateSmartFlashQuest(game.getState(), recentItems);

    const cmd = `function nbs:citadel/set_flash_quest {item:"${quest.item}",count:${quest.count},name:"${quest.displayName}"}`;
    const result = await game.execGameCommand(cmd);

    game.applyDemoUpdate((draft) => {
      draft.flashQuest = {
        active: true,
        item: quest.item,
        count: quest.count,
        name: quest.displayName,
        remainingSeconds: 1500,
        maxSeconds: 1500,
        source: quest.source,
        reason: quest.reason,
      };
    });

    await recordFlashQuest({
      item: quest.item,
      count: quest.count,
      displayName: quest.displayName,
      source: quest.source,
      aiReason: quest.reason,
    });
    await recordAuditLog('quest:ai_generate', quest, result);

    return { ok: true, quest, result };
  })
  .post(
    '/api/admin/quest/custom',
    async ({ body, headers, set }) => {
      if (!requireAdmin(headers['x-admin-token'])) {
        set.status = 401;
        return { ok: false, error: 'Unauthorized' };
      }
      const entry = MC_QUEST_WHITELIST.find((w) => w.item === body.item);
      if (!entry) {
        set.status = 400;
        return { ok: false, error: 'Item ไม่อยู่ใน Whitelist ของ Minecraft 26.3' };
      }
      const count = Math.max(entry.minCount, Math.min(entry.maxCount, body.count));
      const safeName = sanitizeMcString(body.displayName ?? `${entry.thaiName} x${count}`, 40) || `${entry.thaiName} x${count}`;

      const cmd = `function nbs:citadel/set_flash_quest {item:"${entry.item}",count:${count},name:"${safeName}"}`;
      const result = await game.execGameCommand(cmd);

      game.applyDemoUpdate((draft) => {
        draft.flashQuest = {
          active: true,
          item: entry.item,
          count,
          name: safeName,
          remainingSeconds: 1500,
          maxSeconds: 1500,
          source: 'MANUAL',
          reason: 'กำหนดโดยแอดมินผ่านหน้า Web Dashboard',
        };
      });

      await recordFlashQuest({
        item: entry.item,
        count,
        displayName: safeName,
        source: 'MANUAL',
        aiReason: 'กำหนดโดยแอดมินผ่าน Web Dashboard',
      });
      await recordAuditLog('quest:custom', { item: entry.item, count, safeName }, result);

      return { ok: true, result };
    },
    {
      body: t.Object({
        item: t.String(),
        count: t.Integer({ minimum: 1, maximum: 64 }),
        displayName: t.Optional(t.String()),
      }),
    },
  );

// Serve built React static bundle when available
const distDir = join(import.meta.dir, '../../dist');
if (existsSync(distDir)) {
  app.use(
    staticPlugin({
      assets: distDir,
      prefix: '/',
    }),
  );
  app.get('*', () => Bun.file(join(distDir, 'index.html')));
}

app.listen(PORT);
console.log(`[NBs SMP Web] Listening on http://127.0.0.1:${PORT} (mode=${game.getState().mode}, db=${game.getState().dbConnected})`);

export type App = typeof app;

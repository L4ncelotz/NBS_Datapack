import type { ServerState, TeamColor, TeamInfo } from '../../shared/types';
import { isDbConnected, recordTeamSnapshots } from '../db';
import { RconClient } from './client';

const DEFAULT_COLORS: TeamColor[] = [
  'red',
  'blue',
  'green',
  'yellow',
  'light_purple',
  'aqua',
  'gold',
  'white',
];

function createInitialTeams(): TeamInfo[] {
  return Array.from({ length: 8 }, (_, idx) => {
    const id = idx + 1;
    return {
      id,
      name: `Team ${id}`,
      color: DEFAULT_COLORS[idx]!,
      active: id <= 4,
      score: id <= 4 ? [195, 160, 125, 90][idx]! : 0,
      diamonds: id <= 4 ? [24, 18, 32, 12][idx]! : 0,
    };
  });
}

function parseScoreResult(raw: string): number | null {
  // Examples: "ทีมที่_1 has 150 [team_score]" or "Can't get value..."
  const match = raw.match(/has\s+(-?\d+)\s+\[/i);
  return match ? Number.parseInt(match[1]!, 10) : null;
}

function parseTeamStorage(raw: string): { name?: string; color?: TeamColor } {
  const nameMatch = raw.match(/name:\s*"([^"]*)"/);
  const colorMatch = raw.match(/color:\s*"([^"]*)"/);
  return {
    name: nameMatch?.[1],
    color: colorMatch?.[1] as TeamColor | undefined,
  };
}

function parseFlashStorage(raw: string): { item?: string; count?: number; name?: string } {
  const itemMatch = raw.match(/item:\s*"([^"]*)"/);
  const countMatch = raw.match(/count:\s*(\d+)/);
  const nameMatch = raw.match(/name:\s*"([^"]*)"/);
  return {
    item: itemMatch?.[1],
    count: countMatch ? Number.parseInt(countMatch[1]!, 10) : undefined,
    name: nameMatch?.[1],
  };
}

export class GameStateManager {
  private rcon: RconClient;
  private state: ServerState;
  private subscribers = new Set<(state: ServerState) => void>();
  private pollTimer: ReturnType<typeof setInterval> | null = null;
  private lastSnapshotAt = 0;

  constructor() {
    this.rcon = new RconClient(
      process.env.RCON_HOST ?? '127.0.0.1',
      Number.parseInt(process.env.RCON_PORT ?? '25575', 10),
      process.env.RCON_PASSWORD ?? '',
    );

    this.state = {
      mode: 'demo',
      dbConnected: false,
      gameState: 0,
      raidDay: false,
      onlinePlayers: 4,
      playerNames: ['Steve', 'Alex', 'NBs_Admin', 'KuySprite'],
      teams: createInitialTeams(),
      flashQuest: {
        active: true,
        item: 'minecraft:blaze_rod',
        count: 12,
        name: 'Blaze Rod x12',
        remainingSeconds: 1140,
        maxSeconds: 1500,
        source: 'POOL',
        reason: 'Demo Mode: เควสด่วนตัวอย่างระหว่างรอเชื่อมเซิร์ฟเวอร์ Minecraft จริง',
      },
      updatedAt: new Date().toISOString(),
    };
  }

  public getState(): ServerState {
    return {
      ...this.state,
      dbConnected: isDbConnected(),
    };
  }

  public subscribe(listener: (state: ServerState) => void): () => void {
    this.subscribers.add(listener);
    return () => this.subscribers.delete(listener);
  }

  private emit(): void {
    const snapshot = this.getState();
    for (const listener of this.subscribers) {
      listener(snapshot);
    }
  }

  public startPoller(): void {
    const intervalMs = Math.max(1500, Number.parseInt(process.env.RCON_POLL_MS ?? '3000', 10));
    this.pollOnce().catch(() => undefined);
    this.pollTimer = setInterval(() => {
      this.pollOnce().catch(() => undefined);
    }, intervalMs);
  }

  public stopPoller(): void {
    if (this.pollTimer) {
      clearInterval(this.pollTimer);
      this.pollTimer = null;
    }
    this.rcon.disconnect();
  }

  public async pollOnce(): Promise<void> {
    const connected = await this.rcon.connect();
    if (!connected) {
      // Demo mode tick: count down flash quest timer gently so UI feels alive
      this.state.mode = 'demo';
      if (this.state.flashQuest.active && this.state.flashQuest.remainingSeconds > 0) {
        this.state.flashQuest.remainingSeconds = Math.max(0, this.state.flashQuest.remainingSeconds - 3);
      }
      this.state.updatedAt = new Date().toISOString();
      await this.maybeRecordSnapshot();
      this.emit();
      return;
    }

    try {
      const [listRaw, gameRaw, raidRaw, flashTimerRaw, flashDataRaw] = await Promise.all([
        this.rcon.command('list'),
        this.rcon.command('scoreboard players get #game_state game_state'),
        this.rcon.command('scoreboard players get #raid_day game_state'),
        this.rcon.command('scoreboard players get #flash_timer rnd_temp'),
        this.rcon.command('data get storage nbs:citadel flash'),
      ]);

      const listMatch = listRaw.match(/There are (\d+) of a max of \d+ players online:\s*(.*)/i);
      const onlinePlayers = listMatch ? Number.parseInt(listMatch[1]!, 10) : 0;
      const playerNames = listMatch && listMatch[2]?.trim()
        ? listMatch[2].split(',').map((s) => s.trim()).filter(Boolean)
        : [];

      const gameStateVal = parseScoreResult(gameRaw) === 1 ? 1 : 0;
      const raidDay = parseScoreResult(raidRaw) === 1;
      const flashTimer = parseScoreResult(flashTimerRaw) ?? 0;
      const parsedFlash = parseFlashStorage(flashDataRaw);

      const updatedTeams: TeamInfo[] = [];
      for (let i = 1; i <= 8; i++) {
        const [activeRaw, scoreRaw, diaRaw, teamDataRaw] = await Promise.all([
          this.rcon.command(`scoreboard players get #t${i}_active game_state`),
          this.rcon.command(`scoreboard players get ทีมที่_${i} team_score`),
          this.rcon.command(`scoreboard players get #team_${i} team_diamonds`),
          this.rcon.command(`data get storage nbs:team t${i}`),
        ]);
        const meta = parseTeamStorage(teamDataRaw);
        updatedTeams.push({
          id: i,
          name: meta.name ?? `Team ${i}`,
          color: meta.color ?? DEFAULT_COLORS[i - 1]!,
          active: parseScoreResult(activeRaw) === 1,
          score: parseScoreResult(scoreRaw) ?? 0,
          diamonds: parseScoreResult(diaRaw) ?? 0,
        });
      }

      this.state = {
        mode: 'rcon',
        dbConnected: isDbConnected(),
        gameState: gameStateVal,
        raidDay,
        onlinePlayers,
        playerNames,
        teams: updatedTeams,
        flashQuest: {
          active: flashTimer > 0 && Boolean(parsedFlash.item),
          item: parsedFlash.item ?? '',
          count: parsedFlash.count ?? 0,
          name: parsedFlash.name ?? 'ยังไม่มีเควสด่วน',
          remainingSeconds: Math.max(0, flashTimer),
          maxSeconds: 1500,
          source: this.state.flashQuest.source ?? 'INGAME',
          reason: this.state.flashQuest.reason,
        },
        updatedAt: new Date().toISOString(),
      };

      await this.maybeRecordSnapshot();
      this.emit();
    } catch (err) {
      console.warn('[RCON] Poll failed, falling back cleanly:', (err as Error).message);
      this.rcon.disconnect();
    }
  }

  private async maybeRecordSnapshot(): Promise<void> {
    const now = Date.now();
    if (now - this.lastSnapshotAt >= 60_000) {
      this.lastSnapshotAt = now;
      await recordTeamSnapshots(this.state.teams);
    }
  }

  public async execGameCommand(cmd: string): Promise<string> {
    if (await this.rcon.connect()) {
      const output = await this.rcon.command(cmd);
      await this.pollOnce();
      return output || 'OK';
    }
    return `[DEMO] Executed: ${cmd}`;
  }

  // Demo state mutators so every button works seamlessly offline during preview
  public applyDemoUpdate(mutator: (draft: ServerState) => void): void {
    if (this.state.mode === 'demo') {
      mutator(this.state);
      this.state.updatedAt = new Date().toISOString();
      this.emit();
    }
  }
}

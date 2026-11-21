import { drizzle } from 'drizzle-orm/postgres-js';
import { desc } from 'drizzle-orm';
import postgres from 'postgres';
import * as schema from './schema';
import type { AuditLogItem, QuestHistoryItem, SnapshotPoint, TeamInfo } from '../../shared/types';

let dbInstance: ReturnType<typeof drizzle<typeof schema>> | null = null;
let pgClient: ReturnType<typeof postgres> | null = null;
let dbReady = false;

// In-Memory fallback when PostgreSQL is not running (e.g. quick local preview)
const memoryQuests: QuestHistoryItem[] = [];
const memorySnapshots: SnapshotPoint[] = [];
const memoryAudits: AuditLogItem[] = [];
let memSeq = 1;

export async function initDatabase(): Promise<boolean> {
  const url = process.env.DATABASE_URL;
  if (!url) {
    console.log('[DB] DATABASE_URL not set — running with In-Memory history store');
    return false;
  }

  try {
    pgClient = postgres(url, {
      max: 5,
      connect_timeout: 3,
      idle_timeout: 20,
    });
    // Quick connectivity & schema auto-ensure (safe CREATE TABLE IF NOT EXISTS for zero-friction Fedora setup)
    await pgClient`SELECT 1`;
    await pgClient`
      CREATE TABLE IF NOT EXISTS seasons (
        id SERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        active BOOLEAN NOT NULL DEFAULT TRUE,
        started_at TIMESTAMP NOT NULL DEFAULT NOW()
      );
      CREATE TABLE IF NOT EXISTS team_snapshots (
        id SERIAL PRIMARY KEY,
        team_id INTEGER NOT NULL,
        team_name TEXT NOT NULL,
        score INTEGER NOT NULL DEFAULT 0,
        diamonds INTEGER NOT NULL DEFAULT 0,
        recorded_at TIMESTAMP NOT NULL DEFAULT NOW()
      );
      CREATE TABLE IF NOT EXISTS flash_quests (
        id SERIAL PRIMARY KEY,
        item TEXT NOT NULL,
        count INTEGER NOT NULL,
        display_name TEXT NOT NULL,
        source TEXT NOT NULL,
        ai_reason TEXT,
        created_at TIMESTAMP NOT NULL DEFAULT NOW()
      );
      CREATE TABLE IF NOT EXISTS audit_logs (
        id SERIAL PRIMARY KEY,
        action TEXT NOT NULL,
        payload TEXT NOT NULL DEFAULT '{}',
        result TEXT NOT NULL DEFAULT 'OK',
        created_at TIMESTAMP NOT NULL DEFAULT NOW()
      );
    `;
    dbInstance = drizzle(pgClient, { schema });
    dbReady = true;
    console.log('[DB] PostgreSQL connected & schema verified');
    return true;
  } catch (err) {
    console.warn('[DB] PostgreSQL unavailable, using In-Memory fallback:', (err as Error).message);
    dbReady = false;
    return false;
  }
}

export function isDbConnected(): boolean {
  return dbReady;
}

export async function recordTeamSnapshots(teams: TeamInfo[]): Promise<void> {
  const activeTeams = teams.filter((t) => t.active);
  const now = new Date();
  if (dbReady && dbInstance) {
    try {
      await dbInstance.insert(schema.teamSnapshots).values(
        activeTeams.map((t) => ({
          teamId: t.id,
          teamName: t.name,
          score: t.score,
          diamonds: t.diamonds,
          recordedAt: now,
        })),
      );
      return;
    } catch (err) {
      console.warn('[DB] Failed to insert snapshots:', (err as Error).message);
    }
  }
  for (const t of activeTeams) {
    memorySnapshots.push({
      teamId: t.id,
      score: t.score,
      diamonds: t.diamonds,
      recordedAt: now.toISOString(),
    });
  }
  if (memorySnapshots.length > 400) {
    memorySnapshots.splice(0, memorySnapshots.length - 400);
  }
}

export async function recordFlashQuest(entry: {
  item: string;
  count: number;
  displayName: string;
  source: 'AI' | 'POOL' | 'MANUAL';
  aiReason?: string;
}): Promise<void> {
  const now = new Date();
  if (dbReady && dbInstance) {
    try {
      await dbInstance.insert(schema.flashQuests).values({
        item: entry.item,
        count: entry.count,
        displayName: entry.displayName,
        source: entry.source,
        aiReason: entry.aiReason ?? null,
        createdAt: now,
      });
      return;
    } catch (err) {
      console.warn('[DB] Failed to insert flash quest:', (err as Error).message);
    }
  }
  memoryQuests.unshift({
    id: memSeq++,
    item: entry.item,
    count: entry.count,
    displayName: entry.displayName,
    source: entry.source,
    aiReason: entry.aiReason ?? null,
    createdAt: now.toISOString(),
  });
  if (memoryQuests.length > 50) memoryQuests.length = 50;
}

export async function recordAuditLog(action: string, payload: unknown, result: string): Promise<void> {
  const now = new Date();
  const payloadStr = JSON.stringify(payload ?? {});
  if (dbReady && dbInstance) {
    try {
      await dbInstance.insert(schema.auditLogs).values({
        action,
        payload: payloadStr,
        result,
        createdAt: now,
      });
      return;
    } catch (err) {
      console.warn('[DB] Failed to insert audit log:', (err as Error).message);
    }
  }
  memoryAudits.unshift({
    id: memSeq++,
    action,
    payload: payloadStr,
    result,
    createdAt: now.toISOString(),
  });
  if (memoryAudits.length > 50) memoryAudits.length = 50;
}

export async function getHistoryData(): Promise<{
  quests: QuestHistoryItem[];
  snapshots: SnapshotPoint[];
  audits: AuditLogItem[];
}> {
  if (dbReady && dbInstance) {
    try {
      const [questsRows, snapRows, auditRows] = await Promise.all([
        dbInstance.select().from(schema.flashQuests).orderBy(desc(schema.flashQuests.id)).limit(20),
        dbInstance.select().from(schema.teamSnapshots).orderBy(desc(schema.teamSnapshots.id)).limit(160),
        dbInstance.select().from(schema.auditLogs).orderBy(desc(schema.auditLogs.id)).limit(20),
      ]);
      return {
        quests: questsRows.map((q) => ({
          id: q.id,
          item: q.item,
          count: q.count,
          displayName: q.displayName,
          source: q.source,
          aiReason: q.aiReason,
          createdAt: q.createdAt.toISOString(),
        })),
        snapshots: snapRows
          .reverse()
          .map((s) => ({
            teamId: s.teamId,
            score: s.score,
            diamonds: s.diamonds,
            recordedAt: s.recordedAt.toISOString(),
          })),
        audits: auditRows.map((a) => ({
          id: a.id,
          action: a.action,
          payload: a.payload,
          result: a.result,
          createdAt: a.createdAt.toISOString(),
        })),
      };
    } catch (err) {
      console.warn('[DB] Failed to read history:', (err as Error).message);
    }
  }

  return {
    quests: [...memoryQuests],
    snapshots: [...memorySnapshots],
    audits: [...memoryAudits],
  };
}

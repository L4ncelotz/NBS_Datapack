import { pgTable, serial, integer, text, timestamp, boolean } from 'drizzle-orm/pg-core';

export const seasons = pgTable('seasons', {
  id: serial('id').primaryKey(),
  name: text('name').notNull(),
  active: boolean('active').notNull().default(true),
  startedAt: timestamp('started_at').defaultNow().notNull(),
});

export const teamSnapshots = pgTable('team_snapshots', {
  id: serial('id').primaryKey(),
  teamId: integer('team_id').notNull(),
  teamName: text('team_name').notNull(),
  score: integer('score').notNull().default(0),
  diamonds: integer('diamonds').notNull().default(0),
  recordedAt: timestamp('recorded_at').defaultNow().notNull(),
});

export const flashQuests = pgTable('flash_quests', {
  id: serial('id').primaryKey(),
  item: text('item').notNull(),
  count: integer('count').notNull(),
  displayName: text('display_name').notNull(),
  source: text('source').notNull(), // 'AI' | 'POOL' | 'MANUAL'
  aiReason: text('ai_reason'),
  createdAt: timestamp('created_at').defaultNow().notNull(),
});

export const auditLogs = pgTable('audit_logs', {
  id: serial('id').primaryKey(),
  action: text('action').notNull(),
  payload: text('payload').notNull().default('{}'),
  result: text('result').notNull().default('OK'),
  createdAt: timestamp('created_at').defaultNow().notNull(),
});

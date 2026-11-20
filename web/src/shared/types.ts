export type TeamColor =
  | 'red'
  | 'blue'
  | 'green'
  | 'yellow'
  | 'light_purple'
  | 'aqua'
  | 'gold'
  | 'white'
  | 'dark_red'
  | 'dark_aqua';

export const TEAM_COLOR_META: Record<
  TeamColor,
  { label: string; hex: string; badgeBg: string }
> = {
  red: { label: 'แดง', hex: '#ef4444', badgeBg: 'bg-red-500/20 text-red-300 border-red-500/40' },
  blue: { label: 'น้ำเงิน', hex: '#3b82f6', badgeBg: 'bg-blue-500/20 text-blue-300 border-blue-500/40' },
  green: { label: 'เขียว', hex: '#22c55e', badgeBg: 'bg-green-500/20 text-green-300 border-green-500/40' },
  yellow: { label: 'เหลือง', hex: '#eab308', badgeBg: 'bg-yellow-500/20 text-yellow-300 border-yellow-500/40' },
  light_purple: { label: 'ชมพู', hex: '#e879f9', badgeBg: 'bg-fuchsia-500/20 text-fuchsia-300 border-fuchsia-500/40' },
  aqua: { label: 'ฟ้า', hex: '#22d3ee', badgeBg: 'bg-cyan-500/20 text-cyan-300 border-cyan-500/40' },
  gold: { label: 'ส้ม/ทอง', hex: '#f59e0b', badgeBg: 'bg-amber-500/20 text-amber-300 border-amber-500/40' },
  white: { label: 'ขาว', hex: '#f1f5f9', badgeBg: 'bg-slate-200/20 text-slate-100 border-slate-300/40' },
  dark_red: { label: 'แดงเข้ม', hex: '#b91c1c', badgeBg: 'bg-red-800/30 text-red-200 border-red-700/50' },
  dark_aqua: { label: 'ฟ้าคราม', hex: '#0891b2', badgeBg: 'bg-cyan-800/30 text-cyan-200 border-cyan-700/50' },
};

export interface TeamInfo {
  id: number;
  name: string;
  color: TeamColor;
  active: boolean;
  score: number;
  diamonds: number;
}

export interface FlashQuestState {
  active: boolean;
  item: string;
  count: number;
  name: string;
  remainingSeconds: number;
  maxSeconds: number;
  source?: 'AI' | 'POOL' | 'MANUAL' | 'INGAME';
  reason?: string;
}

export interface ServerState {
  mode: 'rcon' | 'demo';
  dbConnected: boolean;
  gameState: 0 | 1; // 0 = Lobby, 1 = Active
  raidDay: boolean;
  onlinePlayers: number;
  playerNames: string[];
  teams: TeamInfo[];
  flashQuest: FlashQuestState;
  updatedAt: string;
}

export interface QuestHistoryItem {
  id: number;
  item: string;
  count: number;
  displayName: string;
  source: string;
  aiReason: string | null;
  createdAt: string;
}

export interface SnapshotPoint {
  teamId: number;
  score: number;
  diamonds: number;
  recordedAt: string;
}

export interface AuditLogItem {
  id: number;
  action: string;
  payload: string;
  result: string;
  createdAt: string;
}

export interface QuestWhitelistEntry {
  item: string;
  thaiName: string;
  minCount: number;
  maxCount: number;
  defaultCount: number;
  difficulty: 'early' | 'mid' | 'late';
}

export const MC_QUEST_WHITELIST: QuestWhitelistEntry[] = [
  { item: 'minecraft:iron_block', thaiName: 'Iron Block', minCount: 4, maxCount: 20, defaultCount: 8, difficulty: 'early' },
  { item: 'minecraft:gold_block', thaiName: 'Gold Block', minCount: 2, maxCount: 12, defaultCount: 4, difficulty: 'early' },
  { item: 'minecraft:redstone_block', thaiName: 'Redstone Block', minCount: 4, maxCount: 24, defaultCount: 12, difficulty: 'early' },
  { item: 'minecraft:lapis_block', thaiName: 'Lapis Block', minCount: 4, maxCount: 16, defaultCount: 8, difficulty: 'early' },
  { item: 'minecraft:honey_bottle', thaiName: 'Honey Bottle', minCount: 4, maxCount: 16, defaultCount: 8, difficulty: 'early' },
  { item: 'minecraft:golden_carrot', thaiName: 'Golden Carrot', minCount: 16, maxCount: 64, defaultCount: 32, difficulty: 'early' },
  { item: 'minecraft:ender_pearl', thaiName: 'Ender Pearl', minCount: 8, maxCount: 32, defaultCount: 16, difficulty: 'mid' },
  { item: 'minecraft:blaze_rod', thaiName: 'Blaze Rod', minCount: 6, maxCount: 24, defaultCount: 12, difficulty: 'mid' },
  { item: 'minecraft:ghast_tear', thaiName: 'Ghast Tear', minCount: 2, maxCount: 8, defaultCount: 4, difficulty: 'mid' },
  { item: 'minecraft:magma_cream', thaiName: 'Magma Cream', minCount: 6, maxCount: 24, defaultCount: 12, difficulty: 'mid' },
  { item: 'minecraft:phantom_membrane', thaiName: 'Phantom Membrane', minCount: 4, maxCount: 16, defaultCount: 6, difficulty: 'mid' },
  { item: 'minecraft:emerald_block', thaiName: 'Emerald Block', minCount: 2, maxCount: 12, defaultCount: 4, difficulty: 'mid' },
  { item: 'minecraft:obsidian', thaiName: 'Obsidian', minCount: 16, maxCount: 64, defaultCount: 32, difficulty: 'mid' },
  { item: 'minecraft:crying_obsidian', thaiName: 'Crying Obsidian', minCount: 4, maxCount: 16, defaultCount: 8, difficulty: 'mid' },
  { item: 'minecraft:prismarine_crystals', thaiName: 'Prismarine Crystals', minCount: 8, maxCount: 32, defaultCount: 16, difficulty: 'mid' },
  { item: 'minecraft:ancient_debris', thaiName: 'Ancient Debris', minCount: 1, maxCount: 4, defaultCount: 2, difficulty: 'late' },
  { item: 'minecraft:diamond_block', thaiName: 'Diamond Block', minCount: 1, maxCount: 6, defaultCount: 2, difficulty: 'late' },
  { item: 'minecraft:shulker_shell', thaiName: 'Shulker Shell', minCount: 2, maxCount: 6, defaultCount: 2, difficulty: 'late' },
  { item: 'minecraft:nautilus_shell', thaiName: 'Nautilus Shell', minCount: 2, maxCount: 8, defaultCount: 4, difficulty: 'late' },
  { item: 'minecraft:heart_of_the_sea', thaiName: 'Heart of the Sea', minCount: 1, maxCount: 2, defaultCount: 1, difficulty: 'late' },
];

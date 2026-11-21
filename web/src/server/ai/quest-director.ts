import { GoogleGenAI, Type } from '@google/genai';
import { MC_QUEST_WHITELIST, type QuestWhitelistEntry, type ServerState } from '../../shared/types';

export interface GeneratedQuestResult {
  item: string;
  count: number;
  displayName: string;
  source: 'AI' | 'POOL';
  reason: string;
}

function sanitizeDisplayName(raw: string, fallback: string): string {
  const cleaned = raw.replace(/["\\\r\n{}]/g, '').trim();
  return cleaned.length > 0 ? cleaned.slice(0, 48) : fallback;
}

function clampCount(count: number, entry: QuestWhitelistEntry): number {
  const rounded = Math.round(Number.isFinite(count) ? count : entry.defaultCount);
  return Math.max(entry.minCount, Math.min(entry.maxCount, rounded));
}

function pickWeightedFallback(recentItems: string[]): GeneratedQuestResult {
  const candidates = MC_QUEST_WHITELIST.filter((e) => !recentItems.includes(e.item));
  const pool = candidates.length > 0 ? candidates : MC_QUEST_WHITELIST;
  const chosen = pool[Math.floor(Math.random() * pool.length)]!;
  return {
    item: chosen.item,
    count: chosen.defaultCount,
    displayName: `${chosen.thaiName} x${chosen.defaultCount}`,
    source: 'POOL',
    reason: 'Fallback Weighted Pool (สุ่มจากคลังเควสที่ผ่านการบาลานซ์แล้ว)',
  };
}

/**
 * AI Game Director: Analyzes live team standings via Gemini API,
 * enforces strict JSON Schema + Minecraft 26.3 Item Whitelist guardrails,
 * and falls back safely to a balanced pool if API key is missing or invalid.
 */
export async function generateSmartFlashQuest(
  state: ServerState,
  recentItems: string[],
): Promise<GeneratedQuestResult> {
  const apiKey = process.env.GEMINI_API_KEY?.trim();
  if (!apiKey) {
    return pickWeightedFallback(recentItems);
  }

  const activeTeams = state.teams.filter((t) => t.active);
  const sorted = [...activeTeams].sort((a, b) => b.score - a.score);
  const scoreSummary = sorted.map((t) => `${t.name}: ${t.score} pts (${t.diamonds} diamonds)`).join(', ');
  const allowedIds = MC_QUEST_WHITELIST.map(
    (w) => `${w.item} (${w.minCount}-${w.maxCount}, tier:${w.difficulty})`,
  ).join('; ');

  try {
    const ai = new GoogleGenAI({ apiKey });
    const model = process.env.GEMINI_MODEL?.trim() || 'gemini-2.5-flash';

    const response = await ai.models.generateContent({
      model,
      contents: [
        `You are the Game Director for a competitive Minecraft 26.3 SMP (25-minute Flash Quest).`,
        `Current standings: ${scoreSummary || 'Early game'}. Raid Day: ${state.raidDay ? 'ON' : 'OFF'}.`,
        `Recently used items to avoid repeating: ${recentItems.join(', ') || 'none'}.`,
        `Pick ONE fair and exciting quest item strictly from this allowed whitelist: ${allowedIds}.`,
        `Return JSON with item (exact minecraft:... id from whitelist), count (within min-max), displayName (short Thai+item label, max 36 chars, no quotes), and reason (short Thai explanation of why this fits the current match).`,
      ].join('\n'),
      config: {
        responseMimeType: 'application/json',
        responseSchema: {
          type: Type.OBJECT,
          properties: {
            item: { type: Type.STRING },
            count: { type: Type.INTEGER },
            displayName: { type: Type.STRING },
            reason: { type: Type.STRING },
          },
          required: ['item', 'count', 'displayName', 'reason'],
        },
      },
    });

    const text = response.text;
    if (!text) return pickWeightedFallback(recentItems);
    const parsed = JSON.parse(text) as {
      item?: string;
      count?: number;
      displayName?: string;
      reason?: string;
    };

    const whitelistEntry = MC_QUEST_WHITELIST.find((w) => w.item === parsed.item);
    if (!whitelistEntry) {
      console.warn('[AI Guardrail] Rejected non-whitelisted item:', parsed.item);
      return pickWeightedFallback(recentItems);
    }

    const safeCount = clampCount(parsed.count ?? whitelistEntry.defaultCount, whitelistEntry);
    const safeName = sanitizeDisplayName(
      parsed.displayName ?? `${whitelistEntry.thaiName} x${safeCount}`,
      `${whitelistEntry.thaiName} x${safeCount}`,
    );

    return {
      item: whitelistEntry.item,
      count: safeCount,
      displayName: safeName,
      source: 'AI',
      reason: sanitizeDisplayName(parsed.reason ?? 'AI เลือกตามสถานการณ์เกมปัจจุบัน', 'AI Game Director'),
    };
  } catch (err) {
    console.warn('[AI Director] Falling back to pool:', (err as Error).message);
    return pickWeightedFallback(recentItems);
  }
}

import { useEffect, useMemo, useState } from 'react';
import { api } from './api';
import {
  MC_QUEST_WHITELIST,
  TEAM_COLOR_META,
  type AuditLogItem,
  type QuestHistoryItem,
  type ServerState,
  type SnapshotPoint,
  type TeamColor,
} from '../shared/types';

function formatDuration(seconds: number): string {
  const m = Math.floor(seconds / 60);
  const s = seconds % 60;
  return `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
}

export default function App() {
  const [state, setState] = useState<ServerState | null>(null);
  const [quests, setQuests] = useState<QuestHistoryItem[]>([]);
  const [snapshots, setSnapshots] = useState<SnapshotPoint[]>([]);
  const [audits, setAudits] = useState<AuditLogItem[]>([]);

  // Admin auth
  const [adminToken, setAdminToken] = useState<string>(() => localStorage.getItem('nbs_admin_token') ?? '');
  const [tokenInput, setTokenInput] = useState('');
  const [isAdmin, setIsAdmin] = useState(false);
  const [toast, setToast] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);

  // Team & Quest editor inputs
  const [teamDrafts, setTeamDrafts] = useState<Record<number, string>>({});
  const [customItem, setCustomItem] = useState(MC_QUEST_WHITELIST[0]!.item);
  const [customCount, setCustomCount] = useState(MC_QUEST_WHITELIST[0]!.defaultCount);

  const notify = (msg: string) => {
    setToast(msg);
    setTimeout(() => setToast((prev) => (prev === msg ? null : prev)), 4000);
  };

  const loadHistory = async () => {
    const res = await api.api.history.get();
    if (res.data) {
      setQuests(res.data.quests);
      setSnapshots(res.data.snapshots);
      setAudits(res.data.audits);
    }
  };

  useEffect(() => {
    api.api.state.get().then((res) => {
      if (res.data) setState(res.data);
    });
    loadHistory();

    const es = new EventSource('/api/stream');
    es.onmessage = (evt) => {
      try {
        const next = JSON.parse(evt.data) as ServerState;
        setState(next);
      } catch {
        // ignore keep-alive
      }
    };

    const histTimer = setInterval(loadHistory, 15_000);
    return () => {
      es.close();
      clearInterval(histTimer);
    };
  }, []);

  useEffect(() => {
    if (!adminToken) return;
    api.api.admin.verify
      .post(undefined, { headers: { 'x-admin-token': adminToken } })
      .then((res) => {
        if (res.data?.ok) setIsAdmin(true);
      })
      .catch(() => setIsAdmin(false));
  }, [adminToken]);

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    const res = await api.api.admin.verify.post(undefined, {
      headers: { 'x-admin-token': tokenInput },
    });
    if (res.data?.ok) {
      localStorage.setItem('nbs_admin_token', tokenInput);
      setAdminToken(tokenInput);
      setIsAdmin(true);
      setTokenInput('');
      notify('🔓 ปลดล็อกสิทธิ์ Admin สำเร็จ');
    } else {
      notify('❌ รหัสผ่าน Admin ไม่ถูกต้อง');
    }
  };

  const handleLogout = () => {
    localStorage.removeItem('nbs_admin_token');
    setAdminToken('');
    setIsAdmin(false);
    notify('🔒 ออกจากโหมด Admin แล้ว');
  };

  const runAdmin = async (fn: () => Promise<{ data: unknown; error: unknown }>, successMsg: string) => {
    setBusy(true);
    try {
      const { error } = await fn();
      if (error) {
        notify('❌ คำสั่งไม่สำเร็จ (ตรวจสอบสิทธิ์หรือค่าที่ส่ง)');
      } else {
        notify(successMsg);
        await loadHistory();
      }
    } finally {
      setBusy(false);
    }
  };

  const activeTeams = useMemo(() => {
    if (!state) return [];
    return [...state.teams].filter((t) => t.active).sort((a, b) => b.score - a.score);
  }, [state]);

  const topScore = Math.max(1, ...activeTeams.map((t) => t.score));
  const wealthiestId = useMemo(() => {
    let bestId = -1;
    let bestDia = 0;
    for (const t of activeTeams) {
      if (t.diamonds > bestDia) {
        bestDia = t.diamonds;
        bestId = t.id;
      }
    }
    return bestId;
  }, [activeTeams]);

  const authHeaders = { headers: { 'x-admin-token': adminToken } };

  if (!state) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-950 text-slate-300">
        กำลังเชื่อมต่อ NBs SMP Live Control...
      </div>
    );
  }

  const questPct = state.flashQuest.maxSeconds
    ? Math.round((state.flashQuest.remainingSeconds / state.flashQuest.maxSeconds) * 100)
    : 0;

  return (
    <div className="min-h-screen bg-slate-950 text-slate-100 pb-16">
      {/* Top Status Bar */}
      <header className="border-b border-slate-800/80 bg-slate-900/70 backdrop-blur sticky top-0 z-20">
        <div className="max-w-6xl mx-auto px-4 py-3 flex flex-wrap items-center justify-between gap-3">
          <div className="flex items-center gap-3">
            <span className="text-xl font-bold tracking-tight bg-gradient-to-r from-amber-400 to-orange-500 bg-clip-text text-transparent">
              ⚔️ NBs SMP Dashboard
            </span>
            <span
              className={`text-xs px-2.5 py-0.5 rounded-full border font-medium ${
                state.mode === 'rcon'
                  ? 'bg-emerald-500/15 text-emerald-300 border-emerald-500/40'
                  : 'bg-amber-500/15 text-amber-300 border-amber-500/40'
              }`}
            >
              {state.mode === 'rcon' ? '🟢 RCON Live' : '🟡 Demo Mode'}
            </span>
            <span
              className={`text-xs px-2.5 py-0.5 rounded-full border ${
                state.dbConnected
                  ? 'bg-sky-500/15 text-sky-300 border-sky-500/40'
                  : 'bg-slate-800 text-slate-400 border-slate-700'
              }`}
            >
              {state.dbConnected ? '🐘 PostgreSQL' : '💾 In-Memory'}
            </span>
          </div>

          <div className="flex items-center gap-2 text-xs">
            <span
              className={`px-3 py-1 rounded-lg font-semibold border ${
                state.gameState === 1
                  ? 'bg-emerald-500/20 text-emerald-300 border-emerald-500/40'
                  : 'bg-indigo-500/20 text-indigo-300 border-indigo-500/40'
              }`}
            >
              {state.gameState === 1 ? '🚀 กำลังแข่งขัน (Active)' : '🕒 ห้องรอ (Lobby)'}
            </span>
            <span
              className={`px-3 py-1 rounded-lg font-semibold border ${
                state.raidDay
                  ? 'bg-red-500/25 text-red-200 border-red-500/50 animate-pulse'
                  : 'bg-slate-800 text-slate-400 border-slate-700'
              }`}
            >
              {state.raidDay ? '🔥 RAID DAY ON' : '🕊️ Raid Off'}
            </span>
            <span className="px-3 py-1 rounded-lg bg-slate-800 border border-slate-700 text-slate-300">
              👥 ออนไลน์ {state.onlinePlayers} คน
            </span>
          </div>
        </div>
      </header>

      {toast && (
        <div className="fixed bottom-5 right-5 z-50 bg-slate-800 border border-amber-500/50 text-amber-200 px-4 py-2.5 rounded-xl shadow-2xl text-sm font-medium">
          {toast}
        </div>
      )}

      <main className="max-w-6xl mx-auto px-4 mt-6 space-y-6">
        {/* Flash Quest Bossbar Banner */}
        <section className="rounded-2xl border border-amber-500/30 bg-gradient-to-br from-slate-900 via-slate-900 to-amber-950/20 p-5 shadow-lg">
          <div className="flex flex-wrap items-center justify-between gap-3 mb-3">
            <div>
              <div className="flex items-center gap-2">
                <span className="text-amber-400 font-bold text-sm uppercase tracking-wider">
                  ⚡ Random Boost Quest (The Citadel 0,0)
                </span>
                {state.flashQuest.source && (
                  <span className="text-[11px] px-2 py-0.5 rounded bg-amber-500/20 text-amber-300 border border-amber-500/30">
                    {state.flashQuest.source === 'AI' ? '🤖 AI Game Director' : state.flashQuest.source}
                  </span>
                )}
              </div>
              <h2 className="text-2xl font-bold text-white mt-1">
                {state.flashQuest.active ? state.flashQuest.name : 'ยังไม่มีเควสด่วนในขณะนี้'}
              </h2>
              {state.flashQuest.reason && (
                <p className="text-xs text-slate-400 mt-1">{state.flashQuest.reason}</p>
              )}
            </div>
            <div className="text-right">
              <div className="text-3xl font-mono font-bold text-amber-300">
                {state.flashQuest.active ? formatDuration(state.flashQuest.remainingSeconds) : '--:--'}
              </div>
              <div className="text-xs text-slate-400">ทีมแรกรับ +35 แต้ม | ทีมถัดไป +25 แต้ม</div>
            </div>
          </div>
          <div className="w-full h-2.5 bg-slate-800 rounded-full overflow-hidden">
            <div
              className="h-full bg-gradient-to-r from-amber-500 to-yellow-300 transition-all duration-500"
              style={{ width: `${state.flashQuest.active ? questPct : 0}%` }}
            />
          </div>
        </section>

        {/* Public Leaderboard & Admin Auth Row */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          {/* Leaderboard (2 cols) */}
          <section className="lg:col-span-2 rounded-2xl border border-slate-800 bg-slate-900/70 p-5">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-bold text-white">🏆 ตารางคะแนนทีมสด ({activeTeams.length} ทีม)</h3>
              <span className="text-xs text-slate-400">
                อัปเดตล่าสุด: {new Date(state.updatedAt).toLocaleTimeString('th-TH')}
              </span>
            </div>

            <div className="space-y-3">
              {activeTeams.map((team, idx) => {
                const meta = TEAM_COLOR_META[team.color] ?? TEAM_COLOR_META.white;
                const widthPct = Math.max(4, Math.round((team.score / topScore) * 100));
                return (
                  <div
                    key={team.id}
                    className="rounded-xl border border-slate-800 bg-slate-950/60 p-3.5"
                  >
                    <div className="flex items-center justify-between gap-2 mb-2">
                      <div className="flex items-center gap-2.5">
                        <span className="text-sm font-bold text-slate-400 w-5">#{idx + 1}</span>
                        <span
                          className="w-3 h-3 rounded-full shrink-0"
                          style={{ backgroundColor: meta.hex }}
                        />
                        <span className="font-bold text-base text-white">{team.name}</span>
                        {team.id === wealthiestId && team.diamonds > 0 && (
                          <span className="text-[11px] px-2 py-0.5 rounded-full bg-cyan-500/20 text-cyan-300 border border-cyan-500/40">
                            💎 Wealthiest (+80)
                          </span>
                        )}
                      </div>
                      <div className="flex items-center gap-4 text-sm">
                        <span className="text-cyan-300 font-medium">💎 {team.diamonds}</span>
                        <span className="font-mono font-bold text-lg text-amber-300">
                          {team.score} <span className="text-xs text-slate-400">pts</span>
                        </span>
                      </div>
                    </div>
                    <div className="w-full h-2 bg-slate-800 rounded-full overflow-hidden">
                      <div
                        className="h-full rounded-full transition-all duration-500"
                        style={{ width: `${widthPct}%`, backgroundColor: meta.hex }}
                      />
                    </div>
                  </div>
                );
              })}
            </div>
          </section>

          {/* Right Column: Online Players + Admin Login */}
          <aside className="space-y-6">
            <div className="rounded-2xl border border-slate-800 bg-slate-900/70 p-5">
              <h3 className="text-base font-bold text-white mb-3">🎮 ผู้เล่นออนไลน์</h3>
              {state.playerNames.length === 0 ? (
                <p className="text-sm text-slate-400">ยังไม่มีผู้เล่นออนไลน์</p>
              ) : (
                <div className="flex flex-wrap gap-2">
                  {state.playerNames.map((name) => (
                    <span
                      key={name}
                      className="text-xs px-2.5 py-1 rounded-lg bg-slate-800 border border-slate-700 text-slate-200"
                    >
                      {name}
                    </span>
                  ))}
                </div>
              )}
            </div>

            <div className="rounded-2xl border border-slate-800 bg-slate-900/70 p-5">
              <div className="flex items-center justify-between mb-3">
                <h3 className="text-base font-bold text-white">🛡️ Admin Control</h3>
                {isAdmin && (
                  <button
                    onClick={handleLogout}
                    className="text-xs text-red-300 hover:text-red-200 underline cursor-pointer"
                  >
                    ล็อก
                  </button>
                )}
              </div>

              {!isAdmin ? (
                <form onSubmit={handleLogin} className="space-y-2.5">
                  <p className="text-xs text-slate-400">
                    ผู้เล่นทั่วไปดูคะแนนสดได้ทันที — แอดมินใส่รหัสเพื่อเปิดปุ่มคุมเกมและ AI Quest
                  </p>
                  <input
                    type="password"
                    value={tokenInput}
                    onChange={(e) => setTokenInput(e.target.value)}
                    placeholder="ADMIN_TOKEN (ค่าเริ่มต้น: nbs-admin)"
                    className="w-full px-3 py-2 rounded-lg bg-slate-950 border border-slate-700 text-sm focus:outline-none focus:border-amber-500"
                  />
                  <button
                    type="submit"
                    className="w-full py-2 rounded-lg bg-amber-500 hover:bg-amber-400 text-slate-950 font-bold text-sm transition cursor-pointer"
                  >
                    ปลดล็อกแผง Admin
                  </button>
                </form>
              ) : (
                <div className="space-y-2 text-xs text-emerald-300">
                  ✅ ปลดล็อกสิทธิ์ Admin แล้ว — ใช้แผงควบคุมด้านล่างได้เลย
                </div>
              )}
            </div>
          </aside>
        </div>

        {/* Admin Control Console (Visible only when unlocked) */}
        {isAdmin && (
          <section className="rounded-2xl border border-amber-500/40 bg-slate-900/90 p-5 space-y-6">
            <div className="flex flex-wrap items-center justify-between gap-3">
              <h3 className="text-lg font-bold text-amber-300">⚙️ แผงควบคุมแอดมิน (Live RCON + AI)</h3>
              <div className="flex flex-wrap gap-2">
                <button
                  disabled={busy}
                  onClick={() =>
                    runAdmin(
                      () => api.api.admin.game.action.post({ action: 'start' }, authHeaders),
                      '🚀 สั่ง Start Game (พร้อม Type-Safe Ready Check) แล้ว',
                    )
                  }
                  className="px-3 py-1.5 rounded-lg bg-emerald-600 hover:bg-emerald-500 text-white text-xs font-bold cursor-pointer disabled:opacity-50"
                >
                  ▶ Start Game
                </button>
                <button
                  disabled={busy}
                  onClick={() =>
                    runAdmin(
                      () => api.api.admin.game.action.post({ action: 'auto_ready' }, authHeaders),
                      '🎲 สุ่มทีม + อาชีพให้คนที่ยังไม่พร้อมแล้ว',
                    )
                  }
                  className="px-3 py-1.5 rounded-lg bg-sky-600 hover:bg-sky-500 text-white text-xs font-bold cursor-pointer disabled:opacity-50"
                >
                  🎲 สุ่มทีม+อาชีพ
                </button>
                <button
                  disabled={busy}
                  onClick={() =>
                    runAdmin(
                      () =>
                        api.api.admin.game.action.post(
                          { action: state.raidDay ? 'raid_off' : 'raid_on' },
                          authHeaders,
                        ),
                      state.raidDay ? '🕊️ ปิด Raid Day แล้ว' : '🔥 เปิด Raid Day แล้ว',
                    )
                  }
                  className={`px-3 py-1.5 rounded-lg text-white text-xs font-bold cursor-pointer disabled:opacity-50 ${
                    state.raidDay ? 'bg-slate-600 hover:bg-slate-500' : 'bg-red-600 hover:bg-red-500'
                  }`}
                >
                  {state.raidDay ? '🕊️ ปิด Raid Day' : '🔥 เปิด Raid Day'}
                </button>
                <button
                  disabled={busy}
                  onClick={() =>
                    runAdmin(
                      () => api.api.admin.game.action.post({ action: 'reset' }, authHeaders),
                      '↺ รีเซ็ตกลับ Lobby แล้ว',
                    )
                  }
                  className="px-3 py-1.5 rounded-lg bg-slate-700 hover:bg-slate-600 text-slate-200 text-xs font-bold cursor-pointer disabled:opacity-50"
                >
                  ↺ Reset Lobby
                </button>
              </div>
            </div>

            {/* Easy Team Manager on Web */}
            <div className="border-t border-slate-800 pt-4 space-y-3">
              <div className="flex flex-wrap items-center justify-between gap-2">
                <div className="flex items-center gap-2 flex-wrap">
                  <span className="text-sm font-semibold text-slate-200">จำนวนทีม:</span>
                  {[2, 3, 4, 5, 6, 7, 8].map((cnt) => (
                    <button
                      key={cnt}
                      disabled={busy}
                      onClick={() =>
                        runAdmin(
                          () => api.api.admin.team.count.post({ count: cnt }, authHeaders),
                          `⚙️ ปรับจำนวนทีมเป็น ${cnt} ทีมแล้ว`,
                        )
                      }
                      className={`px-2.5 py-1 rounded text-xs font-bold border cursor-pointer ${
                        activeTeams.length === cnt
                          ? 'bg-amber-500 text-slate-950 border-amber-400'
                          : 'bg-slate-800 text-slate-300 border-slate-700 hover:bg-slate-700'
                      }`}
                    >
                      {cnt === 4 ? '4 (Default)' : cnt}
                    </button>
                  ))}
                </div>
                <button
                  disabled={busy}
                  onClick={() =>
                    runAdmin(
                      () => api.api.admin.team.reset.post(undefined, authHeaders),
                      '🔄 รีเซ็ตทีมกลับ Default 4 ทีมแล้ว',
                    )
                  }
                  className="text-xs px-3 py-1 rounded bg-slate-800 hover:bg-slate-700 border border-slate-700 text-slate-300 cursor-pointer"
                >
                  🔄 รีเซ็ตชื่อ/สี Default
                </button>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                {activeTeams.map((t) => (
                  <div
                    key={t.id}
                    className="flex flex-wrap items-center gap-2 p-2.5 rounded-xl bg-slate-950/70 border border-slate-800"
                  >
                    <span className="text-xs font-bold text-slate-400 w-10">#{t.id}</span>
                    <input
                      type="text"
                      value={teamDrafts[t.id] ?? t.name}
                      onChange={(e) =>
                        setTeamDrafts((prev) => ({ ...prev, [t.id]: e.target.value }))
                      }
                      className="flex-1 min-w-28 px-2.5 py-1 rounded bg-slate-900 border border-slate-700 text-sm text-white"
                    />
                    <button
                      disabled={busy}
                      onClick={() =>
                        runAdmin(
                          () =>
                            api.api.admin.team.rename.post(
                              { team: t.id, name: teamDrafts[t.id] ?? t.name },
                              authHeaders,
                            ),
                          `✏️ เปลี่ยนชื่อทีม ${t.id} แล้ว`,
                        )
                      }
                      className="px-2.5 py-1 rounded bg-amber-500/20 hover:bg-amber-500/30 border border-amber-500/40 text-amber-300 text-xs font-bold cursor-pointer"
                    >
                      บันทึกชื่อ
                    </button>
                    <select
                      value={t.color}
                      onChange={(e) =>
                        runAdmin(
                          () =>
                            api.api.admin.team.color.post(
                              { team: t.id, color: e.target.value as TeamColor },
                              authHeaders,
                            ),
                          `🎨 เปลี่ยนสีทีม ${t.id} แล้ว`,
                        )
                      }
                      className="px-2 py-1 rounded bg-slate-900 border border-slate-700 text-xs text-slate-200"
                    >
                      {Object.entries(TEAM_COLOR_META).map(([val, meta]) => (
                        <option key={val} value={val}>
                          {meta.label}
                        </option>
                      ))}
                    </select>
                  </div>
                ))}
              </div>
            </div>

            {/* AI Game Director & Custom Flash Quest */}
            <div className="border-t border-slate-800 pt-4 flex flex-wrap items-center justify-between gap-4">
              <div className="flex flex-wrap items-center gap-2">
                <button
                  disabled={busy}
                  onClick={() =>
                    runAdmin(
                      () => api.api.admin.quest.ai.post(undefined, authHeaders),
                      '🤖 AI Game Director ออกเควสด่วนใหม่แล้ว!',
                    )
                  }
                  className="px-4 py-2 rounded-xl bg-gradient-to-r from-violet-600 to-fuchsia-600 hover:from-violet-500 hover:to-fuchsia-500 text-white text-sm font-bold shadow cursor-pointer disabled:opacity-50"
                >
                  🤖 ให้ AI วิเคราะห์และสุ่มเควสด่วน
                </button>
              </div>

              <div className="flex flex-wrap items-center gap-2">
                <select
                  value={customItem}
                  onChange={(e) => {
                    const next = e.target.value;
                    setCustomItem(next);
                    const found = MC_QUEST_WHITELIST.find((w) => w.item === next);
                    if (found) setCustomCount(found.defaultCount);
                  }}
                  className="px-2.5 py-1.5 rounded-lg bg-slate-950 border border-slate-700 text-xs text-slate-200"
                >
                  {MC_QUEST_WHITELIST.map((w) => (
                    <option key={w.item} value={w.item}>
                      {w.thaiName} ({w.minCount}-{w.maxCount})
                    </option>
                  ))}
                </select>
                <input
                  type="number"
                  min={1}
                  max={64}
                  value={customCount}
                  onChange={(e) => setCustomCount(Number(e.target.value))}
                  className="w-16 px-2 py-1.5 rounded-lg bg-slate-950 border border-slate-700 text-xs text-white"
                />
                <button
                  disabled={busy}
                  onClick={() =>
                    runAdmin(
                      () =>
                        api.api.admin.quest.custom.post(
                          { item: customItem, count: customCount },
                          authHeaders,
                        ),
                      '⚡ เปิดเควสด่วนที่กำหนดเองแล้ว',
                    )
                  }
                  className="px-3 py-1.5 rounded-lg bg-amber-500 hover:bg-amber-400 text-slate-950 text-xs font-bold cursor-pointer"
                >
                  ส่งเควสนี้เข้าเกม
                </button>
              </div>
            </div>
          </section>
        )}

        {/* History: Quests + Snapshots + Audit Logs */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <section className="rounded-2xl border border-slate-800 bg-slate-900/70 p-5">
            <h3 className="text-base font-bold text-white mb-3">📜 ประวัติเควสด่วน (Database)</h3>
            {quests.length === 0 ? (
              <p className="text-xs text-slate-400">ยังไม่มีประวัติเควสด่วนที่สั่งจากเว็บ</p>
            ) : (
              <div className="space-y-2.5 max-h-64 overflow-y-auto pr-1">
                {quests.map((q) => (
                  <div
                    key={q.id}
                    className="p-2.5 rounded-xl bg-slate-950/70 border border-slate-800 text-xs"
                  >
                    <div className="flex items-center justify-between">
                      <span className="font-bold text-amber-300">{q.displayName}</span>
                      <span className="px-2 py-0.5 rounded bg-slate-800 text-slate-300">
                        {q.source}
                      </span>
                    </div>
                    {q.aiReason && <p className="text-slate-400 mt-1">{q.aiReason}</p>}
                  </div>
                ))}
              </div>
            )}
          </section>

          <section className="rounded-2xl border border-slate-800 bg-slate-900/70 p-5">
            <h3 className="text-base font-bold text-white mb-3">
              📊 บันทึกกิจกรรม & Audit Log ({snapshots.length} Snapshots)
            </h3>
            {audits.length === 0 ? (
              <p className="text-xs text-slate-400">ยังไม่มีประวัติคำสั่งแอดมิน</p>
            ) : (
              <div className="space-y-2 max-h-64 overflow-y-auto pr-1">
                {audits.map((a) => (
                  <div
                    key={a.id}
                    className="p-2 rounded-lg bg-slate-950/70 border border-slate-800 text-xs flex items-center justify-between gap-2"
                  >
                    <span className="font-mono text-sky-300">{a.action}</span>
                    <span className="text-slate-400 truncate max-w-48">{a.result}</span>
                  </div>
                ))}
              </div>
            )}
          </section>
        </div>
      </main>
    </div>
  );
}

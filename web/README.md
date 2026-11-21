# 🌐 NBs SMP Web Dashboard & AI Game Director (`web/`)

ระบบเว็บควบคุมและแสดงผลคะแนนสดสำหรับ **NBs_Datapack (Minecraft 26.3)** สร้างด้วย **Bun + Elysia + Eden Treaty + Drizzle ORM + PostgreSQL 16 + React + TailwindCSS**

## ความสามารถหลัก
* **Public Live Scoreboard:** ผู้เล่นทุกคนดูคะแนน 1–8 ทีม, คลังเพชร The Citadel, สถานะ Raid Day และเวลาเควสด่วน Bossbar แบบเรียลไทม์ผ่าน SSE (`/api/stream`) โดย **ไม่ยิง RCON ซ้ำเมื่อมีคนดูหลายคน** (ใช้ Single-flight Background Poller Cache)
* **Admin Control Panel:** ล็อกสิทธิ์ด้วย `ADMIN_TOKEN` — สั่ง Start Game, Auto-Ready, เปิด/ปิด Raid Day, Reset Lobby, ปรับจำนวนทีม 2–8 ทีม, เปลี่ยนชื่อและสีทีมได้ทันที
* **AI Game Director (`@google/genai`):** วิเคราะห์คะแนนทีมปัจจุบันแล้วเลือกเควสด่วนที่สมดุล พร้อม **Minecraft 26.3 Item Whitelist Guardrail** และ **Automatic Weighted Pool Fallback** เมื่อไม่มี API Key หรือ API ล่ม
* **Demo Mode:** สามารถเปิดทดสอบหน้าเว็บและ API ได้ทันทีแม้ยังไม่ได้เชื่อมต่อ PostgreSQL หรือ Minecraft RCON

---

## วิธีติดตั้งและรันบน Linux Fedora (Dedicated Server)

### 1. เปิด RCON ใน `server.properties` ของ Minecraft Server
```properties
enable-rcon=true
rcon.port=25575
rcon.password=your_strong_rcon_password
```
*(แนะนำให้เปิด Firewall เฉพาะเครื่องตัวเอง ไม่ต้องเปิด Port `25575` ออกเน็ตสาธารณะ)*

### 2. เปิด PostgreSQL 16 ด้วย Docker Compose
```bash
cd web
cp .env.example .env
# แก้ค่า RCON_PASSWORD, ADMIN_TOKEN, และ GEMINI_API_KEY (ถ้ามี) ใน .env
docker compose up -d db
```

### 3. ติดตั้ง Dependencies และรันระบบ
```bash
bun install
bun run db:push
bun run start
```
เปิดเบราว์เซอร์ที่ `http://localhost:3000` (หรือเปิดให้เพื่อนเข้าดูผ่าน **Cloudflare Tunnel**: `cloudflared tunnel --url http://localhost:3000`)

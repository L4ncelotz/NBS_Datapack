# ADR-001: NBs SMP Web Dashboard, RCON Poller & AI Quest Director Stack

- **Status:** Accepted
- **Date:** 2026-11-21
- **Scope:** `web/` (Web Server, RCON Integration, PostgreSQL Persistence, AI Quest Director, Public & Admin UI)

## Context and constraints
- เซิร์ฟเวอร์เกมเป็น **Minecraft 26.3 (NBs_Datapack)** รันบนเครื่อง **Dedicated Linux Fedora Laptop** (ไม่ได้เปิด Minecraft Client บนเครื่องนี้) ส่วนผู้เล่นและเจ้าของเครื่องเล่นจาก PC แยกต่างหาก
- ต้องเปิดให้ผู้เล่น/คนดูทุกคนเข้าดู **Live Dashboard** (ตารางคะแนน 1–8 ทีม, ประวัติ, เควสด่วน) ได้แบบสาธารณะ พร้อมแยกสิทธิ์ **Admin** สำหรับคุมเกม/จัดการทีม/สั่งสุ่มเควส
- ต้องการ **Database** เก็บประวัติคะแนนข้ามเวลา, ประวัติเควส, และ Audit Log รวมถึงระบบ **AI Random Boost Quest** และสามารถนำไปใช้เป็นผลงานใน **Portfolio หางาน** ได้
- ห้ามให้การที่มีคนดูรุมเปิดเว็บไปยิง RCON ซ้ำๆ จนเซิร์ฟเวอร์ Minecraft แลค และห้ามเปิดพอร์ต RCON (`25575`) ออกสู่สาธารณะโดยตรง

## Decision
เลือกใช้ **Optimal TypeScript Stack** แบบ Monorepo ภายใต้ `web/`:
- **Backend & Runtime:** **Bun + ElysiaJS** (TypeBox Schema Validation + SSE `/api/stream`)
- **End-to-End Type Safety:** **Eden Treaty (`@elysiajs/eden`)** เชื่อม Backend ↔ Frontend
- **Database & ORM:** **PostgreSQL 16 + Drizzle ORM** (รันผ่าน `docker-compose.yml` บน Fedora พร้อม Demo/In-Memory Fallback กรณียังไม่เปิด DB)
- **Game Integration:** **Native Binary TCP RCON Client + Single-flight Background Poller** (ดึงข้อมูลจาก `127.0.0.1:25575` รอบเดียวตามรอบเวลาแล้วอัปเดต Cache/DB)
- **AI Game Director:** **`@google/genai` (Gemini API)** พร้อม Structured Output, Whitelist ไอเทม Minecraft 26.3 จริง, และ Automatic Pool Fallback
- **Frontend:** **React + Vite + TailwindCSS**
- **Public Exposure (Fedora):** **Cloudflare Tunnel (`cloudflared`)** ชี้มาที่พอร์ตของ Web Server เท่านั้น

## Considered alternatives

| Alternative | Advantages | Trade-offs / reasons not selected |
| --- | --- | --- |
| **Go + PostgreSQL + React** | Binary TCP RCON & Concurrency เบาและคลีนมาก, Compile เป็นไฟล์เดียวบน Fedora | เขียน JSON Schema/AI Guardrails ยาวกว่า TS และแยกเป็น 2 ภาษา (Go + TS) |
| **Python (FastAPI) + SQLite/Postgres** | Pydantic + AI SDK แข็งแรงมาก, มี Python 3.12 พร้อมใช้ | ไม่ได้ End-to-End Type Safety เชื่อมถึง React เท่า Bun + Elysia + Eden และต้องจัดการ Python venv แยก |
| **Node.js Zero-Dep + In-Memory** | รันคำสั่งเดียวจบ ไม่ต้องลง Package/Docker | ไม่รองรับ Database History และการทำ End-to-End Type Safety / Drizzle ORM |

## Rationale and evidence
- เครื่อง Fedora ทำหน้าที่เป็น Dedicated Server Box (ไม่รันเกม Client) จึงรัน **PostgreSQL 16** ได้โดยไม่เบียดทรัพยากรกับ Minecraft Client
- **Bun + Elysia + Eden Treaty + Drizzle + React** ทำให้ทั้งระบบเป็น **TypeScript 100% แบบ Type-safe ตลอดเส้นทาง** (ตั้งแต่ SQL Schema → API Validation → Frontend Client) ซึ่งเป็นจุดขายชัดเจนสำหรับ Portfolio สาย Full-Stack / Product Engineer
- Background RCON Poller แยกการอ่านค่าจากเกมออกจาก Traffic ของผู้ชม ทำให้เซิร์ฟเวอร์ Minecraft รับโหลด RCON คงที่ ไม่แปรผันตามจำนวนคนเปิดเว็บ

## Assumptions and uncertainties
- **จำนวนผู้เข้าชมพร้อมกัน:** ประเมินว่าอยู่ในระดับหลักสิบคน *(estimate — not measured)* เหมาะกับ Single-instance Bun + Postgres บน Fedora
- **RCON Stability:** คาดว่า Minecraft Dedicated Server 26.3 รองรับการดึง Scoreboard/Data Storage ผ่าน RCON ทุกๆ 2–3 วินาทีได้โดยไม่กระทบ TPS (ต้องทดสอบวัดผลจริงหลังเชื่อมเซิร์ฟ)
- **AI API:** ใช้ External API (Gemini) จึงต้องพึ่งการเชื่อมต่ออินเทอร์เน็ตและ API Key (มี Fallback สุ่มจากคลังใน DB รองรับเมื่อไม่มี Key หรือ API ล่ม)

## Consequences and risks
- **Operational:** บน Fedora ต้องติดตั้ง `bun` และ `docker` (หรือ `postgresql`) เพิ่ม รวมถึงตั้งค่า `enable-rcon=true` ใน `server.properties`
- **Security:** หากตั้ง `ADMIN_TOKEN` หรือ `rcon.password` อ่อนอาจถูกยิงคำสั่งควบคุมเกมได้ จึงต้องบังคับ Token ผ่าน Env และผูก RCON ไว้ที่ `127.0.0.1` เท่านั้น
- **AI Hallucination:** หาก AI ตอบ Item ID ผิดหรือจำนวนมากเกินไป เควสในเกมจะไม่ทำงาน/เสียสมดุล จึงต้องบังคับ Whitelist ไอเทมจาก MC 26.3 และ Clamp จำนวนก่อนส่งเข้า RCON

## Validation / revisit triggers
- **ต้องทดสอบหลังสร้าง:** ทดสอบ `tsc --noEmit`, ทดสอบ RCON Polling TPS บน Fedora Server จริง, ทดสอบ Auth Barrier และ AI Whitelist Fallback
- **Revisit Triggers:**
  1. หากคนดูพร้อมกันเพิ่มถึงระดับหลายร้อย–พันคนจนอัปโหลด/CPU เครื่อง Fedora เต็ม → ย้าย Frontend/Read-Replica ขึ้น Cloud
  2. หากต้องการให้ AI วิเคราะห์ข้อมูลเชิงลึก/Vector Search ซับซ้อนขึ้น → แยก AI Service ออกมาเป็น Python Worker

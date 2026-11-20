# 📖 คู่มือรวมคำสั่งระบบ NBs SMP Datapack

เอกสารรวบรวมคำสั่งทั้งหมดใน Datapack แบ่งตามหมวดหมู่ระบบ เพื่อให้ผู้ดูแลและผู้เล่นใช้งานได้อย่างสะดวก

---

## 📑 สารบัญ
1. [🌀 ระบบสุ่มจุดเกิดและเกิดใหม่ (Random Teleport - RTP)](#1-ระบบสุ่มจุดเกิดและเกิดใหม่-random-teleport---rtp)
2. [⚔️ ระบบป้ายชื่อคะแนนและการสังหาร (Kill Reward)](#2-ระบบป้ายชื่อคะแนนและการสังหาร-kill-reward)
3. [🚩 ระบบธงอาณาเขต (Territory System)](#3-ระบบธงอาณาเขต-territory-system)
4. [🛡️ ระบบจุดเกิดและพื้นที่ปลอดภัย (Spawn & Safezone)](#4-ระบบจุดเกิดและพื้นที่ปลอดภัย-spawn--safezone)
5. [👥 ระบบทีมและการจัดการ (Team Management)](#5-ระบบทีมและการจัดการ-team-management)
6. [📊 ระบบตารางคะแนนและสถิติ (Scoreboard & Stats)](#6-ระบบตารางคะแนนและสถิติ-scoreboard--stats)
7. [🚫 ระบบป้องกัน Ender Chest (Anti-Enderchest)](#7-ระบบป้องกัน-ender-chest-anti-enderchest)
8. [🌐 ระบบขอบเขตโลก (World Border)](#8-ระบบขอบเขตโลก-world-border)
9. [⚙️ คำสั่งทั่วไปและคำสั่งแอดมิน (General & Admin)](#9-คำสั่งทั่วไปและคำสั่งแอดมิน-general--admin)

---

## 1. 🌀 ระบบสุ่มจุดเกิดและเกิดใหม่ (Random Teleport - RTP)
ระบบจะสุ่มวาร์ปผู้เล่นกระจายตัวออกไปในป่าในพื้นที่โลก 5,000 บล็อก (แบ่งสุ่ม 4 ทิศทางรอบโลก ไม่ตกในเขต Spawn 100%) พร้อมบัฟกันดาเมจตกจากที่สูงและดาเมจทุกชนิด 5 วินาที

### กลไกการทำงาน
1. **เข้าเซิร์ฟครั้งแรก (First Join):**
   * ทันทีที่ผู้เล่นเข้าเซิร์ฟเวอร์ครั้งแรก ระบบจะสุ่มวาร์ปกระจายตัว 4 ทิศทางในระยะ 5,000 บล็อกทันที (ห่างจากจุด Spawn อย่างน้อย 200 บล็อกเสมอ)
   * ได้รับ Resistance 255, Slow Falling, Fire Resistance นาน 5 วินาที
   * มี Title ข้อความต้อนรับและเสียง Level Up
2. **ตายแบบไม่มีเตียง (No Bed Respawn):**
   * หากผู้เล่นตายโดย**ไม่ได้นอนเตียง**หรือไม่มี Respawn Anchor (ทำให้ตัวละครเด้งกลับมาเกิดที่จุด Spawn กลาง) ระบบตรวจจับทันทีที่กดปุ่ม Respawn และสุ่มวาร์ปดีดออกไปเกิดใหม่ในป่า 5,000 บล็อกทันที
   * หากผู้เล่น**มีเตียงหรือ Respawn Anchor** จะเกิดที่เตียงตามปกติ ไม่โดนสุ่มวาร์ป
3. **ระบบป้องกันการตกใน Spawn (Anti-Spawn Zone Fallback):**
   * ระบบกระจายตัวรอบนอก 4 ทิศทาง (+X,+Z, -X,+Z, +X,-Z, -X,-Z) ในระยะพิกัด 200 ถึง 4,800 บล็อก จึงไม่มีโอกาสตกในเขต Spawn กลาง
   * มีระบบตรวจจับสำรองขั้นสูงสุด หากตกในระยะ 150 บล็อกของ Spawn จะดีดออกสู่ป่ารอบนอกซ้ำทันที

### คำสั่งสำหรับแอดมิน / ทดสอบ
* **สั่งสุ่มวาร์ป RTP ทันที (Manual RTP):**
  ```mcfunction
  /function nbs:rtp/trigger_rtp
  ```
* **รีเซ็ตสถานะเข้าเซิร์ฟครั้งแรกของผู้เล่น (เพื่อให้โดน First Join RTP อีกครั้ง):**
  ```mcfunction
  /tag <ชื่อผู้เล่น> remove rtp_joined
  ```

---

## 2. ⚔️ ระบบป้ายชื่อคะแนนและการสังหาร (Kill Reward)
ระบบจะดรอปป้ายชื่อคะแนน (+5 คะแนน) ทันทีเมื่อผู้เล่นสังหารผู้เล่นคนอื่นในโหมด PvP

### คำสั่งเสกป้ายชื่อคะแนน (สำหรับทดสอบ / แอดมิน)
* **วิธีที่ 1 (แนะนำ - รันผ่านฟังก์ชันสั้น):**
  ```mcfunction
  /function nbs:kill_reward/give_nametag
  ```

* **วิธีที่ 2 (พิมพ์คำสั่ง `/give` โดยตรง):**
  ```mcfunction
  /give @s minecraft:name_tag[custom_data={score_tag:1b},custom_name={text:"ป้ายชื่อคะแนน (+5)",color:"gold",bold:true,italic:false},lore=[{text:"ได้รับจากการสังหารผู้เล่น",color:"gray",italic:false},{text:"มูลค่า 5 คะแนน",color:"yellow",italic:false},{text:"⚠️ ห้ามซ่อนใน Ender Chest",color:"red",italic:false}]] 1
  ```

---

## 3. 🚩 ระบบธงอาณาเขต (Territory System)
การวางธงสีขาว (`White Banner`) จะสร้างอาณาเขตขนาดรัศมี 32 บล็อกรอบธง โดยหีบ/ถังที่อยู่ในเขตธงจะนับคะแนนไข่มังกรและป้ายชื่อเข้าทีม

### คำสั่งสำหรับผู้เล่น
* **ดูพิกัดธงอาณาเขตทั้งหมดของทีมตัวเอง:**
  ```mcfunction
  /trigger check_flag
  ```
  *(ระบบจะพิมพ์รายการพิกัด X Y Z ของธงทีมตนเองทั้งหมดลงในช่องแชต)*

### คำสั่งสำหรับแอดมิน
* **ดูพิกัดธงอาณาเขตทุกต้นในเซิร์ฟเวอร์:**
  ```mcfunction
  /execute as @e[type=minecraft:marker,tag=flag_anchor] run function nbs:territory/print_single_flag
  ```
* **ตรวจสอบจำนวนธงที่ทีมครอบครอง:**
  ```mcfunction
  /scoreboard players get <ชื่อผู้เล่น> flag_count
  ```
* **ล้าง/ลบหมุดธงทั้งหมดในเซิร์ฟเวอร์ (ฉุกเฉิน):**
  ```mcfunction
  /kill @e[type=minecraft:marker,tag=flag_anchor]
  ```

---

## 4. 🛡️ ระบบจุดเกิดและพื้นที่ปลอดภัย (Spawn & Safezone)
พื้นที่ Spawn มีขนาด 5 Chunk (160x160 บล็อก) ปิด PvP, ปิดความเสียหายจาก TNT/Creeper, บังคับโหมด Adventure เพื่อป้องกันการทุบบล็อก และมี Particle สีเขียวแสดงแนวเขต

### คำสั่งเปลี่ยนตำแหน่งจุด Spawn / Safezone
1. พิมพ์คำสั่งลบจุด Spawn เดิม:
   ```mcfunction
   /kill @e[tag=spawn_anchor]
   ```
2. ยืนตรงตำแหน่งใหม่ที่ต้องการ แล้วพิมพ์คำสั่งเสกหมุด Spawn ใหม่:
   ```mcfunction
   /summon minecraft:marker ~ ~ ~ {Tags:["spawn_anchor"]}
   ```

### คำสั่งสิทธิ์แอดมินในจุด Safezone
* **ให้สิทธิ์แอดมินทุบ/วางบล็อกในจุด Safezone ได้ (ไม่ติด Adventure Mode):**
  ```mcfunction
  /tag <ชื่อผู้เล่น> add admin
  ```
* **ถอนสิทธิ์แอดมิน:**
  ```mcfunction
  /tag <ชื่อผู้เล่น> remove admin
  ```

---

## 5. 👥 ระบบทีมและการจัดการ (Team Management)
ในระบบมีตารางคะแนน 4 ทีมหลัก (ทีมที่ 1 ถึง ทีมที่ 4) และระบบทีมย่อย

### กำหนดทีมคะแนนให้ผู้เล่น (ทีมที่ 1 - 4)
* **เข้าทีมที่ 1:** `/scoreboard players set <ชื่อผู้เล่น> team_id 1`
* **เข้าทีมที่ 2:** `/scoreboard players set <ชื่อผู้เล่น> team_id 2`
* **เข้าทีมที่ 3:** `/scoreboard players set <ชื่อผู้เล่น> team_id 3`
* **เข้าทีมที่ 4:** `/scoreboard players set <ชื่อผู้เล่น> team_id 4`
* **ออกจากทีม (คะแนนไม่รวมเข้าทีมใด):** `/scoreboard players set <ชื่อผู้เล่น> team_id 0`

### การจัดการทีมวานิลลา (ซ่อนป้ายชื่อคนละทีม / ปิดตีกันเอง)
* **เพิ่มผู้เล่นเข้า Team A:** `/team join team_a <ชื่อผู้เล่น>`
* **เพิ่มผู้เล่นเข้า Team B:** `/team join team_b <ชื่อผู้เล่น>`
* **รันตั้งค่าทีมเริ่มต้นใหม่:** `/function nbs:team/team_setup`

---

## 6. 📊 ระบบตารางคะแนนและสถิติ (Scoreboard & Stats)

### คำสั่งสำหรับผู้เล่น
* **เปิดดูสมุดบันทึกสถิติ (Stats Book):**
  ```mcfunction
  /trigger view_stats
  ```
  *(แสดงจำนวนการปราบบอส Dragon, Wither, Warden, Elder, Raid, Trial และคะแนนรวมทั้งหมด)*

### กฎการคิดคะแนน
* **ป้ายชื่อคะแนนในตัว / ในกล่องของทีม:** ชิ้นละ **5** คะแนน
* **ไข่มังกรในตัว / ในกล่องของทีม:** ชิ้นละ **100** คะแนน
* **Ender Dragon:** ตัวละ **50** คะแนน
* **Wither:** ตัวละ **25** คะแนน
* **Warden:** ตัวละ **15** คะแนน
* **Elder Guardian:** ตัวละ **10** คะแนน
* **Illager Raid:** รอบละ **7** คะแนน
* **Ominous Trial Chamber:** รอบละ **15** คะแนน

### 📦 ระบบกล่องคะแนนแยกทีม (Team Chest Scoring)
คะแนนของไอเทมในกล่อง/ถังจะคำนวณเข้าทีมที่เป็นเจ้าของกล่องนั้นทันที (หากผู้เล่นทีมอื่นแอบเอาป้ายชื่อ/ไข่มังกรมาใส่ในกล่องของทีมใด ทีมเจ้าของกล่องนั้นจะได้รับคะแนนไปทันที):
1. **การตรวจจับความเป็นเจ้าของกล่อง (3 ลำดับ):**
   * **ลำดับที่ 1 (แนะนำที่สุด):** วางกล่องไว้ภายในรัศมี **32 บล็อก** ของธงอาณาเขต (`White Banner`) ของทีมใด กล่องนั้นจะสังกัดทีมนั้นโดยอัตโนมัติ
   * **ลำดับที่ 2:** ตั้งชื่อกล่องที่ทั่ง (Anvil) เป็นชื่อทีม เช่น `Team 1` หรือ `ทีม 1` (รองรับ Team 1 ถึง Team 4)
   * **ลำดับที่ 3:** ดึงทีมของผู้เล่นที่เป็นคนวางหรือเปิดกล่องนั้น
2. **การบันทึกกล่องเข้าสู่ระบบ:**
   * ระบบจะตรวจจับและฝังหมุดกล่องอัตโนมัติทันทีเมื่อมีคน **วางกล่อง** หรือ **คลิกเปิดกล่อง**
   * หรือสั่งบันทึกกล่องด้วยมือ (หันหน้ามองกล่องแล้วพิมพ์):
     ```mcfunction
     /function nbs:scoreboard/register_chest
     ```

### คำสั่งสำหรับแอดมิน
* **รีเซ็ตคะแนนทีมทั้งหมดเป็น 0:**
  ```mcfunction
  /scoreboard players set ทีมที่_1 team_score 0
  /scoreboard players set ทีมที่_2 team_score 0
  /scoreboard players set ทีมที่_3 team_score 0
  /scoreboard players set ทีมที่_4 team_score 0
  ```
* **รีเซ็ตสถิติผู้เล่น:**
  ```mcfunction
  /scoreboard players reset <ชื่อผู้เล่น> stat_dragon
  /scoreboard players reset <ชื่อผู้เล่น> stat_wither
  /scoreboard players reset <ชื่อผู้เล่น> stat_warden
  /scoreboard players reset <ชื่อผู้เล่น> stat_elder
  /scoreboard players reset <ชื่อผู้เล่น> stat_raid
  /scoreboard players reset <ชื่อผู้เล่น> stat_trial
  ```

---

## 7. 🚫 ระบบป้องกัน Ender Chest (Anti-Enderchest)
ระบบจะตรวจจับช่อง Ender Chest ของผู้เล่นทุกคนตลอดเวลา:
* หากมี **ไข่มังกร (`minecraft:dragon_egg`)** หรือ **ป้ายชื่อคะแนน (`score_tag:1b`)** อยู่ใน Ender Chest
* ตัวไอเทมจะถูกดีดหล่นลงพื้นตรงเท้าของผู้เล่นทันที พร้อมส่ง Actionbar เตือนสีแดง

---

## 8. 🌐 ระบบขอบเขตโลก (World Border)
* **ตั้งค่าขนาด World Border ตามค่าเริ่มต้น (10,000 บล็อก):**
  ```mcfunction
  /function nbs:border/border_setup
  ```
* **ปรับขนาดขอบโลกตามต้องการ:**
  ```mcfunction
  /worldborder set <ระยะบล็อก>
  ```
  *(ตัวอย่าง: `/worldborder set 5000`)*

---

## 9. ⚙️ คำสั่งทั่วไปและคำสั่งแอดมิน (General & Admin)
* **รีโหลดระบบ Datapack หลังแก้ไขไฟล์:**
  ```mcfunction
  /reload
  ```
* **รันระบบเริ่มต้นใหม่ทั้งหมด (เหมือนเข้าแมปครั้งแรก):**
  ```mcfunction
  /function nbs:main_load
  ```
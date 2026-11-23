# ==========================================
# ละอองระยิบระยับลอยอยู่ในรัศมี 20 บล็อกรอบกล่องที่ซ่อนไอเท็มนอกเขตธง
# ==========================================

# 1. ละอองแสงประกายระยิบระยับลอยฟุ้งกระจายในรัศมี 20 บล็อก (dx=14, dy=6, dz=14)
particle minecraft:end_rod ~ ~2 ~ 14 6 14 0.02 35 force
particle minecraft:wax_off ~ ~2 ~ 14 6 14 0 25 force
particle minecraft:electric_spark ~ ~2 ~ 12 5 12 0.03 20 force
particle minecraft:firework ~ ~2 ~ 10 5 10 0.02 10 force

# 2. ประกายแสงเข้มข้นตรงตัวกล่องที่ซ่อนไอเท็ม
particle minecraft:end_rod ~ ~0.7 ~ 0.3 0.3 0.3 0.01 4 force
particle minecraft:wax_off ~ ~0.7 ~ 0.3 0.3 0.3 0 4 force

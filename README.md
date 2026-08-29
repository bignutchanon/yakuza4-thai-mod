# Yakuza 4 Remastered — Thai Translation (ม็อดแปลไทย)

แปลไทย Yakuza 4 Remastered ครบ: เนื้อเรื่องหลัก · บทสนทนา NPC · เควสเสริม · ซับ cutscene · คาราโอเกะ (HACT) · เมนู · ตัวเลือก (ใช่/ไม่) · ชื่อไอเทม/สกิล · ฟอนต์ไทยพร้อมระบบวางวรรณยุกต์/สระซ้อนบนพยัญชนะ

Full Thai translation of Yakuza 4 Remastered: main story, NPC dialogue, substories, cutscene subtitles, karaoke, menus, choice prompts, item/skill names, and a Thai font with proper tone/vowel mark stacking.

## ดาวน์โหลด / Download

โหลดไฟล์ `Yakuza4-Thai-Mod-v2.2.zip` จากหน้า [Releases](../../releases/latest)

## การติดตั้ง / Installation

1. แตกไฟล์ zip จะเห็นโฟลเดอร์ `Yakuza 4`
2. Steam → คลิกขวาเกม → Manage → Browse local files → ย้อนกลับ 1 ชั้น (ให้เห็นโฟลเดอร์ `Yakuza 4`)
3. ลากโฟลเดอร์ `Yakuza 4` จากในซิปมาวางทับ → กด Replace
4. เปิดเกมจาก Steam กด Play ได้เลย ไม่ต้องตั้ง Launch Options ไม่ต้องเปิดโปรแกรมเสริม

พอเข้าเมนูรอสัก 10 วินาที สระ/วรรณยุกต์จะเด้งเข้าที่เอง (ช่วงแรกอาจเห็นสระลอยแวบนึง = ปกติ)

**English:** Extract, drop the `Yakuza 4` folder into `steamapps/common/` and overwrite, then launch normally. Wait ~10s at the menu for the mark-stacking to kick in.

## การถอน / Uninstall

- ลบไฟล์ `dinput8.dll` ในโฟลเดอร์เกม = หยุดตัวทำสระซ้อน (ไม่ได้แก้ไฟล์เกม)
- ถอนตัวแปล = Steam → Properties → Installed Files → Verify integrity

## หมายเหตุ / Notes

- `dinput8.dll` แก้หน่วยความจำเกมตอนเล่นเท่านั้น ไม่แตะไฟล์เกม แอนตี้ไวรัสอาจเตือน = false positive
- ถ้า Steam อัปเดตเกม หรือกด Verify integrity ตัวแปลจะหาย ต้องลงใหม่
- ต้องมีเกม Yakuza 4 Remastered (Steam) เวอร์ชันภาษาอังกฤษ

## มีอะไรในซิป

| ไฟล์ | คือ |
|---|---|
| `Yakuza 4/dinput8.dll` | ตัวทำสระ/วรรณยุกต์ซ้อน (เกมโหลดเอง) |
| `Yakuza 4/data/fontpar/font_hd_en.par` | ฟอนต์ไทย |
| `Yakuza 4/data/bootpar/boot_en.par` | เมนู + ชื่อไอเทม/สกิล |
| `Yakuza 4/data/wdr_par_en/wdr.par` | บทพูดเนื้อเรื่อง + NPC |
| `Yakuza 4/data/auth/subtitle.par` | ซับ cutscene |
| `Yakuza 4/data/hact/subtitle.par` | คาราโอเกะ / HACT |

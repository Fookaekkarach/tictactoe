# Tic Tac Toe Flutter
## วิธีการ Setup และ Run โปรแกรม 
* การ Run สามารถดาวน์โหลดไปแล้ว Run ได้เลย
* การติดตั้งไฟล์ apk สำหรับมือถือ android หรือ simulator android ให้ดาวน์โหลดไฟล์ชื่อ app-release.apk ไปติดตั้งบนมือถือ android หรือ simulator android ได้เลย
## วิธีการออกแบบ และ Algorithm ที่ใช้
* ในงานนี้ใช้ Flutter Framework และใช้ภาษา Dart ในการพัฒนา
* Algorithm สำหรับการเช็คการชนะของเกม 3x3 แบ่งเป็น 4 กรณีก็คือ แนวตั้ง แนวนอน แนวทะแยงจากซ้ายบนลงขวาล่าง และแนวทะแยงจากขวาบนลงซ้ายล่าง
   * แนวตั้ง จะวนลูปเช็คคอลัมน์ ซึ่ง 3x3 มี 3คอลัมน์ก็วนลูป3ครั้ง ในแต่ละรอบ ก็จะเช็ค ตัวที่1ถ้าไม่ว่างก็ไปเช็คตัวที่2เว่าเหมือนตัวที่1ไหม เช็คเทียบกันไปแบบนี้จนถึงตัวสุดท้ายคือตัวที่3 ถ้าเงื่อนไขทั้งหมดเป็นจริง แสดงว่ามีการชนะ
``` dart
    for (int col = 0; col < 3; col++) {
      if (channelStatus[0][col] != NONE &&
          channelStatus[0][col] == channelStatus[1][col] &&
          channelStatus[1][col] == channelStatus[2][col]) {
        return true;
      }
```
   * แนวนอน จะวนลูปเช็คแถว ซึ่ง 3x3 มี 3แถวก็วนลูป3ครั้ง ในแต่ละรอบ ก็จะเช็ค ตัวที่1ถ้าไม่ว่างก็ไปเช็คตัวที่2เว่าเหมือนตัวที่1ไหม เช็คเทียบกันไปแบบนี้จนถึงตัวสุดท้ายคือตัวที่3 ถ้าเงื่อนไขทั้งหมดเป็นจริง แสดงว่ามีการชนะ
``` dart
    for (int row = 0; row < 3; row++) {
      if (channelStatus[row][0] != NONE &&
          channelStatus[row][0] == channelStatus[row][1] &&
          channelStatus[row][1] == channelStatus[row][2]) {
        return true;
      }
    }
```
``` dart
```

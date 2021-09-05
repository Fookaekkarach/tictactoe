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
* แนวทะแยงจากซ้ายบนลงขวาล่าง และ และแนวทะแยงจากขวาบนลงซ้ายล่าง กรณีนี้มีแค่ 2 กรณี เราก็เช็คกรณีละ 1 รอบ ถ้าเทียบข้อมูลแล้วตรงกันทั้งหมดแสดงว่ามีการชนะ
``` dart
    //แนวทะแยงจากซ้ายบนลงขวาล่าง
    if (channelStatus[0][0] != NONE &&
        channelStatus[0][0] == channelStatus[1][1] &&
        channelStatus[1][1] == channelStatus[2][2]) {
      return true;
    }
    //และแนวทะแยงจากขวาบนลงซ้ายล่าง
    if (channelStatus[0][2] != NONE &&
        channelStatus[0][2] == channelStatus[1][1] &&
        channelStatus[1][1] == channelStatus[2][0]) {
      return true;
    }
```
* ส่วนการเช็คเสมอนั้น จะวนลูปเช็คทุกตัว ถ้าทุกตัวนั้นไม่มีค่า NONE(ค่าว่าง)แสดงว่ามีการเสมอ
``` dart
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (channelStatus[row][col] == NONE) {
          return false;
        }
      }
    }
```
* ต่อมาเป็น Algorithm ของ 5x5 จะคล้ายกับ 3x3 แต่มีขนาดช่องที่เยอะเยอะกว่าก็เลยต้องเช็คหลายรอบกว่า แบ่งเป็น 4 กรณีก็คือ แนวตั้ง แนวนอน แนวทะแยงจากซ้ายบนลงขวาล่าง และแนวทะแยงจากขวาบนลงซ้ายล่าง
* แนวตั้ง จะวนลูปเช็คคอลัมน์ ซึ่ง 5x5 มี 5คอลัมน์ก็วนลูป5ครั้ง ในแต่ละรอบจะเช็คอยู่2ครั้ง ครั้งที่1ก็จะเช็คตัวที่1ถ้าไม่ว่างก็ไปเช็คตัวที่2เว่าเหมือนตัวที่1ไหม เช็คเทียบกันไปแบบนี้จนถึงตัวสุดท้ายคือตัวที่4 ถ้าเงื่อนไขทั้งหมดเป็นจริง แสดงว่ามีการชนะ ครั้งที่2จะเช็คตัวที่2ลงมาจนถึงตัวที่5 เพราะ5x5เช็ครอบเดียวจะไม่ได้ผลลัพธ์ ถ้ามีการชนะตัวที่2ถึง5 เลยแบ่งกันเช็คครั้งละ 4 ตัว คือ 1ถึง4 และ 2ถึง5 
``` dart
     for (int col = 0; col < 5; col++) {
      if (channelStatus[0][col] != NONE) {
        if (channelStatus[0][col] != NONE &&
            channelStatus[0][col] == channelStatus[1][col] &&
            channelStatus[1][col] == channelStatus[2][col] &&
            channelStatus[2][col] == channelStatus[3][col]) {
          return true;
        }
      } else {
        if (channelStatus[1][col] != NONE &&
            channelStatus[1][col] == channelStatus[2][col] &&
            channelStatus[2][col] == channelStatus[3][col] &&
            channelStatus[3][col] == channelStatus[4][col]) {
          return true;
        }
      }
    }
```
* แนวนอนมีการทำงานเหมือนกับแนวตั้ง เพียงแค่เปลี่ยนเป็นวนลูปของแถว
``` dart
    for (int row = 0; row < 5; row++) {
      if (channelStatus[row][0] != NONE) {
        if (channelStatus[row][0] != NONE &&
            channelStatus[row][0] == channelStatus[row][1] &&
            channelStatus[row][1] == channelStatus[row][2] &&
            channelStatus[row][2] == channelStatus[row][3]) {
          return true;
        }
      } else {
        if (channelStatus[row][1] != NONE &&
            channelStatus[row][1] == channelStatus[row][2] &&
            channelStatus[row][2] == channelStatus[row][3] &&
            channelStatus[row][3] == channelStatus[row][4]) {
          return true;
        }
      }
    }
```
* ต่อมาแนวทะแยง ถ้าเป็น3x3จะมีแค่2กรณี แต่สำหรับ5x5นั้นมี 6 กรณี แบ่งเป็น แนวทะแยงจากซ้ายบนลงขวาล่าง3กรณี และขวาบนลงซ้ายล่างอีก3กรณี 
``` dart
// ตรวจสอบทะแยงซ้ายลงไปขวา ตรงกลาง
    if (channelStatus[0][0] != NONE) {
      if (channelStatus[0][0] != NONE &&
          channelStatus[0][0] == channelStatus[1][1] &&
          channelStatus[1][1] == channelStatus[2][2] &&
          channelStatus[2][2] == channelStatus[3][3]) {
        return true;
      }
    } else {
      if (channelStatus[1][1] != NONE &&
          channelStatus[1][1] == channelStatus[2][2] &&
          channelStatus[2][2] == channelStatus[3][3] &&
          channelStatus[3][3] == channelStatus[4][4]) {
        return true;
      }
    }
    // ตรวจสอบทะแยงซ้ายลงไปขวา ด้านซ้าย
    if (channelStatus[1][0] != NONE &&
        channelStatus[1][0] == channelStatus[2][1] &&
        channelStatus[2][1] == channelStatus[3][2] &&
        channelStatus[3][2] == channelStatus[4][3]) {
      return true;
    }
    // ตรวจสอบทะแยงซ้ายลงไปขวา ด้านขวาขวา
    if (channelStatus[0][1] != NONE &&
        channelStatus[0][1] == channelStatus[1][2] &&
        channelStatus[1][2] == channelStatus[2][3] &&
        channelStatus[2][3] == channelStatus[3][4]) {
      return true;
    }
```
``` dart
```
``` dart
```
``` dart
```
``` dart
```

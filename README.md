# Tic Tac Toe Flutter
## วิธีการ Setup และ Run โปรแกรม 
* การ Run สามารถดาวน์โหลดไปแล้ว Run ได้เลย
* การติดตั้งไฟล์ apk สำหรับมือถือ android หรือ simulator android ให้ดาวน์โหลดไฟล์ชื่อ app-release.apk ไปติดตั้งบนมือถือ android หรือ simulator android ได้เลย
## วิธีการออกแบบ และ Algorithm ที่ใช้
* ในงานนี้ใช้ Flutter Framework และใช้ภาษา Dart ในการพัฒนา
* Algorithm สำหรับการเช็คการชนะของเกม 3x3 แบ่งเป็น 4 กรณีก็คือ แนวตั้ง แนวนอน แนวทะแยงจากซ้ายบนลงขวาล่าง และแนวทะแยงจากขวาบนลงซ้ายล่าง
  * แนวตั้ง
  * ```dart
  * for (int col = 0; col < 3; col++) {
      if (channelStatus[0][col] != NONE &&
          channelStatus[0][col] == channelStatus[1][col] &&
          channelStatus[1][col] == channelStatus[2][col]) {
        return true;
      }
    }
  * ```

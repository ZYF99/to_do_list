import 'dart:core';

class DateUtil {
  // 获取月天数
  static int getDaysInMonth(int year, int month) {
    int days = 0;
    if (month != 2) {
      switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
          days = 31;
          break;
        case 4:
        case 6:
        case 9:
        case 11:
          days = 30;
      }
    } else {
      // 闰年
      if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
        days = 29;
      else
        days = 28;
    }
    return days;
  }
}

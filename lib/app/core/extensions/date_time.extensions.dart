import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  int get daysInMonth {
    // Move to the first day of the next month
    final beginningNextMonth = (month < 12)
        ? DateTime(year, month + 1, 1)
        : DateTime(year + 1, 1, 1);

    // Subtract one day to get the last day of the current month
    final lastDayThisMonth = beginningNextMonth.subtract(Duration(days: 1));
    return lastDayThisMonth.day;
  }

  String toYMD() {
    try {
      return DateFormat("yyyy-MM-d").format(this);
    } catch (e) {
      return this.toString();
    }
  }

  String toDMY() {
    try {
      return DateFormat("dd-MM-yyyy").format(this);
    } catch (e) {
      return this.toString();
    }
  }

  String toMDY() {
    try {
      return DateFormat("MM-dd-yyyy").format(this);
    } catch (e) {
      return this.toString();
    }
  }

  String toMonthDY() {
    try {
      return DateFormat("MMMM d, yyy").format(this);
    } catch (e) {
      return this.toString();
    }
  }

  String toDayDateMonthYearTime() {
    try {
      return DateFormat("EEE, d MMMM yyy, hh:mm a").format(this);
    } catch (e) {
      return this.toString();
    }
  }

  // DateTime get startOfWeek {
  //   return subtract(Duration(days: weekday - DateTime.monday));
  // }

  DateTime get startOfWeek {
    return subtract(Duration(days: weekday - DateTime.monday + 1));
  }

  String toDay() {
    return day.toString().padLeft(2, '0');
  }

  String toMonth() {
    return _monthAbbreviation(month);
  }

  String _monthAbbreviation(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  bool isBefore() {
    try {
      return this.isBefore(DateTime.now());
    } catch (e) {
      return false;
    }
  }
}

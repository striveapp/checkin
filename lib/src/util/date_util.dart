import 'package:intl/intl.dart';

class DateUtil {
  getToday() {
    DateTime now = DateTime.now();
    return DateFormat('dd MMM').format(now);
  }

  getFirstDayOfTheWeekMilliseconds() {
    DateTime today = DateTime.now();
    DateTime firstDayOfTheWeek = today.subtract(new Duration(days: today.weekday - 1));

    return firstDayOfTheWeek.millisecondsSinceEpoch;
  }

  getFirstDayOfTheMonthMilliseconds() {
    DateTime now = DateTime.now();
    DateTime firstDayOfTheMonth = DateTime(now.year, now.month, 1);

    return firstDayOfTheMonth.millisecondsSinceEpoch;
  }

  getFirstDayOfTheYearMilliseconds() {
    DateTime now = DateTime.now();
    DateTime firstDayOfTheYear = DateTime(now.year, 1, 1);

    return firstDayOfTheYear.millisecondsSinceEpoch;
  }
}
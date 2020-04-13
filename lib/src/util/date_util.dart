import 'package:checkin/src/constants.dart' as constants;

class DateUtil {
  static DateTime _getFirstDayOfTheWeek() {
    DateTime now = DateTime.now();
    return now.subtract(new Duration(days: now.weekday - 1));
  }

  static DateTime _getFirstDayOfTheMonth() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  static DateTime _getFirstDayOfTheYear() {
    DateTime now = DateTime.now();
    return DateTime(now.year, 1, 1);
  }

  static DateTime getFirstDayOfTimespan(String timespan) {
    if (timespan == constants.WEEK) {
      return _getFirstDayOfTheWeek();
    } else if (timespan == constants.MONTH) {
      return _getFirstDayOfTheMonth();
    }
    return _getFirstDayOfTheYear();
  }
}
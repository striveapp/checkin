import 'package:checkin/src/constants.dart' as constants;

class DateUtil {
  DateTime getFirstDayOfTheWeek() {
    DateTime today = DateTime.now();
    return today.subtract(new Duration(days: today.weekday - 1));
  }

  DateTime getFirstDayOfTheMonth() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  DateTime getFirstDayOfTheYear() {
    DateTime now = DateTime.now();
    return DateTime(now.year, 1, 1);
  }

  DateTime getFirstDayOfTimespan(String timeSpan) {
    if (timeSpan == constants.WEEK) {
      return getFirstDayOfTheWeek();
    } else if (timeSpan == constants.MONTH) {
      return getFirstDayOfTheMonth();
    }
    return getFirstDayOfTheYear();
  }
}
import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/util/debug_util.dart';

class DateUtil {
  DateTime getCurrentDateTime() => isInDebugMode ? testDate : DateTime.now();

  static DateTime _getFirstDayOfTheWeek() {
    DateTime now = DateTime.now();
    if(now.weekday == 1) {
      return DateTime(now.year, now.month, now.day);
    } else {
      return now.subtract(new Duration(days: now.weekday - 1));
    }
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
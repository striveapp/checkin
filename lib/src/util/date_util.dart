import 'package:checkin/src/constants.dart' as constants;

import '../constants.dart';

class DateUtil {
  DateTime getCurrentDateTime() => DateTime.now();

  DateTime getInitialSelectedDayByGym(String selectedGymId) {
    if (selectedGymId == 'test') {
      return testDate;
    }

    if (selectedGymId == 'bjj_winter_week') {
      DateTime eventStartDate = DateTime(2021, 3, 16);
      DateTime eventEndDate = DateTime(2021, 3, 21);
      final currentDateTime = getCurrentDateTime();
      return eventStartDate.isAfter(currentDateTime) ||
              eventEndDate.isBefore(currentDateTime)
          ? eventStartDate
          : currentDateTime;
    }

    return DateTime.now();
  }

  static DateTime _getFirstDayOfTheWeek() {
    DateTime now = DateTime.now();
    if (now.weekday == 1) {
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

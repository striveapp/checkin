import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/models/weekday.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class DateUtil {
  DateTime getCurrentDateTime() => DateTime.now();

  DateTime getInitialSelectedDayByGym(String selectedGymId) {
    if (selectedGymId == 'test') {
      return testDate;
    }

    if (selectedGymId == 'bjj_winter_week') {
      DateTime eventStartDate = DateTime(2021, 9, 13);
      DateTime eventEndDate = DateTime(2021, 9, 19);
      final currentDateTime = getCurrentDateTime();
      return eventStartDate.isAfter(currentDateTime) || eventEndDate.isBefore(currentDateTime)
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

  static DateTime _getFirstDaySinceTheBeginning() {
    return DateTime(2019, 2, 20);
  }

  static DateTime getFirstDayOfTimespan(Timespan timespan) {
    if (timespan == Timespan.week) {
      return _getFirstDayOfTheWeek();
    } else if (timespan == Timespan.month) {
      return _getFirstDayOfTheMonth();
    } else if (timespan == Timespan.year) {
      return _getFirstDayOfTheYear();
    } else {
      return _getFirstDaySinceTheBeginning();
    }
  }

  static Weekday retrieveWeekDay(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('EEEE').format(parsedDate).toWeekday();
  }
}

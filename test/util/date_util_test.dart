import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/models/weekday.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:test/test.dart';

class DateUtilBefore extends DateUtil {
  @override
  DateTime getCurrentDateTime() => DateTime(2020, 12, 25);
}

class DateUtilBetween extends DateUtil {
  @override
  DateTime getCurrentDateTime() => DateTime(2021, 9, 18);
}

class DateUtilAfter extends DateUtil {
  @override
  DateTime getCurrentDateTime() => DateTime(2031, 3, 26);
}

class DateUtilWithTime extends DateUtil {
  @override
  DateTime getCurrentDateTime() => DateTime(2020, 12, 25, 15, 30);
}

void main() {
  group("DateUtil", () {
    DateUtil dateUtil;

    setUp(() {
      dateUtil = DateUtil();
    });

    group("getInitialSelectedDayByGym", () {
      group("when gym is test", () {
        test("return testDate constant", () {
          expect(dateUtil.getInitialSelectedDayByGym('test'), testDate);
        });
      });

      group("when gym is bjj_winter_week", () {
        group("and currentDate is BEFORE event start date", () {
          setUp(() {
            dateUtil = DateUtilBefore();
          });

          test("should return event start date", () {
            expect(dateUtil.getInitialSelectedDayByGym('bjj_winter_week'), DateTime(2021, 9, 13));
          });
        });

        group("and currentDate is in BETWEEN event start date and end date", () {
          setUp(() {
            dateUtil = DateUtilBetween();
          });

          test("should return currentDate", () {
            expect(dateUtil.getInitialSelectedDayByGym('bjj_winter_week'), DateTime(2021, 9, 18));
          });
        });

        group("and currentDate is AFTER event end date", () {
          setUp(() {
            dateUtil = DateUtilAfter();
          });

          test("should return event start date", () {
            expect(dateUtil.getInitialSelectedDayByGym('bjj_winter_week'), DateTime(2021, 9, 13));
          });
        });
      });
    });

    group("retrieveWeekDay", () {
      test("should return the weekday", () {
        var actual = DateUtil.retrieveWeekDay("2021-01-11");
        expect(actual, equals(Weekday.monday));
      });
    });

    group("getFirstDayOfTimespan", () {
      group("when timestamp is WEEK", () {
        setUp(() {
          dateUtil = DateUtilWithTime();
        });

        test("return the beginning of the week", () {
          var expected = DateTime(2020, 12, 21);
          var actual = dateUtil.getFirstDayOfTimespan(Timespan.week);

          expect(actual, equals(expected));
        });

        test("return a plain date without minutes and seconds", () {
          var actual = dateUtil.getFirstDayOfTimespan(Timespan.week);
          expect(actual.second, equals(0));
          expect(actual.minute, equals(0));
          expect(actual.millisecond, equals(0));
          expect(actual.microsecond, equals(0));
        });
      });
      group("when timestamp is MONTH", () {
        setUp(() {
          dateUtil = DateUtilWithTime();
        });

        test("return the beginning of the month", () {
          var expected = DateTime(2020, 12, 1);
          var actual = dateUtil.getFirstDayOfTimespan(Timespan.month);

          expect(actual, equals(expected));
        });
      });
      group("when timestamp is YEAR", () {
        setUp(() {
          dateUtil = DateUtilWithTime();
        });

        test("return the beginning of the year", () {
          var expected = DateTime(2020, 1, 1);
          var actual = dateUtil.getFirstDayOfTimespan(Timespan.year);

          expect(actual, equals(expected));
        });
      });
      group("when timestamp is ALL", () {
        setUp(() {
          dateUtil = DateUtilWithTime();
        });

        test("return the beginning of the time", () {
          var expected = DateTime(2019, 2, 20);
          var actual = dateUtil.getFirstDayOfTimespan(Timespan.all);

          expect(actual, equals(expected));
        });
      });
    });
  });
}

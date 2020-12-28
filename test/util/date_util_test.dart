import 'package:checkin/src/constants.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:test/test.dart';


class DateUtilBefore extends DateUtil {
  @override
  DateTime getCurrentDateTime() => DateTime(2020, 12, 25);
}

class DateUtilBetween extends DateUtil {
  @override
  DateTime getCurrentDateTime() => DateTime(2021, 3, 18);
}

class DateUtilAfter extends DateUtil {
  @override
  DateTime getCurrentDateTime() => DateTime(2021, 3, 26);
}

void main() {
  group("DateUtil", () {
    DateUtil dateUtil;

    setUp(() {
      dateUtil = DateUtil();
    });

    group("getInitialSelectedDayByGym", () {
      group("when gym is test", () {
        test("should return testDate constant", () {
          expect(dateUtil.getInitialSelectedDayByGym('test'), testDate);
        });
      });

      group("when gym is bjj_winter_week", () {
        group("and currentDate is BEFORE event start date", () {
          setUp(() {
              dateUtil = DateUtilBefore();
          });

          test("should return event start date", () {
            expect(dateUtil.getInitialSelectedDayByGym('bjj_winter_week'), DateTime(2021, 3, 16));
          });
        });

        group("and currentDate is in BETWEEN event start date and end date", () {
          setUp(() {
              dateUtil = DateUtilBetween();
          });

          test("should return currentDate", () {
            expect(dateUtil.getInitialSelectedDayByGym('bjj_winter_week'), DateTime(2021, 3, 18));
          });
        });

        group("and currentDate is AFTER event end date", () {
          setUp(() {
              dateUtil = DateUtilAfter();
          });

          test("should return event start date", () {
            expect(dateUtil.getInitialSelectedDayByGym('bjj_winter_week'), DateTime(2021, 3, 16));
          });
        });
      });


    });


  });
}

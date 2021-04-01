import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/weekday.dart';
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
        test("return testDate constant", () {
          expect(dateUtil.getInitialSelectedDayByGym('test'), testDate);
        });
      });
    });

    group("retrieveWeekDay", () {
      test("should return the weekday", () {
        var actual = DateUtil.retrieveWeekDay("2021-01-11");
        expect(actual, equals(Weekday.monday));
      });
    });
  });
}

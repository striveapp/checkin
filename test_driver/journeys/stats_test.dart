// @dart=2.9

import 'package:checkin/src/constants.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../util.dart';
import 'abstract_test.dart';

class StatsTest extends AbstractTest {
  @override
  void runTests() {
    group("Stats journey", () {
      setUp(() async {
        await super.setup();
      });

      tearDown(() async {
        await super.teardown();
      });

      test("user should be able to change selected timespan", () async {
        prettyPrint("Login as user go to stats tab");
        await loginPage.loginAsTest();

        await lessonsPage.goToStatsTab();

        await driver.waitFor(find.text("No classes attended this week"));

        prettyPrint("Then change selected timespan");
        await statsPage.selectTimeSpan(MONTH);
        await driver.waitFor(find.text("No classes attended this month"));

        await statsPage.selectTimeSpan(ALL);
        await driver.waitFor(find.text("No classes attended yet"));
      });
    });
  }
}

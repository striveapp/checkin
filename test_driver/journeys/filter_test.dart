// @dart=2.9

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../util.dart';
import 'abstract_test.dart';

class FilterTest extends AbstractTest {
  void runTests() {
    group('Filter lessons journey', () {
      setUp(() async {
        await super.setup();
      });

      tearDown(() async {
        await super.teardown();
      });

      group("when user filters yoga lessons", () {
        test("only yoga lessons should be displayed", () async {
          prettyPrint("Login as user and filter lessons");
          await loginPage.loginAsTest();
          await driver.waitFor(find.byValueKey('lessonCardList_3'));

          await lessonsPage.filterLessonsBy("yoga");

          await driver.waitFor(find.byValueKey('lessonCardList_1'));

          prettyPrint("Then logout");
          await lessonsPage.logout();
        });
      });

      group("when master filters yoga lessons", () {
        test("only yoga lessons should be displayed", () async {
          prettyPrint("Login as master and filter lessons");
          await loginPage.loginAsMaster();
          await driver.waitFor(find.byValueKey('lessonCardList_3'));

          await lessonsPage.filterLessonsAsMasterBy("yoga");

          await driver.waitFor(find.byValueKey('lessonCardList_1'));

          prettyPrint("Then logout");
          await lessonsPage.logout();
        });
      });
    });
  }
}

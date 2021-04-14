import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../util.dart';
import 'abstract_test.dart';

class LessonEditTest extends AbstractTest {
  void runTests() {
    group('Edit class journey', () {
      setUp(() async {
        await super.setup();
      });

      tearDown(() async {
        await super.teardown();
      });

      group("when master add new classes", () {
        test("the new class will appear in the list of classes for the day", () async {
          prettyPrint("Login as master and add new class");
          await loginPage.loginAsMaster();
          await driver.waitFor(find.byValueKey('lessonCardList_4'));

          await lessonsPage.addNewClass();

          await driver.waitFor(find.byValueKey('lessonCardList_5'));

          prettyPrint("Then logout");
          await lessonsPage.logout();
        });
      });
    }, timeout: Timeout(Duration(seconds: 100)));
  }
}

// @dart=2.9

import 'package:checkin/src/models/weekday.dart';
import 'package:test/test.dart';

import '../util.dart';
import 'abstract_test.dart';

class CloseClassTest extends AbstractTest {
  void runTests() {
    group('Close lesson journey', () {
      setUp(() async {
        await super.setup();
      });

      tearDown(() async {
        await super.teardown();
      });

      group("when the class is open", () {
        test("master should be able to close the class", () async {
          prettyPrint("Login as admin and visit class");
          await loginPage.loginAsAdmin();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 0);
          prettyPrint("attempt to close the class");
          await registryPage.closeClass();
          prettyPrint("Then logout");
          await registryPage.logout();
        });
      });
    });
  }
}

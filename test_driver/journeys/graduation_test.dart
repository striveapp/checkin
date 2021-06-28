// @dart=2.9

import 'package:checkin/src/models/weekday.dart';
import 'package:test/test.dart';

import '../driver_extension.dart';
import '../util.dart';
import 'abstract_test.dart';

class GraduationTest extends AbstractTest {
  @override
  void runTests() {
    group("Graduation journey", () {
      setUp(() async {
        await super.setup();
      });

      tearDown(() async {
        await super.teardown();
      });

      test("master should be able to graduate a student", () async {
        prettyPrint("Login as user and register to class");
        await loginPage.loginAsTest();
        await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
        await registryPage.registerToClass();
        prettyPrint("Then logout");
        await registryPage.logout();
        prettyPrint("Then login as owner, and check the user stats");
        await loginPage.loginAsAdmin();
        await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
        await registryPage.tapTestAttendee();
        prettyPrint("Open the graduation dialog");
        await statsPage.openGraduationDialog();
        prettyPrint("Graduate the student and check it changed the grade");
        await graduationDialog.graduate();
        await driver.waitForExpectedValue(() => statsPage.getUserGrade(), "Blue Belt");
        prettyPrint("Then logout");
        await statsPage.logout();
      });
    });
  }
}

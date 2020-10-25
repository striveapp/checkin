import 'package:test/test.dart';

import '../constants.dart';
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

      test("master should be able to graduate a student",
          () async {
        prettyPrint("Login as user and register to class");
        await loginPage.loginAsTest();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 1);
        await registryPage.registerToClass();
        prettyPrint("Then logout");
        await registryPage.logout();
        prettyPrint("Then login as owner, and check the user stats");
        await loginPage.loginAsOwner();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 1);
        await registryPage.tapTestAttendee();
        prettyPrint("Open the graduation dialog");
        await statsPage.openGraduationDialog();
        prettyPrint("Graduate the student and check it changed the grade");
        await graduationDialog.graduate();
        //TODO how can this be support i18n? https://trello.com/c/0vAzqrql
        // await driver.waitForExpectedValue(() => statsPage.getUserGrade(), "Blue Belt");
        prettyPrint("Then logout");
        await statsPage.logout();
      });
    });
  }
}

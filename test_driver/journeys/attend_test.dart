// @dart=2.9

import 'package:checkin/src/models/weekday.dart';
import 'package:test/test.dart';

import '../driver_extension.dart';
import '../util.dart';
import 'abstract_test.dart';

class AttendTest extends AbstractTest {
  void runTests() {
    group('Attend lesson journey', () {
      setUp(() async {
        await super.setup();
      });

      tearDown(() async {
        await super.teardown();
      });

      group("when user is removed from class", () {
        test("user should be able to remove himself from class", () async {
          prettyPrint("Login as user and attend class");
          await loginPage.loginAsTest();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
          await registryPage.registerToClass();
          prettyPrint("Then unregister himself from class");
          await registryPage.unregisterFromClass();
          prettyPrint("Then logout");
          await registryPage.logout();
        });

        test("owner should be able to remove users from class", () async {
          prettyPrint("Login as user and attend class");
          await loginPage.loginAsTest();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
          await registryPage.registerToClass();
          prettyPrint("Then logout");
          await registryPage.logout();

          prettyPrint("Then login as TestTwo and attend class");
          await loginPage.loginAsTestTwo();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
          await registryPage.registerToClass();
          prettyPrint("Then logout");
          await registryPage.logout();

          prettyPrint("Then login as owner, and remove Test user & Test Two from class");
          await loginPage.loginAsAdmin();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
          await registryPage.swipeToRemoveUser("test@test.com");
          await registryPage.swipeToRemoveUser("test-two@test.com");
          prettyPrint("Then logout");
          await registryPage.logout();
        });
      });

      group("when user attends classes", () {
        test("increase the counter when master approves the class", () async {
          prettyPrint("Login as user and attend class");
          await loginPage.loginAsTest();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 0);
          await registryPage.registerToClass();

          prettyPrint("Then get the amount of classes attended and logout");
          await registryPage.tapTestAttendee();
          var initialMatHours = await statsPage.getMathHours();

          prettyPrint("Then logout");
          await statsPage.logout();

          prettyPrint("Then login as owner and accept all");
          await loginPage.loginAsAdmin();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 0);
          await registryPage.acceptAll();

          prettyPrint("Then check notification has been sent");
          //NOTE: this should be waited for longer, since when notification are cold they may take a while
//        await driver.runUnsynchronized(() async => await driver.waitFor(find.text("You attended 1 classes this year"), timeout: Duration(seconds: 120)));
//        await driver.waitFor(find.text("You attended 1 classes this year"), timeout: Duration(seconds: 120));

          prettyPrint("Then get the amount of classes attended and check it increased");
          await registryPage.tapTestAttendee();
          await driver.waitForExpectedValue(
              () => statsPage.getMathHours(), (int.parse(initialMatHours) + 1).toString());

          prettyPrint("Then logout");
          await statsPage.logout();
        });

        test("increase the counter of multiple users when in class and accepted by the master",
            () async {
          prettyPrint("Login as user Test and attend class");
          await loginPage.loginAsTest();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
          await registryPage.registerToClass();

          prettyPrint("Then get the amount of classes attended and logout");
          await registryPage.tapTestAttendee();
          var initialMatHoursTest = await statsPage.getMathHours();

          prettyPrint("Then logout");
          await statsPage.logout();

          prettyPrint("Login as user TestTwo and attend class");
          await loginPage.loginAsTestTwo();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
          await registryPage.registerToClass();

          prettyPrint("Then get the amount of classes attended and logout");
          await registryPage.tapTestAttendee();
          var initialMatHoursTestTwo = await statsPage.getMathHours();

          prettyPrint("Then logout");
          await statsPage.logout();

          prettyPrint("Then login as owner and accept all");
          await loginPage.loginAsAdmin();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
          await registryPage.acceptAll();

          prettyPrint(
              "Then get the amount of classes attended by Test and check they have increased");
          await registryPage.tapTestAttendee();
          await driver.waitForExpectedValue(
              () => statsPage.getMathHours(), (int.parse(initialMatHoursTest) + 1).toString());

          prettyPrint("Then go back");
          await driver.goBack();

          prettyPrint(
              "Then get the amount of classes attended by TestTwo and check they have increased");
          await registryPage.tapTestAttendee();
          await driver.waitForExpectedValue(
              () => statsPage.getMathHours(), (int.parse(initialMatHoursTestTwo) + 1).toString());

          prettyPrint("Then logout");
          await statsPage.logout();
        });

        test("not allow students to attend full classes", () async {
          prettyPrint("Login as user Test and attend class");
          await loginPage.loginAsTest();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 2);
          await registryPage.registerToClass();

          prettyPrint("Then logout");
          await statsPage.logout();

          prettyPrint("Login as user TestTwo and see the disabled class full button");
          await loginPage.loginAsTestTwo();
          await lessonsPage.selectLessonOfTheDay(Weekday.monday, 2);
          await driver.waitFor(registryPage.registryFullButton);

          await prettyPrint("Then logout");
          await statsPage.logout();
        });
      });
    });
  }
}

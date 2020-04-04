import 'package:flutter_driver/flutter_driver.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:test/test.dart';

import '../constants.dart';
import '../pages/lessons_page.dart';
import '../pages/login_page.dart';
import '../pages/registry_page.dart';
import '../pages/stats_page.dart';
import '../driver_extension.dart';
import '../util.dart';

void main() {
  Chain.capture(() {
    startTests();
  }, onError: (error, stack) {
//    print(error);
    print(new Trace.from(stack).terse);
  });
}

void startTests() {
  group('Attend lesson journey', () {
    FlutterDriver driver;
    LoginPage loginPage;
    LessonsPage lessonsPage;
    RegistryPage registryPage;
    StatsPage statsPage;

    setUp(() async {
      driver = await getDriverAndWaitForHotRestartFinished();
      loginPage = LoginPage(driver);
      lessonsPage = LessonsPage(driver);
      registryPage = RegistryPage(driver);
      statsPage = StatsPage(driver);
    });

    tearDown(() async {
      print("teardown");
      await driver?.closeAndHotRestart();
      print("teardown finished");
    });

    group("when user is removed from class", () {
      setUp(() async {
        await driver.requestData("setup");
        await driver.waitForExpectedValue(() => driver.requestData("is_db_clean"), "true");
      });

      test("user should be able to remove himself from class", () async {
        prettyPrint("Login as user and attend class");
        await loginPage.loginAsTest();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 1);
        await registryPage.registerToClass();
        prettyPrint("Then unregister himself from class");
        await registryPage.unregisterFromClass();
        prettyPrint("Then logout");
        await registryPage.logout();
      });

      test("owner should be able to remove users from class", () async {
        prettyPrint("Login as user and attend class");
        await loginPage.loginAsTest();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 1);
        await registryPage.registerToClass();
        prettyPrint("Then logout");
        await registryPage.logout();

        prettyPrint("Then login as TestTwo and attend class");
        await loginPage.loginAsTestTwo();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 1);
        await registryPage.registerToClass();
        prettyPrint("Then logout");
        await registryPage.logout();

        prettyPrint("Then login as owner, and remove Test user & Test Two from class");
        await loginPage.loginAsOwner();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 1);
        await registryPage.swipeToRemoveUser("test@test.com");
        await registryPage.swipeToRemoveUser("test-two@test.com");
        prettyPrint("Then logout");
        await registryPage.logout();
      });
    });

    group("when user attends classes", () {
      setUp(() async {
        await driver.requestData("setup");
        await driver.waitForExpectedValue(() => driver.requestData("is_db_clean"), "true");
      });
      test("increase the counter when master approves the class", () async {
        prettyPrint("Login as user and attend class");
        await loginPage.loginAsTest();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 0);
        await registryPage.registerToClass();

        prettyPrint("Then get the amount of classes attended and logout");
        await registryPage.tapTestAttendee();
        var initialMatHours = await statsPage.getMathHours();

        prettyPrint("Then logout");
        await statsPage.logout();

        prettyPrint("Then login as owner and accept all");
        await loginPage.loginAsOwner();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 0);
        await registryPage.acceptAll();

        prettyPrint("Then check notification has been sent");
        //NOTE: this should be waited for longer, since when notification are cold they may take a while
//        await driver.runUnsynchronized(() async => await driver.waitFor(find.text("You attended 1 classes this year"), timeout: Duration(seconds: 120)));
//        await driver.waitFor(find.text("You attended 1 classes this year"), timeout: Duration(seconds: 120));

        prettyPrint(
            "Then get the amount of classes attended and check it increased");
        await registryPage.tapTestAttendee();
        await driver.waitForExpectedValue(() => statsPage.getMathHours(),
            (int.parse(initialMatHours) + 1).toString());

        prettyPrint("Then logout");
        await statsPage.logout();
      });

      test(
          "it should increase the counter of multiple users when in class and accepted by the master",
          () async {
        prettyPrint("Login as user Test and attend class");
        await loginPage.loginAsTest();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 1);
        await registryPage.registerToClass();

        prettyPrint("Then get the amount of classes attended and logout");
        await registryPage.tapTestAttendee();
        var initialMatHoursTest = await statsPage.getMathHours();

        prettyPrint("Then logout");
        await statsPage.logout();

        prettyPrint("Login as user TestTwo and attend class");
        await loginPage.loginAsTestTwo();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 1);
        await registryPage.registerToClass();

        prettyPrint("Then get the amount of classes attended and logout");
        await registryPage.tapTestAttendee();
        var initialMatHoursTestTwo = await statsPage.getMathHours();

        prettyPrint("Then logout");
        await statsPage.logout();

        prettyPrint("Then login as owner and accept all");
        await loginPage.loginAsOwner();
        await lessonsPage.selectLessonOfTheDay(WeekDay.monday, 1);
        await registryPage.acceptAll();

        prettyPrint(
            "Then get the amount of classes attended by Test and check they have increased");
        await registryPage.tapTestAttendee();
        await driver.waitForExpectedValue(() => statsPage.getMathHours(),
            (int.parse(initialMatHoursTest) + 1).toString());

        prettyPrint("Then go back");
        await driver.goBack();

        prettyPrint(
            "Then get the amount of classes attended by TestTwo and check they have increased");
        await registryPage.tapTestAttendee();
        await driver.waitForExpectedValue(() => statsPage.getMathHours(),
            (int.parse(initialMatHoursTestTwo) + 1).toString());

        prettyPrint("Then logout");
        await statsPage.logout();
      });
    });
  });
}

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../constants.dart';
import '../pages/lessons_page.dart';
import '../pages/login_page.dart';
import '../pages/registry_page.dart';
import '../pages/stats_page.dart';
import '../util.dart';

void main() {
  group('Attend lesson journey', () {
    FlutterDriver driver;
    LoginPage loginPage;
    LessonsPage lessonsPage;
    RegistryPage registryPage;
    StatsPage statsPage;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      loginPage = LoginPage(driver);
      lessonsPage = LessonsPage(driver);
      registryPage = RegistryPage(driver);
      statsPage = StatsPage(driver);
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    group("when user attends classes", () {
      test("increase the counter when master approves the class", () async {
        prettyPrint("Login as user and attend class");
        await loginPage.loginAsTest();
        await lessonsPage.selectDay(WeekDay.monday);
        await lessonsPage.selectLessonOfTheDay(0);
        await registryPage.registerToClass();

        prettyPrint("Then get the amount of classes attended and logout");
        await registryPage.tapTestAttendee();
        var initialMatHours = await statsPage.getMathHours();

        prettyPrint("Then logout");
        await statsPage.logout();

        prettyPrint("Then login as owner and accept all");
        await loginPage.loginAsOwner();
        await lessonsPage.selectDay(WeekDay.monday);
        await lessonsPage.selectLessonOfTheDay(0);
        await registryPage.acceptAll();

        prettyPrint("Then check notification has been sent");
        await driver.waitFor(find.text("You attended 1 classes this year"));

        prettyPrint(
            "Then get the amount of classes attended and check it increased");
        await registryPage.tapTestAttendee();
        var finalMatHours = await statsPage.getMathHours();
        expect(int.parse(finalMatHours), int.parse(initialMatHours) + 1);

        prettyPrint("Then logout");
        await statsPage.logout();

      });

      test("it should increase the counter of multiple users when in class and accepted by the master", () async {
//        prettyPrint("Login as user and attend class");
//        await loginAsUser();
//        await attendClass('basic');
//        await goBack();
//        await goToProfilePage();
//
//        prettyPrint("Then get the amount of classes attended and logout");
//        var classCounterTest= await driver.getText(find.byValueKey("classCounter"));
//        await logout();
//
//        prettyPrint("Then login as TestTwo and attend class");
//        await loginAsUser(user: 'TestTwo');
//        await attendClass('basic');
//        await goBack();
//        await goToProfilePage();
//
//        prettyPrint("Then get the amount of classes attended and logout");
//        var classCounterTestTwo = await driver.getText(find.byValueKey("classCounter"));
//        await logout();
//
//        prettyPrint("Then login as owner, accept all and logout");
//        await loginAsOwner();
//        await acceptAll('basic');
//        await goBack();
//        await goToProfilePage();
//        await logout();
//
//        prettyPrint("Then login as Test and check that counter has increase");
//        await loginAsUser();
//        await goToProfilePage();
//        var newClassCounter = await driver.getText(find.byValueKey("classCounter"));
//
//        prettyPrint("Then logout");
//        await logout();
//
//        prettyPrint("Then login as TestTwo and check that counter has increase");
//        await loginAsUser(user: 'TestTwo');
//        await goToProfilePage();
//        var newClassCounterTwo = await driver.getText(find.byValueKey("classCounter"));
//
//        prettyPrint("Then logout");
//        await logout();
//
//        var expectedClassCounter = (int.parse(classCounterTest) + 1).toString();
//        var expectedClassCounterTwo = (int.parse(classCounterTestTwo) + 1).toString();
//
//        expect(newClassCounter, expectedClassCounter);
//        expect(newClassCounterTwo, expectedClassCounterTwo);
      });

    });

    group("when user is removed from class", (){
      test("user should be able to remove himself from class", () async {
        prettyPrint("Login as user and attend class");
        await loginPage.loginAsTest();
        await lessonsPage.selectDay(WeekDay.monday);
        await lessonsPage.selectLessonOfTheDay(1);
        await registryPage.registerToClass();
        prettyPrint("Then unregister himself from class");
        await registryPage.unregisterFromClass();

        prettyPrint("Then logout");
        await registryPage.logout();
      });

      test("owner should be able to remove users from class", () async {
        prettyPrint("Login as user and attend class");
        await loginPage.loginAsTest();
        await lessonsPage.selectDay(WeekDay.monday);
        await lessonsPage.selectLessonOfTheDay(1);
        await registryPage.registerToClass();
        prettyPrint("Then logout");
        await registryPage.logout();

        prettyPrint("Then login as TestTwo and attend class");
        await loginPage.loginAsTestTwo();
        await lessonsPage.selectDay(WeekDay.monday);
        await lessonsPage.selectLessonOfTheDay(1);
        await registryPage.registerToClass();
        prettyPrint("Then logout");
        await registryPage.logout();

        prettyPrint("Then login as owner, and remove Test user from class");
        await loginPage.loginAsOwner();
        await lessonsPage.selectDay(WeekDay.monday);
        await lessonsPage.selectLessonOfTheDay(1);
        await registryPage.swipeToRemoveUser("test@test.com");
        await registryPage.swipeToRemoveUser("test-two@test.com");

        prettyPrint("Then logout");
        await registryPage.logout();
      });
    });

  });
}

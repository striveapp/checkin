import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../pages/account_page.dart';
import '../pages/lessons_page.dart';
import '../pages/login_page.dart';
import '../pages/registry_page.dart';
import '../pages/stats_page.dart';
import '../util.dart';

void main() {
  group('Happy paths', ()
  {
    FlutterDriver driver;
    LoginPage loginPage;
    LessonsPage lessonsPage;
    RegistryPage registryPage;
    AccountPage accountPage;
    StatsPage statsPage;


    setUpAll(() async {
      driver = await FlutterDriver.connect();
      loginPage = LoginPage(driver);
      lessonsPage = LessonsPage(driver);
      registryPage = RegistryPage(driver);
      accountPage = AccountPage(driver);
      statsPage = StatsPage(driver);
    });

    tearDownAll(() async {

      if (driver != null) {
        await driver.close();
      }
    });

    group("Attend lesson journey", () {
      test("increase the counter when master approves the class", () async {

        prettyPrint("Login as user and attend class");
        await loginPage.loginAsTest();
        await lessonsPage.selectMonday();
        await lessonsPage.selectFirstLessonOfTheDay();
        await registryPage.registerToClass();

        prettyPrint("Then get the amount of classes attended and logout");
        await registryPage.tapTestAttendee();
        var initialMatHours = await statsPage.getMathHours();
        expect(initialMatHours, "6");
        await driver.goBack();
        await registryPage.goToAccountPage();
        await accountPage.logout();

        prettyPrint("Then login as owner and accept all");
        await loginPage.loginAsOwner();
        await lessonsPage.selectMonday();
        await lessonsPage.selectFirstLessonOfTheDay();
        await registryPage.acceptAll();

        prettyPrint("Then check notification has been sent");
        await driver.waitFor(find.text("You attended 6 classes this year"));

        prettyPrint("Then get the amount of classes attended and check it increased");
        await registryPage.tapTestAttendee();
        var finalMatHours = await statsPage.getMathHours();
        expect(finalMatHours, "7");

        prettyPrint("Then logout");
        await driver.goBack();
        await registryPage.goToAccountPage();
        await accountPage.logout();
      });
    });
  });
}

// @dart=2.9

import 'package:checkin/src/models/weekday.dart';
import 'package:test/test.dart';

import '../driver_extension.dart';
import '../util.dart';
import 'abstract_test.dart';

class LeaderboardTest extends AbstractTest {
  @override
  void runTests() {
    group("Stats journey", () {
      setUp(() async {
        await super.setup();
      });

      tearDown(() async {
        await super.teardown();
      });

      test("user should be able to view the leaderboard", () async {
        prettyPrint("Login as user and register to class");
        await loginPage.loginAsTest();
        await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
        await registryPage.registerToClass();

        prettyPrint("Then logout");
        await registryPage.logout();

        prettyPrint("Then login as owner and accept all");
        await loginPage.loginAsAdmin();
        await lessonsPage.selectLessonOfTheDay(Weekday.monday, 1);
        await registryPage.acceptAll();

        prettyPrint("Then logout");
        await registryPage.logout();

        prettyPrint("Login as user and go to leaderboard");
        await loginPage.loginAsTest();
        await lessonsPage.goToLeaderboardTab();

        prettyPrint("Then go to first user stat page and go back");
        await leaderboardPage.tapFirstPodium();
        await driver.goBack();
      });
    });
  }
}

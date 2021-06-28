// @dart=2.9

import 'package:test/test.dart';

import '../constants.dart';
import '../util.dart';
import 'abstract_test.dart';

class SwitchGymTest extends AbstractTest {
  void runTests() {
    group('Switch gym journey', () {
      setUp(() async {
        await super.setup();
      });

      tearDown(() async {
        await super.teardown();
      });

      test("user can switch between gyms", () async {
        prettyPrint("Login as user open gym selection dropdown");
        await loginPage.loginAsTest();
        await lessonsPage.openGymSelectionDropdown();
        prettyPrint("choose a gym from the list and switch");
        await gymSelectionModal.selectGym(GYM_ARANHA);
        prettyPrint("check stats and leaderboard");
        await lessonsPage.goToStatsTab();
        await lessonsPage.goToLeaderboardTab();

        prettyPrint("go back to lessons tab and switch back to test gym");
        await lessonsPage.goToLessonsTab();
        await lessonsPage.openGymSelectionDropdown();
        await gymSelectionModal.selectGym(GYM_TEST);

        prettyPrint("go to account page");
        await lessonsPage.goToAccountPage();

        prettyPrint("Then logout");
        await accountPage.logout();
      });
    });
  }
}

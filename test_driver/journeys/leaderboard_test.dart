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


      //TODO: this tests are not actually testing this feature e2e since we are not able to submit the TextField
      // More details about the issue here: https://github.com/flutter/flutter/issues/29450
      test("user should be able to view the leaderboard", () async {
        prettyPrint("Login as user go to leaderboard tab");
        await loginPage.loginAsTest();

        await lessonsPage.goToLeaderboardTab();

        prettyPrint("Then go to first user stat page and go back");
        await leaderboardPage.tapFirstPodium();
        await driver.goBack();

//        prettyPrint("Then go to second user stat page and go back");
//        await leaderboardPage.tapSecondPodium();
//        await driver.goBack();
//
//        prettyPrint("Then go to third user stat page and go back");
//        await leaderboardPage.tapThirdPodium();
//        await driver.goBack();

      });
    });
  }

}
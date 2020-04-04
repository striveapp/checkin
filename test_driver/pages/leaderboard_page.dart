import 'package:flutter_driver/flutter_driver.dart';

class LeaderboardPage {
  FlutterDriver _driver;
  final _firstPodium = find.byValueKey("podium_profile_1_test-two@test.com");
  final _secondPodium = find.byValueKey("podium_profile_2_test-four@test.com");
  final _thirdPodium = find.byValueKey("podium_profile_3_test-three@test.com");


  LeaderboardPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> tapFirstPodium() async {
    await _driver.waitFor(_firstPodium);
    await _driver.tap(_firstPodium);
  }

  Future<void> tapSecondPodium() async {
    await _driver.waitFor(_secondPodium);
    await _driver.tap(_secondPodium);
  }

  Future<void> tapThirdPodium() async {
    await _driver.waitFor(_thirdPodium);
    await _driver.tap(_thirdPodium);
  }


}
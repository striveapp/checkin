// @dart=2.9

import 'package:flutter_driver/flutter_driver.dart';

class LeaderboardPage {
  FlutterDriver _driver;
  final _firstPodium = find.byValueKey("podium_profile_1_test@test.com");

  LeaderboardPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> tapFirstPodium() async {
    await _driver.waitFor(_firstPodium);
    await _driver.tap(_firstPodium);
  }
}

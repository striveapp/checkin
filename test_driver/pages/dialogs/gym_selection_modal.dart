// @dart=2.9

import 'package:flutter_driver/flutter_driver.dart';

class GymSelectionModal {
  FlutterDriver _driver;
  final _gymSelectionModal = find.byValueKey('gymSelectionModal');

  GymSelectionModal(FlutterDriver driver) {
    this._driver = driver;
  }

  selectGym(String gymId) async {
    final gymTile = find.byValueKey("gym_$gymId");
    await _driver.waitFor(gymTile);
    await _driver.tap(gymTile);
    await _driver.waitForAbsent(_gymSelectionModal);
  }
}

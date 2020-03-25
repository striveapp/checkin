import 'package:flutter_driver/flutter_driver.dart';

import '../util.dart';

class RegistryPage {
  FlutterDriver _driver;
  final _registerClassButton = find.byValueKey('registerClass');
  final _testAttendeeTile = find.byValueKey('tile-test@test.com');
  final _acceptAllButton = find.byValueKey('acceptAll');

  RegistryPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> registerToClass() async {
    await _driver.waitFor(_registerClassButton);
    await _driver.tap(_registerClassButton);
  }

  Future<void> tapTestAttendee() async {
    await _driver.waitFor(_testAttendeeTile);
    await _driver.tap(_testAttendeeTile);
  }

  Future<void> goToAccountPage() async {
    await _driver.waitFor(accountPageButton);
    await _driver.tap(accountPageButton);
  }

  Future<void> acceptAll() async {
    await _driver.waitFor(_acceptAllButton);
    await _driver.tap(_acceptAllButton);
    await _driver.waitForAbsent(loadingIndicator);
  }
}

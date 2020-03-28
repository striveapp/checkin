import 'package:flutter_driver/flutter_driver.dart';

import '../util.dart';
import 'account_page.dart';

class RegistryPage {
  FlutterDriver _driver;
  AccountPage _accountPage;

  final _registerClassButton = find.byValueKey('registerClass');
  final _testAttendeeTile = find.byValueKey('tile-test@test.com');
  final _testAttendeeTwoTile = find.byValueKey('tile-test@test-two.com');
  final _acceptAllButton = find.byValueKey('acceptAll');
  final _unregisterClassButton = find.byValueKey('unregisterClass');

  RegistryPage(FlutterDriver driver) {
    this._driver = driver;
    this._accountPage = AccountPage(driver);
  }

  Future<void> registerToClass() async {
    await _driver.waitFor(_registerClassButton);
    await _driver.tap(_registerClassButton);
  }

  Future<void> unregisterFromClass() async {
    await _driver.waitFor(_unregisterClassButton);
    await _driver.tap(_unregisterClassButton);
    await _driver.waitForAbsent(_testAttendeeTile);
  }

  Future<void> tapTestAttendee() async {
    await _driver.waitFor(_testAttendeeTile);
    await _driver.tap(_testAttendeeTile);
  }

  Future<void> tapTestTwoAttendee() async {
    await _driver.waitFor(_testAttendeeTwoTile);
    await _driver.tap(_testAttendeeTwoTile);
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

  Future<void> logout() async {
    await goToAccountPage();
    await _accountPage.logout();
  }

  Future<void> swipeToRemoveUser(userKey) async {
    final SerializableFinder testUser = find.byValueKey(userKey);
    await _driver.runUnsynchronized(() async {
      await _driver.waitFor(testUser);
      await _driver.scroll(testUser, -400, 0, Duration(milliseconds: 300));
    });
    await _driver.waitForAbsent(find.byValueKey("tile-$userKey"));
    await _driver.waitUntilNoTransientCallbacks();
  }
}

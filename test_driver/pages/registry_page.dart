// @dart=2.9

import 'package:flutter_driver/flutter_driver.dart';

import '../driver_extension.dart';
import 'account_page.dart';

class RegistryPage {
  FlutterDriver _driver;
  AccountPage _accountPage;
  final _accountPageButton = find.byValueKey('accountPageButton');

  final _registerClassButton = find.byValueKey('registerClass');
  final _testAttendeeTile = find.byValueKey('tile-test@test.com');
  final _testAttendeeTwoTile = find.byValueKey('tile-test@test-two.com');
  final _acceptAllButton = find.byValueKey('acceptAll');
  final registryFullButton = find.byValueKey('registryFull');
  final _unregisterClassButton = find.byValueKey('unregisterClass');
  final _loadingIndicator = find.byValueKey('loadingIndicator');
  final _confirmButton = find.byValueKey('confirmButton');
  final _removeStudentButton = find.byValueKey('removeStudentButton');
  final _closeClassButton = find.byValueKey('closeClassButton');
  final _registryClosedButton = find.byValueKey('registryClosed');

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
    await _driver.waitFor(_accountPageButton);
    await _driver.tap(_accountPageButton);
  }

  Future<void> acceptAll() async {
    await _driver.waitFor(_acceptAllButton);
    await _driver.tap(_acceptAllButton);
    await _driver.waitFor(_confirmButton);
    await _driver.tap(_confirmButton);
    await _driver.waitForAbsent(_loadingIndicator);
  }

  Future<void> closeClass() async {
    await _driver.waitFor(_closeClassButton);
    await _driver.tap(_closeClassButton);
    await _driver.waitFor(_confirmButton);
    await _driver.tap(_confirmButton);
    await _driver.waitFor(_registryClosedButton);
  }

  Future<void> logout() async {
    await goToAccountPage();
    await _accountPage.logout();
  }

  Future<void> swipeToRemoveUser(userKey) async {
    await _driver.waitForExpectedValue(() async {
      final SerializableFinder testUser = find.byValueKey(userKey);
      await _driver.waitFor(testUser);
      await _driver.scroll(testUser, -400, 0, Duration(milliseconds: 500));
      await _driver.waitFor(_removeStudentButton);
      await _driver.tap(_removeStudentButton);
      await _driver.waitForAbsent(find.byValueKey("tile-$userKey"), timeout: Duration(seconds: 3));
      await _driver.waitUntilNoTransientCallbacks();
      return "ok";
    }, "ok");
  }
}

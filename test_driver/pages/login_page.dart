// @dart=2.9

import 'package:flutter_driver/flutter_driver.dart';

import '../util.dart';

class LoginPage {
  final adminLoginButton = find.byValueKey('backdoorAdminButton');
  final masterLoginButton = find.byValueKey('backdoorMasterButton');
  final testUserLoginButton = find.byValueKey('backdoorButton');
  final testUserTwoLoginButton = find.byValueKey('backdoorButtonTwo');

  FlutterDriver _driver;

  LoginPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> loginAsAdmin() async {
    await _driver.waitFor(adminLoginButton);
    await _driver.tap(adminLoginButton);
    prettyPrint("Logged as OWNER");
  }

  Future<void> loginAsMaster() async {
    await _driver.waitFor(masterLoginButton);
    await _driver.tap(masterLoginButton);
    prettyPrint("Logged as MASTER");
  }

  Future<void> loginAsTest() async {
    await _driver.waitFor(testUserLoginButton);
    await _driver.tap(testUserLoginButton);
    prettyPrint("Logged as USER test@test.com");
  }

  Future<void> loginAsTestTwo() async {
    await _driver.waitFor(testUserTwoLoginButton);
    await _driver.tap(testUserTwoLoginButton);
    prettyPrint("Logged as USER test-two@test.com");
  }
}

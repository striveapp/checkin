import 'package:flutter_driver/flutter_driver.dart';

class LoginPage {
  final adminLoginButton = find.byValueKey('backdoorAdminButton');
  final testUserLoginButton = find.byValueKey('backdoorButton');
  final testUserTwoLoginButton = find.byValueKey('backdoorButtonTwo');

  FlutterDriver _driver;

  LoginPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> loginAsOwner() async {
    await _driver.waitFor(adminLoginButton);
    await _driver.tap(adminLoginButton);
    print("Logged as OWNER");
  }

  Future<void> loginAsTest() async {
    await _driver.tap(testUserLoginButton);
    print("logged as USER test@test.com");
  }

  Future<void> loginAsTestTwo() async {
    await _driver.waitFor(testUserTwoLoginButton);
    await _driver.tap(testUserTwoLoginButton);
    print("logged as USER test-two@test.com");
  }
}
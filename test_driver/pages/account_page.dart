import 'package:flutter_driver/flutter_driver.dart';

import '../util.dart';

class AccountPage {
  FlutterDriver _driver;
  final _logoutButton = find.byValueKey('logoutButton');
  final _loginButton = find.byValueKey('loginButton');

  AccountPage(FlutterDriver driver) {
    this._driver = driver;
  }

  logout() async {
    prettyPrint("Loggin out");
    await _driver.tap(_logoutButton);
    await _driver.waitFor(_loginButton);
  }
}

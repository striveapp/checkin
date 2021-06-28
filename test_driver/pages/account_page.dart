// @dart=2.9

import 'package:flutter_driver/flutter_driver.dart';

import '../util.dart';

class AccountPage {
  FlutterDriver _driver;
  final _logoutButton = find.byValueKey('logoutButton');
  final _loginButton = find.byValueKey('loginButton');
  final _editProfileButton = find.byValueKey('editProfileButton');

  AccountPage(FlutterDriver driver) {
    this._driver = driver;
  }

  logout() async {
    prettyPrint("Loggin out");
    await _driver.scrollIntoView(_logoutButton);
    await _driver.tap(_logoutButton);
    await _driver.waitFor(_loginButton);
  }

  editProfile() async {
    await _driver.scrollIntoView(_editProfileButton);
    await _driver.waitFor(_editProfileButton);
    await _driver.tap(_editProfileButton);
  }

  changeName(String newName, String oldName) async {
    await _driver.enterText(newName);
    await _driver.waitForAbsent(find.text(oldName));
    await _driver.waitFor(find.text(newName));
  }
}

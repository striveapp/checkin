// @dart=2.9

import 'package:flutter_driver/flutter_driver.dart';
import '../driver_extension.dart';
import 'registry_page.dart';

class StatsPage {
  FlutterDriver _driver;
  RegistryPage _registryPage;

  final _matHours = find.byValueKey('matHours');
  final _userGrade = find.byValueKey('userGrade');
  final _graduateFab = find.byValueKey("graduateFab");

  StatsPage(FlutterDriver driver) {
    this._driver = driver;
    this._registryPage = RegistryPage(driver);
  }

  Future<String> getUserGrade() async {
    await _driver.waitFor(_userGrade);
    return await _driver.getText(_userGrade);
  }

  Future<String> getMathHours() async {
    await _driver.waitFor(_matHours);
    return await _driver.getText(_matHours);
  }

  Future<void> logout() async {
    await _driver.goBack();
    await _registryPage.logout();
  }

  selectTimeSpan(String timespan) async {
    await _driver.waitFor(find.byValueKey('timespan_$timespan'));
    await _driver.tap(find.byValueKey('timespan_$timespan'));
  }

  openGraduationDialog() async {
    await _driver.waitFor(_graduateFab);
    await _driver.tap(_graduateFab);
  }
}

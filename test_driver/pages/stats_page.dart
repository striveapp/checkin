import 'package:flutter_driver/flutter_driver.dart';
import '../util.dart';
import 'registry_page.dart';

class StatsPage {
  FlutterDriver _driver;
  RegistryPage _registryPage;

  final _matHours = find.byValueKey('matHours');

  StatsPage(FlutterDriver driver) {
    this._driver = driver;
    this._registryPage = RegistryPage(driver);
  }

  Future<String> getMathHours() async {
    await _driver.waitFor(_matHours);
    return _driver.getText(_matHours);
  }

  Future<void> logout() async {
    await _driver.goBack();
    await _registryPage.logout();
  }
}

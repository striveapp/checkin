import 'package:flutter_driver/flutter_driver.dart';

class StatsPage {
  FlutterDriver _driver;
  final _matHours = find.byValueKey('matHours');

  StatsPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<String> getMathHours() {
    _driver.waitFor(_matHours);
    return _driver.getText(_matHours);
  }
}
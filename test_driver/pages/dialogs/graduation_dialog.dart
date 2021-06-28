// @dart=2.9

import 'package:flutter_driver/flutter_driver.dart';

class GraduationDialog {
  FlutterDriver _driver;
  final _graduationDialog = find.byValueKey('graduationDialog');
  final _cancelButton = find.byValueKey('cancelButton');
  final _graduateButton = find.byValueKey('graduateButton');

  GraduationDialog(FlutterDriver driver) {
    this._driver = driver;
  }

  cancel() async {
    await _driver.tap(_cancelButton);
    await _driver.waitForAbsent(_graduationDialog);
  }

  graduate() async {
    await _driver.tap(_graduateButton);
    await _driver.waitForAbsent(_graduationDialog);
  }
}

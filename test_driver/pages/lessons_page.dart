import 'package:flutter_driver/flutter_driver.dart';

import '../util.dart';

class LessonsPage {
  FlutterDriver _driver;
  final firstLessonCard = find.byValueKey("lesson_0");
  final mondayDay = find.text("16");

  LessonsPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> selectMonday() async {
    await _driver.tap(mondayDay);
  }

  Future<void> selectFirstLessonOfTheDay() async {
    await _driver.waitFor(firstLessonCard);
    await _driver.tap(firstLessonCard);
  }

  Future<void> goToAccountPage() async {
    await _driver.tap(accountPageButton);
  }
}
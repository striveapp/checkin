import 'package:flutter_driver/flutter_driver.dart';

import '../constants.dart';
import '../util.dart';

class LessonsPage {
  FlutterDriver _driver;
  final firstLessonCard = find.byValueKey("lesson_0");
  final mondayButton = find.text("16");

  LessonsPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> selectDay(WeekDay day) async {
    switch (day) {
      case WeekDay.monday:
        await _driver.waitFor(mondayButton);
        await _driver.tap(mondayButton);
        await _driver.waitUntilNoTransientCallbacks();
        break;
      case WeekDay.tuesday:
      case WeekDay.wednesday:
      case WeekDay.thursday:
      case WeekDay.friday:
      case WeekDay.saturday:
      case WeekDay.sunday:
        break;
    }
  }

  Future<void> selectLessonOfTheDay(int lessonIndex) async {
    final lessonCard = _getLessonCard(lessonIndex);
    await _driver.waitFor(lessonCard);
    await _driver.tap(lessonCard);
  }

  Future<void> goToAccountPage() async {
    await _driver.tap(accountPageButton);
  }

  SerializableFinder _getLessonCard(int lessonIndex) {
    return find.byValueKey("lesson_$lessonIndex");
  }
}

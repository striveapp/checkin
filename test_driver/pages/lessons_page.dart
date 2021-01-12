import 'package:flutter_driver/flutter_driver.dart';

import '../constants.dart';
import '../util.dart';

class LessonsPage {
  FlutterDriver _driver;
  final mondayButton = find.text("16");
  final _accountPageButton = find.byValueKey('accountPageButton');
  final _statsTab = find.byValueKey('statsTab');
  final _leaderboardTab = find.byValueKey('leaderboardTab');

  LessonsPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> selectLessonOfTheDay(WeekDay day, int lessonIndex) async {
    final lessonCard = await _getLessonCard(day, lessonIndex);
    await _driver.waitFor(lessonCard);
    await _driver.tap(lessonCard);
  }

  Future<void> goToAccountPage() async {
    await _driver.tap(_accountPageButton);
  }

  Future<SerializableFinder> _getLessonCard(
      WeekDay day, int lessonIndex) async {
    final lessonCard =
        find.byValueKey("lesson_${describeEnum(day)}_$lessonIndex");
    if (lessonIndex >= 2) {
      await _driver.scrollIntoView(lessonCard);
    }
    return lessonCard;
  }

  goToStatsTab() async {
    await _driver.waitFor(_statsTab);
    await _driver.tap(_statsTab);
  }

  goToLeaderboardTab() async {
    await _driver.waitFor(_leaderboardTab);
    await _driver.tap(_leaderboardTab);
  }
}

// @dart=2.9

import 'package:checkin/src/models/weekday.dart';
import 'package:flutter_driver/flutter_driver.dart';

import '../driver_extension.dart';
import '../util.dart';
import 'account_page.dart';

class LessonsPage {
  FlutterDriver _driver;
  AccountPage _accountPage;

  final _accountPageButton = find.byValueKey('accountPageButton');
  final _statsTab = find.byValueKey('statsTab');
  final _lessonsTab = find.byValueKey('lessonsTab');
  final _leaderboardTab = find.byValueKey('leaderboardTab');
  final _gymSelectionDropdown = find.byValueKey('gymSelectionDropdown');
  final _filterLessonFab = find.byValueKey('lessonFilterFab');
  final _filterLessonFabIcon = find.byValueKey("icon_[<'lessonFilterFab'>]");
  final _speedDialButton = find.byValueKey('speedDialButton');

  LessonsPage(FlutterDriver driver) {
    this._driver = driver;
    this._accountPage = AccountPage(driver);
  }

  selectLessonOfTheDay(Weekday day, int lessonIndex) async {
    final lessonCard = await _getLessonCard(day, lessonIndex);
    await _driver.waitFor(lessonCard);
    await _driver.tap(lessonCard);
  }

  goToAccountPage() async {
    await _driver.tap(_accountPageButton);
  }

  goToStatsTab() async {
    await _driver.waitFor(_statsTab);
    await _driver.tap(_statsTab);
  }

  goToLeaderboardTab() async {
    await _driver.waitFor(_leaderboardTab);
    await _driver.tap(_leaderboardTab);
  }

  openGymSelectionDropdown() async {
    await _driver.waitFor(_gymSelectionDropdown);
    await _driver.tap(_gymSelectionDropdown);
  }

  goToLessonsTab() async {
    await _driver.waitFor(_lessonsTab);
    await _driver.tap(_lessonsTab);
  }

  filterLessonsBy(String type) async {
    await _filterLessonsBy(type, _filterLessonFab);
  }

  filterLessonsAsMasterBy(String type) async {
    // open speed dial
    await _driver.waitFor(_speedDialButton);
    await _driver.tap(_speedDialButton);

    await _filterLessonsBy(type, _filterLessonFabIcon);
  }

  _filterLessonsBy(String type, SerializableFinder filterFabFinder) async {
    prettyPrint("start filter");
    // open filter dialog
    await _driver.waitFor(filterFabFinder);
    prettyPrint("found fab");

    await _driver.tap(filterFabFinder);
    prettyPrint("tapped fab");

    // tap filter chip
    var chip = find.byValueKey('chip_$type');
    await _driver.waitFor(chip);
    await _driver.tap(chip);

    // close dialog
    await _driver.closeDialog();
  }

  Future<void> logout() async {
    await goToAccountPage();
    await _accountPage.logout();
  }

  Future<SerializableFinder> _getLessonCard(Weekday day, int lessonIndex) async {
    final lessonCard = find.byValueKey("lesson_${day.name}_$lessonIndex");
    if (lessonIndex >= 2) {
      await _driver.scrollIntoView(lessonCard);
    }
    return lessonCard;
  }
}

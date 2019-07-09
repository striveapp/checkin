import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Happy paths', () {
    FlutterDriver driver;

    loginAsOwner(bool isOwner, String d) async {
      print(d);
      await driver.waitFor(
          find.byValueKey(isOwner ? 'backdoorAdminButton' : 'backdoorButton'));
      await driver.tap(
          find.byValueKey(isOwner ? 'backdoorAdminButton' : 'backdoorButton'));
    }

    logout() async {
      await driver.tap(find.byValueKey('logoutButton'));
    }

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    _findOneLessonButton() {
      return find.byValueKey('basic') ??
          find.byValueKey('intermediate') ??
          find.byValueKey('advanced');
    }

    group("Attend class journey", () {
      test("it should increase the counter when master approve the class",
          () async {
        //First login as user and attend class
        loginAsOwner(false, '@@@@@@@@@@ USER');
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(_findOneLessonButton());
        await driver.tap(find.byValueKey('profilePageButton'));
        var classCounter = await driver.getText(find.byValueKey("classCounter"));
        //TODO: this is not working if emulator runs on different locale
        // maybe we should propose a fix directly on flutter itself
        await driver.tap(find.byTooltip('Back'));
        await logout();

        //Then login as owner and accept all
        loginAsOwner(true, '@@@@@@@@@@ OWNER');
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.waitFor(_findOneLessonButton());
        await driver.tap(_findOneLessonButton());
        await driver.waitFor(find.byValueKey('acceptAll'));
        await driver.tap(find.byValueKey('acceptAll'));
        await logout();

        //Then login as user again and check that counter has increase
        loginAsOwner(false, '@@@@@@@@@@ USER');
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(find.byValueKey('profilePageButton'));
        var newClassCounter =
            await driver.getText(find.byValueKey("classCounter"));
        var expectedClassCounter = (int.parse(classCounter) + 1).toString();

        await driver.tap(find.byTooltip('Back'));
        await logout();
        
        print("expected [$expectedClassCounter] actual [$newClassCounter] " );
        expect(newClassCounter, expectedClassCounter);
      });
    });
  });
}

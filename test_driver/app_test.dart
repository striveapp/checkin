import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Happy paths', () {
    FlutterDriver driver;

    loginAsOwner() async {
      print("@@@@@@@@@@ Logged as OWNER @@@@@@@@@@");
      sleep(Duration(milliseconds: 1000));
      await driver.waitFor(find.byValueKey('backdoorAdminButton'));
      await driver.tap(find.byValueKey('backdoorAdminButton'));
    }

    loginAsUser({user = 'Test'}) async {
      print("@@@@@@@@@@ Logged as USER $user @@@@@@@@@@");
      if (user != 'Test') {
        await driver.waitFor(find.byValueKey('backdoorButtonTwo'));
        await driver.tap(find.byValueKey('backdoorButtonTwo'));
      } else {
        await driver.waitFor(find.byValueKey('backdoorButton'));
        await driver.tap(find.byValueKey('backdoorButton'));
      }
    }

    logout() async {
      sleep(Duration(milliseconds: 1000));
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

    _findOneLessonButton(classKey) {
      return find.byValueKey(classKey);
    }

    _back() async {
      var backButton = find.byTooltip('Atrás');
      await driver.tap(backButton);
    }

    group("Attend class journey", () {

      test("it should increase the counter when master approve the class",
          () async {
        //First login as user and attend class
        await loginAsUser();
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(_findOneLessonButton('basic'));
        await driver.tap(find.byValueKey('profilePageButton'));

        // Get the amout of classes attended
        var classCounter =
            await driver.getText(find.byValueKey("classCounter"));

        await _back();
        await logout();

        //Then login as owner and accept all
        await loginAsOwner();
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(_findOneLessonButton('basic'));
        await driver.waitFor(find.byValueKey('acceptAll'));
        await driver.tap(find.byValueKey('acceptAll'));
        await logout();

        //Then login as user again and check that counter has increase
        await loginAsUser();
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(find.byValueKey('profilePageButton'));

        //Get the amount of classes attended again
        sleep(Duration(milliseconds: 1000));
        var newClassCounter =
            await driver.getText(find.byValueKey("classCounter"));
        await _back();
        await logout();

        var expectedClassCounter = (int.parse(classCounter) + 1).toString();

        expect(newClassCounter, expectedClassCounter);
      });

      test("it should increase the counter and accept only from the specific class",
              () async {
            //First login as user and attend class
            await loginAsUser();
            await driver.waitFor(find.byValueKey('todaysClassesText'));
            await driver.tap(_findOneLessonButton('basic'));
            await driver.tap(_findOneLessonButton('intermediate'));
            await driver.tap(find.byValueKey('profilePageButton'));

            // Get the amout of classes attended
            var classCounter = await driver.getText(find.byValueKey("classCounter"));

            await _back();
            await logout();

            //Then login as owner check the fist class and accept all
            await loginAsOwner();
            await driver.waitFor(find.byValueKey('todaysClassesText'));
            await driver.tap(_findOneLessonButton('basic'));
            await driver.waitFor(find.byValueKey('acceptAll'));
            await driver.tap(find.byValueKey('acceptAll'));


            //Check if user is still in the other class then approves
            await _back();
            await driver.waitFor(find.byValueKey('todaysClassesText'));
            await driver.tap(_findOneLessonButton('intermediate'));
            await driver.waitFor(find.text("Test"));
            await driver.waitFor(find.byValueKey('acceptAll'));
            await driver.tap(find.byValueKey('acceptAll'));

            //Check if user is still in not in the initial class
            await _back();
            await driver.waitFor(find.byValueKey('todaysClassesText'));
            await driver.tap(_findOneLessonButton('basic'));
            await driver.waitForAbsent(find.text("Test"));

            await logout();

            //Then login as user again and check that counter has increase
            await loginAsUser();
            await driver.waitFor(find.byValueKey('todaysClassesText'));
            await driver.tap(find.byValueKey('profilePageButton'));

            sleep(Duration(milliseconds: 1000));
            var newClassCounter =
            await driver.getText(find.byValueKey("classCounter"));

            await _back();

            await logout();

            var expectedClassCounter = (int.parse(classCounter) + 2).toString();

            expect(newClassCounter, expectedClassCounter);
          });

      test("it should increase the counter of multiple users when in class and accepted by the master", () async {
        //First login as Test and attend class
        await loginAsUser();
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(_findOneLessonButton('basic'));
        await driver.tap(find.byValueKey('profilePageButton'));

        // Get the amout of classes attended
        var classCounterTest= await driver.getText(find.byValueKey("classCounter"));

        await _back();
        await logout();

        //Then login as TestTwo and attend class
        await loginAsUser(user: 'TestTwo');
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(_findOneLessonButton('basic'));
        await driver.tap(find.byValueKey('profilePageButton'));

        // Get the amout of classes attended
        var classCounterTestTwo = await driver.getText(find.byValueKey("classCounter"));

        await _back();
        await logout();

        //Then login as owner and accept all
        await loginAsOwner();
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(_findOneLessonButton('basic'));
        await driver.waitFor(find.byValueKey('acceptAll'));
        await driver.tap(find.byValueKey('acceptAll'));
        await logout();

        //Then login as Test again and check that counter has increase
        await loginAsUser();
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(find.byValueKey('profilePageButton'));

        sleep(Duration(milliseconds: 1000));
        var newClassCounter =
        await driver.getText(find.byValueKey("classCounter"));

        await _back();
        await logout();

        //Then login as TestTwo again and check that counter has increase
        await loginAsUser(user: 'TestTwo');
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(find.byValueKey('profilePageButton'));

        sleep(Duration(milliseconds: 1000));
        var newClassCounterTwo =
        await driver.getText(find.byValueKey("classCounter"));

        await _back();
        await logout();

        var expectedClassCounter = (int.parse(classCounterTest) + 1).toString();
        var expectedClassCounterTwo = (int.parse(classCounterTestTwo) + 1).toString();

        expect(newClassCounter, expectedClassCounter);
        expect(newClassCounterTwo, expectedClassCounterTwo);

      });
    });
  });
}

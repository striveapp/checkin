import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:firebase/firebase_io.dart';

void main() {
  group('Flutter Driver demo', () {
    FlutterDriver driver;

    loginAsOwner(bool isOwner) async {
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

    group("Attend class journey", () {
      test("it should increase the counter when master approve the class", () async {

        //First login as user and attend class
        loginAsOwner(false);
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        await driver.tap(find.byValueKey('testClass1'));
        var classCounter = await driver.getText(find.byValueKey("classCounter"));
        logout();

        //Then login as owner and accept all
        loginAsOwner(true);
        await driver.waitFor(find.byValueKey('acceptAll'));
        await driver.tap(find.byValueKey('acceptAll'));
        logout();

        //Then login as user again and check that counter has increase
        loginAsOwner(false);
        await driver.waitFor(find.byValueKey('todaysClassesText'));
        var newClassCounter = await driver.getText(find.byValueKey("classCounter"));
        var expectedClassCounter = (int.parse(classCounter) + 1).toString();

        expect(newClassCounter, expectedClassCounter);
      });
    });
  });
}

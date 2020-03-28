import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Happy paths', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    prettyPrint(msg) => print("\n@@@@@@@@@@ $msg @@@@@@@@@@");

    loginAsOwner() async {
      print("Logged as OWNER");
      await driver.waitFor(find.byValueKey('backdoorAdminButton'));
      await driver.tap(find.byValueKey('backdoorAdminButton'));
    }

    loginAsUser({user = 'Test'}) async {
      print("loginAsUser as USER: $user");
      if (user != 'Test') {
        await driver.waitFor(find.byValueKey('backdoorButtonTwo'));
        await driver.tap(find.byValueKey('backdoorButtonTwo'));
      } else {
        await driver.waitFor(find.byValueKey('backdoorButton'));
        await driver.tap(find.byValueKey('backdoorButton'));
      }
      print("logged as USER: $user");
    }

    logout() async {
      print("Loggin out");
      await driver.tap(find.byValueKey('logoutButton'));
      await driver.waitFor(find.byValueKey('loginButton'));
    }

    goBack() async {
      await driver.tap(find.pageBack());
    }

    goToRegistryOf(classKey) async {
      await driver.waitFor(find.byValueKey('todaysClassesText'));
      await driver.tap(find.byValueKey(classKey));
    }

    attendClass(classKey) async {
      await goToRegistryOf(classKey);
      await driver.waitFor(find.byValueKey('registerClass'));
      await driver.tap(find.byValueKey('registerClass'));
    }

    acceptAll(classKey) async {
      await goToRegistryOf(classKey);
      await driver.waitFor(find.byValueKey('acceptAll'));
      await driver.tap(find.byValueKey('acceptAll'));
      await driver.waitFor(find.byValueKey('emptyClassCard'));
    }

    goToProfilePage() async {
      await driver.waitFor(find.byValueKey('todaysClassesText'));
      await driver.tap(find.byValueKey('profilePageButton'));
    }

    editProfile() async {
      await driver.waitFor(find.byValueKey('classCounter'));
      await driver.tap(find.byValueKey('editProfileButton'));
    }

    group("User profile journey", () {
      //TODO: this tests are not actually testing this feature e2e since we are not able to submit the TextField
      // More details about the issue here: https://github.com/flutter/flutter/issues/29450
      test("user should be able to change name", () async {
        prettyPrint("Login as user go to profile page and edit");
        await loginAsUser();
        await goToProfilePage();
        await editProfile();

        prettyPrint("Change the name");
        var newName = 'Felice Mastronzo';
        var oldName = 'Test';

        await driver.setTextEntryEmulation(enabled: true);
        await driver.enterText(newName);
        await driver.waitForAbsent(find.text(oldName));
        await driver.waitFor(find.text(newName));

        prettyPrint("Reset the name and logout");
        await driver.enterText(oldName);
        await driver.waitFor(find.text(oldName));
        await logout();
      });
    });

    group("User browsing profiles journey", () {
      test("user should be able to see other user's profile", () async {
        final classKey = 'basic';

        prettyPrint("Login as user and attend class");
        await loginAsUser();
        await attendClass(classKey);
        await goBack();
        await goToProfilePage();
        await logout();

        prettyPrint("Then login as owner, browse user profile, accept all");
        await loginAsOwner();
        await goToRegistryOf('basic');
        await driver.tap(find.byValueKey('tile-test@test.com'));
        await driver.waitFor(find.byValueKey('classCounter'));
        await goBack();
        await goBack();
        await acceptAll('basic');

        prettyPrint("Then logout");
        await goBack();
        await goToProfilePage();
        await logout();
      });
    });
  });
}

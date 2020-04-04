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

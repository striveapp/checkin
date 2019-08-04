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
      print("Logged as USER: $user");
      if (user != 'Test') {
        await driver.waitFor(find.byValueKey('backdoorButtonTwo'));
        await driver.tap(find.byValueKey('backdoorButtonTwo'));
      } else {
        await driver.waitFor(find.byValueKey('backdoorButton'));
        await driver.tap(find.byValueKey('backdoorButton'));
      }
    }

    logout() async {
      print("Loggin out");
      await driver.tap(find.byValueKey('logoutButton'));
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
      await driver.waitFor(find.byValueKey('attendClass'));
      await driver.tap(find.byValueKey('attendClass'));
    }

    unattendClass(classKey) async {
      await goToRegistryOf(classKey);
      await driver.waitFor(find.byValueKey('unattendClass'));
      await driver.tap(find.byValueKey('unattendClass'));
    }

    acceptAll(classKey) async {
      await goToRegistryOf(classKey);
      await driver.waitFor(find.byValueKey('acceptAll'));
      await driver.tap(find.byValueKey('acceptAll'));
    }

    goToProfilePage() async {
      await driver.waitFor(find.byValueKey('todaysClassesText'));
      await driver.tap(find.byValueKey('profilePageButton'));
    }

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    group("Attend class journey", () {
      test("increase the counter when master approves the class", () async {

        prettyPrint("Login as user and attend class");
        await loginAsUser();
        await attendClass('basic');
        await goBack();
        await goToProfilePage();

        prettyPrint("Then get the amount of classes attended and logout");
        var classCounter = await driver.getText(find.byValueKey("classCounter"));
        await goBack();
        await logout();

        prettyPrint("Then login as owner and accept all and logout");
        await loginAsOwner();
        await acceptAll('basic');
        await logout();

        prettyPrint("Then login as user again and check that counter has increase");
        await loginAsUser();
        await goToProfilePage();
        var newClassCounter = await driver.getText(find.byValueKey("classCounter"));


        prettyPrint("Then logout");
        await goBack();
        await logout();

        var expectedClassCounter = (int.parse(classCounter) + 1).toString();

        expect(newClassCounter, expectedClassCounter);
      });

      test("increase the counter and accept only from the specific class", () async {

        prettyPrint("Login as user and attend 2 different classes");
        await loginAsUser();
        await attendClass('basic');
        await goBack();
        await attendClass('intermediate');
        await goBack();
        await goToProfilePage();

        prettyPrint("Then get the amount of classes attended and logout");
        var classCounter = await driver.getText(find.byValueKey("classCounter"));
        await goBack();
        await logout();

        prettyPrint("Then login as owner and accept all for 1 of the classes");
        await loginAsOwner();
        await acceptAll('basic');

        prettyPrint("Then check if user is still in the other class");
        await goBack();
        await goToRegistryOf('intermediate');
        await driver.waitFor(find.text("Test"));

        prettyPrint("Then approves all");
        await driver.waitFor(find.byValueKey('acceptAll'));
        await driver.tap(find.byValueKey('acceptAll'));

        prettyPrint("Then check if user is not in the initial class and logout");
        await goBack();
        await goToRegistryOf('basic');
        await driver.waitForAbsent(find.text("Test"));
        await logout();

        prettyPrint("Then login as user and check that counter has increase");
        await loginAsUser();
        await goToProfilePage();
        var newClassCounter = await driver.getText(find.byValueKey("classCounter"));

        prettyPrint("Then logout");
        await goBack();
        await logout();

        var expectedClassCounter = (int.parse(classCounter) + 2).toString();

        expect(newClassCounter, expectedClassCounter);
      });

      test("it should increase the counter of multiple users when in class and accepted by the master", () async {
        prettyPrint("Login as user and attend class");
        await loginAsUser();
        await attendClass('basic');
        await goBack();
        await goToProfilePage();

        prettyPrint("Then get the amount of classes attended and logout");
        var classCounterTest= await driver.getText(find.byValueKey("classCounter"));
        await goBack();
        await logout();

        prettyPrint("Then login as TestTwo and attend class");
        await loginAsUser(user: 'TestTwo');
        await attendClass('basic');
        await goBack();
        await goToProfilePage();

        prettyPrint("Then get the amount of classes attended and logout");
        var classCounterTestTwo = await driver.getText(find.byValueKey("classCounter"));
        await goBack();
        await logout();

        prettyPrint("Then login as owner, accept all and logout");
        await loginAsOwner();
        await acceptAll('basic');
        await logout();

        prettyPrint("Then login as Test and check that counter has increase");
        await loginAsUser();
        await goToProfilePage();
        var newClassCounter = await driver.getText(find.byValueKey("classCounter"));

        prettyPrint("Then logout");
        await goBack();
        await logout();

        prettyPrint("Then login as TestTwo and check that counter has increase");
        await loginAsUser(user: 'TestTwo');
        await goToProfilePage();
        var newClassCounterTwo = await driver.getText(find.byValueKey("classCounter"));

        prettyPrint("Then logout");
        await goBack();
        await logout();

        var expectedClassCounter = (int.parse(classCounterTest) + 1).toString();
        var expectedClassCounterTwo = (int.parse(classCounterTestTwo) + 1).toString();

        expect(newClassCounter, expectedClassCounter);
        expect(newClassCounterTwo, expectedClassCounterTwo);

      });

      test("user should be able to remove himself from class", () async {
        prettyPrint("Login as user and attend class");
        await loginAsUser();
        await attendClass('basic');
        await driver.waitFor(find.text("Test"));
        await goBack();
        await unattendClass('basic');
        await driver.waitForAbsent(find.text("Test"));
      });
    });
  });
}

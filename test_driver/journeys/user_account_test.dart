// @dart=2.9

import 'package:test/test.dart';

import '../util.dart';
import 'abstract_test.dart';

void main() {
  UserAccountTest().main();
}

class UserAccountTest extends AbstractTest {
  void runTests() {
    group("User profile journey", () {
      setUp(() async {
        await super.setup();
      });

      tearDown(() async {
        await super.teardown();
      });

      //TODO: this tests are not actually testing this feature e2e since we are not able to submit the TextField
      // More details about the issue here: https://github.com/flutter/flutter/issues/29450
      test("user should be able to change name", () async {
        prettyPrint("Login as user go to account page and edit");
        await loginPage.loginAsTest();
        await lessonsPage.goToAccountPage();
        await accountPage.editProfile();

        prettyPrint("Change the name");
        String newName = 'Felice Mastronzo';
        String oldName = 'Test';
        await accountPage.changeName(newName, oldName);

        prettyPrint("Reset the name and logout");
        await accountPage.changeName(oldName, newName);
        await accountPage.logout();
      });
    });
  }
}

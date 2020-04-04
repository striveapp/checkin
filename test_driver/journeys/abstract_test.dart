import 'package:flutter_driver/flutter_driver.dart';
import 'package:stack_trace/stack_trace.dart';

import '../driver_extension.dart';
import '../pages/account_page.dart';
import '../pages/lessons_page.dart';
import '../pages/login_page.dart';
import '../pages/registry_page.dart';
import '../pages/stats_page.dart';

abstract class AbstractTest {
  FlutterDriver driver;
  LoginPage loginPage;
  LessonsPage lessonsPage;
  RegistryPage registryPage;
  StatsPage statsPage;
  AccountPage accountPage;

  void main() {
    Chain.capture(() {
      runTests();
    }, onError: (error, stack) {
      print(new Trace.from(stack).terse);
    });
  }

  setup() async {
    driver = await getDriverAndWaitForHotRestartFinished();
    loginPage = LoginPage(driver);
    lessonsPage = LessonsPage(driver);
    registryPage = RegistryPage(driver);
    statsPage = StatsPage(driver);
    accountPage = AccountPage(driver);
    await driver.requestData("setup");
    await driver.waitForExpectedValue(() => driver.requestData("is_db_clean"), "true");
    print("setup finished");
  }

  teardown() async {
    print("teardown");
    await driver?.closeAndHotRestart();
    print("teardown finished");
  }

  
  void runTests();
}
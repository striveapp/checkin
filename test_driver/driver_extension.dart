import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

import 'constants.dart';

extension DriverExtension on FlutterDriver {
  Future<void> goBack() async {
    await tap(find.pageBack());
  }

  Future<String> waitForExpectedValue(Future<String> Function() f, String expectedValue,
      {Duration timeout = defaultTimeout}) async =>
      _getTextValueFromFuture(f, expectedValue).timeout(timeout);

  Future<void> closeAndHotRestart() async {
    if(await pidFile.exists()) {

      await requestData("init_hot_restart");
      await close();
      String pid = await pidFile.readAsString();
      Process.killPid(int.parse(pid), ProcessSignal.sigusr2);
    }
    await close();
  }
}

Future<FlutterDriver> getDriverAndWaitForHotRestartFinished() async {
  FlutterDriver driver = await FlutterDriver.connect();

  if(await pidFile.exists()) {
    try {
      await driver.waitForExpectedValue(() async {
        try {
          print("start is_hot_restarting request");
          var result = await driver.requestData( "is_hot_restarting", timeout: Duration(seconds: 1)).timeout(Duration(seconds:1));
          print("is_hot_restarting: $result");
          return result;
        } catch (e) {
          print("reconnecting: $e");
          driver = await FlutterDriver.connect();
        }
        return "true";
      }, "false");
    } catch( e ) {
      print("something went wrong: $e");
    }
  }
  return driver;
}

Future<String> _getTextValueFromFuture(
    Future<String> Function() f, String expectedValue) async {
  try {
    if (await f.call() == expectedValue) {
      return expectedValue;
    }
  } catch( e ) {
    print("function call failed: $e");
  }
  return _getTextValueFromFuture(f, expectedValue);
}

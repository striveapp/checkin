import 'package:flutter_driver/flutter_driver.dart';

const defaultTimeout = Duration(seconds: 30);

prettyPrint(msg) => print("\n@@@@@@@@@@ $msg @@@@@@@@@@");

final loadingIndicator = find.byValueKey('loadingIndicator');
final accountPageButton = find.byValueKey('accountPageButton');

extension Util on FlutterDriver {
  Future<void> goBack() async {
    await tap(find.pageBack());
  }

  Future<String> waitForExpectedValue(Future<String> Function() f, String expectedValue,
          {Duration timeout = defaultTimeout}) async =>
      _getTextValueFromFuture(f, expectedValue).timeout(timeout);
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

String describeEnum(Object enumEntry) {
  final String description = enumEntry.toString();
  final int indexOfDot = description.indexOf('.');
  assert(indexOfDot != -1 && indexOfDot < description.length - 1);
  return description.substring(indexOfDot + 1);
}

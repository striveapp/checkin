import 'package:flutter_driver/flutter_driver.dart';

prettyPrint(msg) => print("\n@@@@@@@@@@ $msg @@@@@@@@@@");

final loadingIndicator = find.byValueKey('loadingIndicator');
final accountPageButton = find.byValueKey('accountPageButton');

extension Util on FlutterDriver {
  Future<void> goBack() async {
    await tap(find.pageBack());
  }
}

String describeEnum(Object enumEntry) {
  final String description = enumEntry.toString();
  final int indexOfDot = description.indexOf('.');
  assert(indexOfDot != -1 && indexOfDot < description.length - 1);
  return description.substring(indexOfDot + 1);
}
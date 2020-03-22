import 'package:flutter_driver/flutter_driver.dart';

prettyPrint(msg) => print("\n@@@@@@@@@@ $msg @@@@@@@@@@");

final loadingIndicator = find.byValueKey('loadingIndicator');
final accountPageButton = find.byValueKey('accountPageButton');

extension Util on FlutterDriver {
  Future<void> goBack() async {
    await tap(find.pageBack());
  }
}
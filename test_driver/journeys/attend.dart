import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:checkin/main.dart' as app;

void main() {
  enableFlutterDriverExtension();
  FirebaseAuth.instance.signOut();
  app.main();
}
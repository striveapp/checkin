import 'dart:io';

enum WeekDay { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

const GYM_ARANHA = "aranha";
const GYM_TEST = "test";

final pidFile = File('/tmp/flutter-hot-reload.pid');

const defaultTimeout = Duration(seconds: 30);

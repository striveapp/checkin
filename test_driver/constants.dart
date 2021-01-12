import 'dart:io';

enum WeekDay { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

final pidFile = File('/tmp/flutter-hot-reload.pid');

const defaultTimeout = Duration(seconds: 30);

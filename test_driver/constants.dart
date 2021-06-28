// @dart=2.9

import 'dart:io';

const GYM_ARANHA = "aranha";
const GYM_TEST = "test";

final pidFile = File('/tmp/flutter-hot-reload.pid');

const defaultTimeout = Duration(seconds: 30);

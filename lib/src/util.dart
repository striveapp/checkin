import 'package:intl/intl.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

class DateUtil {
  getToday() {
    DateTime now = DateTime.now();
    return DateFormat('dd MMM').format(now);
  }
}
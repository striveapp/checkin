import 'package:logger/logger.dart';

class DevLogger {
  static final Logger logger = Logger(
    level: Level.debug,
    printer: PrefixPrinter(
      PrettyPrinter(
        methodCount: 1,
        errorMethodCount: 30,
        colors: false,
      ),
    ),
  );
}

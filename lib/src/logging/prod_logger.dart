import 'package:logger/logger.dart';

class ProdLogger {
  //TODO: we could think of a custom output log that sends the logs to crashlytics for handled exceptions
  static final Logger logger = Logger(
    level: Level.wtf,
    printer: PrefixPrinter(
      PrettyPrinter(
        methodCount: 1,
        errorMethodCount: 30,
        colors: false,
        printTime: true,
      ),
    ),
  );
}

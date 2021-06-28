import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

class CryptoUtil {
  static String generateMd5(String input) => md5.convert(utf8.encode(input)).toString();

  static String generateUUID() => Uuid().v4();
}

import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';

void main() {
  group("Translations", () {
    test("that no translations are missing", () {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });
  });
}
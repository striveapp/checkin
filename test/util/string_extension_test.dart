import 'package:flutter_test/flutter_test.dart';
import 'package:checkin/src/util/string_extension.dart';

void main() {
  group("String extension", () {
    group("isBlank", () {
      group("should return false", () {
        test("should return false when the string is the empty string", () {
          var notEmpty = "i'm empty inside";
          expect(notEmpty.isBlank, false);
        });
      });

      group("should return true", () {
        test("when the string is the empty string", () {
          var empty = "";
          expect(empty.isBlank, true);
        });
        test("when the string is just made of whitespaces", () {
          var onlySpaces = "   ";
          var onlyTabs = "    ";
          var spacesAndTabs = "     ";

          expect(onlySpaces.isBlank, true);
          expect(onlyTabs.isBlank, true);
          expect(spacesAndTabs.isBlank, true);
        });
      });
    });
  });
}

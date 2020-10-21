import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/util/graduation_util.dart';
import 'package:test/test.dart';

void main() {
  group("GraduationUtil", () {
    test("given a grade should give the next grade", () {
      GraduationUtil graduationUtil = GraduationUtil();

      expect(graduationUtil.calculateNextGrade(Grade.white), Grade.blue);
      expect(graduationUtil.calculateNextGrade(Grade.blue), Grade.purple);
      expect(graduationUtil.calculateNextGrade(Grade.purple), Grade.brown);
      expect(graduationUtil.calculateNextGrade(Grade.brown), Grade.black);
      expect(graduationUtil.calculateNextGrade(Grade.black), Grade.black);
    });

    test("should throw on unknown grade", () {
      GraduationUtil graduationUtil = GraduationUtil();

      expect(() => graduationUtil.calculateNextGrade(null), throwsA('could not calculate next grade from [null]'));
    });

  });
}
// @dart=2.9

import 'package:checkin/src/models/grade.dart';

class GraduationUtil {
  Grade calculateNextGrade(Grade currentGrade) {
    switch (currentGrade) {
      case Grade.white:
        return Grade.blue;
      case Grade.blue:
        return Grade.purple;
      case Grade.purple:
        return Grade.brown;
      case Grade.brown:
        return Grade.black;
      case Grade.black:
        return Grade.black;
    }

    throw "could not calculate next grade from [$currentGrade]";
  }
}

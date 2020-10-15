import 'package:checkin/src/models/graduation_system.dart';

abstract class GraduationSystemRepository {
  Stream<GraduationSystem> getGraduationSystem(String gymId);
}
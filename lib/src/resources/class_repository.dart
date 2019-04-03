import 'package:checkin/src/resources/class_provider.dart';

class ClassRepository {
  final _classProvider = ClassProvider();

  Future<List<String>> getClassAttendees() => _classProvider.getClassAttendees();

  Future<void> attenClass(String name) => _classProvider.attendClass(name);

  Future<void> clearClass() => _classProvider.clearClass();
}
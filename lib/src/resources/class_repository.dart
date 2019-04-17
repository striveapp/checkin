import 'package:checkin/src/resources/class_provider.dart';

class ClassRepository {
  final _classProvider = ClassProvider();

  Stream<List<String>> getClassAttendees() => _classProvider.getClassAttendees();

  Future<void> attendClass(String name) => _classProvider.attendClass(name);

  Future<void> clearClass() => _classProvider.clearClass();
}
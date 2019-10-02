import 'package:equatable/equatable.dart';

class GeneralNotification extends Equatable {
  final String title;
  final String body;

  GeneralNotification(this.title, this.body) : super([title, body]);

  @override
  String toString() {
    return 'Notification{title: $title, body: $body}';
  }
}

class MasterNotification extends Equatable {

  final String type;
  final String lessonId;

  MasterNotification(this.type, this.lessonId) : super([type, lessonId]);

  @override
  String toString() {
    return 'Notification{type: $type, lessonId: $lessonId}';
  }
}

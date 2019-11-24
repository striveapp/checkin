import 'package:equatable/equatable.dart';

class BasicNotification extends Equatable {
  final String title;
  final String body;

  BasicNotification(this.title, this.body);

  @override
  List<Object> get props => [title, body];

  @override
  String toString() {
    return 'BasicNotification{title: $title, body: $body}';
  }
}

class ActionNotification extends Equatable {
  final String type;
  final String lessonId;

  ActionNotification(this.type, this.lessonId);

  @override
  List<Object> get props => [type, lessonId];

  @override
  String toString() {
    return 'ActionNotification{type: $type, lessonId: $lessonId}';
  }
}

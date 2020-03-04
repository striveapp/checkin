import 'package:equatable/equatable.dart';

class BasicNotification extends Equatable {
  final String title;
  final String body;

  BasicNotification(this.title, this.body);

  @override
  List<Object> get props => [title, body];

  @override
  String toString() => 'BasicNotification{title: $title, body: $body}';
}

class NavigationNotification extends Equatable {
  final String type;
  final String path;

  NavigationNotification(this.type, this.path);

  @override
  List<Object> get props => [type, path];

  @override
  String toString() => 'ActionNotification{type: $type, path: $path}';
}

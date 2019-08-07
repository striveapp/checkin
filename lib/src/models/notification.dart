import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String title;
  final String body;

  Notification(this.title, this.body) : super([title, body]);

  @override
  String toString() {
    return 'Notification{title: $title, body: $body}';
  }
}

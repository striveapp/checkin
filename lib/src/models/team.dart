import 'package:equatable/equatable.dart';

class Team extends Equatable {
  final String name;

  Team(this.name) : super([name]);

  @override
  String toString() {
    return 'Team{name: $name}';
  }
}


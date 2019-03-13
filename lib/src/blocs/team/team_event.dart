import 'package:equatable/equatable.dart';

abstract class TeamEvent extends Equatable {}

class Fetch extends TeamEvent {
  @override
  String toString() => 'Fetch';
}
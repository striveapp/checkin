import 'package:checkin/src/models/gym.dart';
import 'package:equatable/equatable.dart';

abstract class GymState extends Equatable {
  const GymState();
}

class InitialGymState extends GymState {
  @override
  List<Object> get props => [];
}

class GymLoaded extends GymState {
  final Gym gym;

  GymLoaded({this.gym});

  @override
  List<Object> get props => [gym];
}

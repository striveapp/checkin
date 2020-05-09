import 'package:checkin/src/models/gym.dart';
import 'package:equatable/equatable.dart';

abstract class GymEvent extends Equatable {
  const GymEvent();
}

class GymUpdated extends GymEvent {
  final Gym gym;

  GymUpdated({this.gym});

  @override
  List<Object> get props => [gym];
}

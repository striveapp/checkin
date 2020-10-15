import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class GraduationBloc extends Bloc<GraduationEvent, GraduationState> {
  @override
  GraduationState get initialState => InitialGraduationState();

  @override
  Stream<GraduationState> mapEventToState(
    GraduationEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

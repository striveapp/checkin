import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/lesson_filter/lesson_filter_state.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:flutter/material.dart';
import './bloc.dart';

class LessonFilterBloc extends Bloc<LessonFilterEvent, LessonFilterState> {
  final LessonConfigRepository lessonConfigRepository;
  final UserBloc userBloc;

  StreamSubscription<Set<String>> availableLessonTypesSub;

  LessonFilterBloc({
    @required this.lessonConfigRepository,
    @required this.userBloc,
  }) : super(InitialLessonFilterState()) {
    _onUserStateChanged(userBloc.state);
    userBloc.listen(_onUserStateChanged);
  }

  void _onUserStateChanged(userState) {
    if(userState is UserSuccess) {
      availableLessonTypesSub?.cancel();
      availableLessonTypesSub = lessonConfigRepository.getAvailableLessonTypes(userState.currentUser.selectedGymId).listen((availableLessonTypes) {
        add(LessonFilterUpdated(availableLessonTypes: availableLessonTypes));
      });
    }
  }


  @override
  Stream<LessonFilterState> mapEventToState(
    LessonFilterEvent event,
  ) async* {
    if( event is LessonFilterUpdated ) {
      yield LessonFilterState.lessonFilterLoaded(availableLessonTypes: event.availableLessonTypes.toList());
    }
  }
}

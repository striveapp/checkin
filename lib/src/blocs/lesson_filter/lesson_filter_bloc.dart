import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/lesson_filter/lesson_filter_state.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class LessonFilterBloc extends Bloc<LessonFilterEvent, LessonFilterState> {
  final LessonConfigRepository lessonConfigRepository;
  final UserRepository userRepository;

  StreamSubscription<Set<String>> _availableLessonTypesSub;
  StreamSubscription<User> _userSub;

  LessonFilterBloc({
    @required this.lessonConfigRepository,
    @required this.userRepository,
  }) : super(InitialLessonFilterState()) {
    _userSub?.cancel();
    _userSub = userRepository.getUser().listen(_onUserChanged);
  }

  void _onUserChanged(User currentUser) {
    _availableLessonTypesSub?.cancel();
    _availableLessonTypesSub = lessonConfigRepository
        .getAvailableLessonTypes(currentUser.selectedGymId)
        .listen((availableLessonTypes) {
      add(LessonFilterUpdated(availableLessonTypes: availableLessonTypes));
    });
  }

  @override
  Stream<LessonFilterState> mapEventToState(
    LessonFilterEvent event,
  ) async* {
    if (event is LessonFilterUpdated) {
      yield LessonFilterState.lessonFilterLoaded(
          availableLessonTypes: event.availableLessonTypes.toList());
    }
  }

  @override
  Future<void> close() {
    _userSub?.cancel();
    _availableLessonTypesSub?.cancel();
    return super.close();
  }
}

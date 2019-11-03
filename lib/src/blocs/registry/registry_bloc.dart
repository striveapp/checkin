import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class RegistryBloc extends Bloc<RegistryEvent, RegistryState> {
  final LessonRepository lessonRepository;
  final UserRepository userRepository;
  StreamSubscription<Lesson> registrySub;
  String currentLesson;

  RegistryBloc({
    @required this.lessonRepository,
    @required this.userRepository,
  });

  @override
  RegistryState get initialState => RegistryUninitialized();

  @override
  Stream<RegistryState> mapEventToState(RegistryEvent event) async* {
    if( event is LoadLesson) {
      if( currentLesson != event.lessonId ) {
        currentLesson = event.lessonId;

        if( registrySub != null ) {
          registrySub.cancel();
        }

        registrySub = this.lessonRepository.getLesson(event.lessonId)
            .listen((lesson) => dispatch(LessonUpdated(lesson: lesson)) );
      }
    }

    if (event is LessonUpdated) {
      try {
        yield RegistryLoaded(lesson: event.lesson);
      } catch (e) {
        print(e);
      }
    }


    //TODO We should probably change the state when
    // ConfirmAttendees, Register and Unregister got dispatched
    // and remove logic from the UI
    if (event is ConfirmAttendees) {
      try {
        await this.lessonRepository.acceptAll(event.lessonId, event.attendees);
      } catch(e) {
        print(e);
      }
    }

    if (event is Register) {
      try {
        await this.lessonRepository.register(event.lessonId, event.attendee);
      } catch(e) {
        print(e);
      }
    }

    if (event is Unregister) {
      try {
        await this.lessonRepository.unregister(event.lessonId, event.attendee);
      } catch(e) {
        print(e);
      }
    }
  }

  @override
  void dispose() {
    registrySub.cancel();
    super.dispose();
  }
}

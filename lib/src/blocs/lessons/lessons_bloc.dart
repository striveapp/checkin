import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {

  final LessonRepository lessonRepository;
  final UserRepository userRepository;
  StreamSubscription<List<Lesson>> lessonsSub;

  LessonsBloc({
    @required this.lessonRepository,
    @required this.userRepository,
  }) {
    lessonsSub = this.lessonRepository.getLessonsForToday().listen((lessons) {
      dispatch(LessonsUpdated(lessons: lessons));
    });
  }

  @override
  LessonsState get initialState => LessonsUninitialized();

  @override
  Stream<LessonsState> mapEventToState(LessonsEvent event) async* {
    if (event is LessonsUpdated) {
      try {
        yield LessonsLoaded(lessons: event.lessons);
      } catch(e) {
        print(e);
      }
    }

//    if (event is Confirm) {
//      try {
//        event.attendees.forEach((attendee) {
//         this.userRepository.incrementUserCounter(attendee);
//        });
//        await this.lessonRepository.clearLesson();
//      } catch(e) {
//        print(e);
//      }
//    }

//    if (event is Attend) {
//      try {
//        await this.lessonRepository.attendLesson(event.attendee);
//      } catch(e) {
//        print(e);
//      }
//    }
  }

  @override
  void dispose() {
    lessonsSub.cancel();
    super.dispose();
  }
}
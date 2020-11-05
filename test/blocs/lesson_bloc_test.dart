import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lesson/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLessonRepository extends Mock implements LessonRepository {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("LessonBloc", () {
    LessonBloc lessonBloc;
    MockUserBloc mockUserBloc;

    MockLessonRepository mockLessonRepository;

    String fakeLessonId = "some lessonId";

    Lesson fakeLesson = Lesson(
        id: fakeLessonId,
        name: "A lesson",
        timeStart: "10:00",
        timeEnd: "11:00",
        weekDay: "Monday",
        attendees: [
          Attendee(
              name: "Test1",
              email: "test1@test.com",
              imageUrl: "some image",
              grade: Grade.white),
          Attendee(
              name: "Test2",
              email: "test2@test.com",
              imageUrl: "some image",
              grade: Grade.white),
          Attendee(
              name: "Test3",
              email: "test3@test.com",
              imageUrl: "some image",
              grade: Grade.white),
        ]);
    User fakeUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
      selectedGymId: "someFakeGym",
    );
    StreamController<Lesson> lessonStreamCtrl;

    setUp(() {
      lessonStreamCtrl = StreamController<Lesson>();
      mockLessonRepository = MockLessonRepository();
      mockUserBloc = MockUserBloc();
      when(mockLessonRepository.getLesson(fakeUser.selectedGymId, fakeLesson.date, fakeLesson.id))
          .thenAnswer((_) {
        return lessonStreamCtrl.stream;
      });
      lessonStreamCtrl.add(fakeLesson);
      whenListen(mockUserBloc,
          Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
      lessonBloc = LessonBloc(
        userBloc: mockUserBloc,
        lessonId: fakeLesson.id,
        date: fakeLesson.date,
        lessonRepository: mockLessonRepository,
      );
    });

    tearDown(() {
      reset(mockUserBloc);
      reset(mockLessonRepository);
      lessonStreamCtrl?.close();
      lessonBloc?.close();
    });

    test("initial state is LessonUninitialized", () {
      expect(lessonBloc.initialState, LessonUninitialized());
    });

    group("when add LessonUpdated", () {
      test(
          "should emit RegistryLoaded with the current lesson and the current user",
          () async {
        final expectedState = [
          LessonUninitialized(),
          LessonLoaded(lesson: fakeLesson),
        ];

        await expectLater(
          lessonBloc,
          emitsInOrder(expectedState),
        );
      });
    });

  });
}

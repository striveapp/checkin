import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/api.dart';
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

class MockLessonApi extends Mock implements LessonApi {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("LessonBloc", () {
    LessonBloc lessonBloc;
    MockUserBloc mockUserBloc;

    MockLessonRepository mockLessonRepository;
    MockLessonApi mockLessonApi;

    String fakeLessonId = "some lessonId";

    Attendee fakeAttendee = Attendee(
        name: "User",
        email: "ueser@test.com",
        imageUrl: "some image",
        grade: Grade.white,
        selectedGymId: "testGym");

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
              grade: Grade.white,
              selectedGymId: "testGym"),
          Attendee(
              name: "Test2",
              email: "test2@test.com",
              imageUrl: "some image",
              grade: Grade.white,
              selectedGymId: "testGym"),
          Attendee(
              name: "Test3",
              email: "test3@test.com",
              imageUrl: "some image",
              grade: Grade.white,
              selectedGymId: "testGym"),
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
      mockLessonApi = MockLessonApi();
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
        lessonApi: mockLessonApi,
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

    group("when add LessonRegister", () {
      setUp(() {
        lessonBloc.add(LessonRegister(attendee: fakeAttendee));
      });

      test("should call the lesson repository and register the attendee",
          () async {
        await untilCalled(mockLessonRepository.register(fakeUser.selectedGymId,
            fakeLesson.date, fakeLesson.id, fakeAttendee));
        verify(mockLessonRepository.register(fakeUser.selectedGymId,
            fakeLesson.date, fakeLesson.id, fakeAttendee));
      });

      test("should emit a LessonError if the repository fails", () async {
        when(mockLessonRepository.register(any, any, any, any))
            .thenThrow(Exception("Boom!"));
        final expectedState = [
          LessonUninitialized(),
          LessonLoaded(lesson: fakeLesson),
          LessonError(),
        ];

        await expectLater(
          lessonBloc,
          //TODO: this is a bit of a porkaround, since the LessonLoaded is coming after then the LessonError
          emitsInAnyOrder(expectedState),
        );
      });
    });

    group("when add LessonUnregister", () {
      setUp(() {
        lessonBloc.add(LessonUnregister(attendee: fakeAttendee));
      });

      test("should call the lesson repository and register the attendee",
          () async {
            lessonBloc.add(LessonUnregister(attendee: fakeAttendee));
        await untilCalled(mockLessonRepository.unregister(fakeUser.selectedGymId,
            fakeLesson.date, fakeLesson.id, fakeAttendee));
        verify(mockLessonRepository.unregister(fakeUser.selectedGymId,
            fakeLesson.date, fakeLesson.id, fakeAttendee));
      });

      test("should emit a LessonError if the repository fails", () async {
        lessonBloc.add(LessonUnregister(attendee: fakeAttendee));
        when(mockLessonRepository.unregister(any, any, any, any))
            .thenThrow(Exception("Boom!"));
        final expectedState = [
          LessonUninitialized(),
          LessonLoaded(lesson: fakeLesson),
          LessonError(),
        ];

        await expectLater(
          lessonBloc,
          emitsInAnyOrder(expectedState),
        );
      });
    });

    group("when add LessonAcceptAll", () {
      setUp(() {
        lessonBloc.add(LessonAcceptAll());
      });

      test(
          "should emit RegistryLoading call acceptAll from the lesson api and then RegistryLoaded",
          () async {
        await untilCalled(mockLessonApi.acceptAll(fakeUser.selectedGymId,fakeLesson));
        verify(mockLessonApi.acceptAll(fakeUser.selectedGymId,fakeLesson));
      });
    });
  });
}

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLessonRepository extends Mock implements LessonRepository {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("RegistryBloc", () {
    RegistryBloc registryBloc;
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
              rank: "White"),
          Attendee(
              name: "Test2",
              email: "test2@test.com",
              imageUrl: "some image",
              rank: "White"),
          Attendee(
              name: "Test3",
              email: "test3@test.com",
              imageUrl: "some image",
              rank: "White"),
        ]);
    User fakeUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
    );
    StreamController<Lesson> lessonStreamCtrl;

    setUp(() {
      lessonStreamCtrl = StreamController<Lesson>();
      mockLessonRepository = MockLessonRepository();
      mockUserBloc = MockUserBloc();
      when(mockLessonRepository.getLesson(fakeLesson.id)).thenAnswer((_) {
        return lessonStreamCtrl.stream;
      });
      lessonStreamCtrl.add(fakeLesson);
      whenListen(mockUserBloc,
          Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
      registryBloc = RegistryBloc(
        lessonId: fakeLesson.id,
        lessonRepository: mockLessonRepository,
        userBloc: mockUserBloc,
      );
    });

    tearDown(() {
      reset(mockUserBloc);
      reset(mockLessonRepository);
      lessonStreamCtrl?.close();
      registryBloc?.close();
    });

    test("initial state is RegistryUninitialized", () {
      expect(registryBloc.initialState, RegistryUninitialized());
    });

    group("when add LessonUpdated", () {
      test(
          "should emit RegistryLoaded with the current lesson and the current user",
          () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(currentUser: fakeUser, currentLesson: fakeLesson),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("when add ConfirmAttendees", () {
      test("should emit RegistryLoading and call acceptAll from the lesson repository", () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(currentUser: fakeUser, currentLesson: fakeLesson),
          RegistryLoading(),
          RegistryLoaded(currentUser: fakeUser, currentLesson: fakeLesson),
        ];

        when(mockLessonRepository.acceptAll(fakeLesson)).thenAnswer((_) {
          lessonStreamCtrl.add(fakeLesson);
          return Future.value(null);
        });

        registryBloc.add(ConfirmAttendees(lesson: fakeLesson));
        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );
        verify(mockLessonRepository.acceptAll(fakeLesson));
      });
    });

    group("when add Register", () {
      test("should emit RegistryLoading and call register for an attendee", () async {
        Attendee fakeAttendee = Attendee(
            name: "pepe",
            rank: "White",
            imageUrl: "lol",
            email: "not@anemail"
        );

        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(currentUser: fakeUser, currentLesson: fakeLesson),
          RegistryLoading(),
          RegistryLoaded(currentUser: fakeUser, currentLesson: fakeLesson),
        ];

        when(mockLessonRepository.register(fakeLesson.id, fakeAttendee)).thenAnswer((_) {
          lessonStreamCtrl.add(fakeLesson);
          return Future.value(null);
        });

        registryBloc.add(Register(lessonId: fakeLesson.id, attendee: fakeAttendee));
        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );
        verify(mockLessonRepository.register(fakeLesson.id, fakeAttendee));
      });
    });

    group("when add Unregister", () {
      test("should emit RegistryLoading and call unregister for an attendee", () async {
        Attendee fakeAttendee = Attendee(
            name: "pepe",
            rank: "White",
            imageUrl: "lol",
            email: "not@anemail"
        );

        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(currentUser: fakeUser, currentLesson: fakeLesson),
          RegistryLoading(),
          RegistryLoaded(currentUser: fakeUser, currentLesson: fakeLesson),
        ];

        when(mockLessonRepository.unregister(fakeLesson.id, fakeAttendee)).thenAnswer((_) {
          lessonStreamCtrl.add(fakeLesson);
          return Future.value(null);
        });

        registryBloc.add(Unregister(lessonId: fakeLesson.id, attendee: fakeAttendee));
        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );
        verify(mockLessonRepository.unregister(fakeLesson.id, fakeAttendee));
      });
    });
  });
}

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lesson/bloc.dart';
import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockLessonBloc extends Mock implements LessonBloc {}

void main() {
  group("RegistryBloc", () {
    RegistryBloc registryBloc;
    MockUserBloc mockUserBloc;
    MockLessonBloc mockLessonBloc;

    var testAttendee1 = Attendee(
        name: "Test1",
        email: "test1@test.com",
        imageUrl: "some image",
        grade: Grade.white);
    var testAttendee2 = Attendee(
        name: "Test2",
        email: "test2@test.com",
        imageUrl: "some image",
        grade: Grade.white);
    var testAttendee3 = Attendee(
        name: "Test3",
        email: "test3@test.com",
        imageUrl: "some image",
        grade: Grade.white);

    Lesson fakeLesson = Lesson(attendees: [
      testAttendee1,
      testAttendee2,
      testAttendee3,
    ]);
    User fakeUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
    );
    StreamController<LessonState> lessonBlocStreamCtrl;

    setUp(() {
      lessonBlocStreamCtrl = StreamController<LessonState>();
      mockLessonBloc = MockLessonBloc();
      mockUserBloc = MockUserBloc();

      when(mockUserBloc.where(any)).thenAnswer((_) {
        return Stream.fromIterable([UserSuccess(currentUser: fakeUser)]);
      });
      when(mockLessonBloc.where(any)).thenAnswer((_) {
        return lessonBlocStreamCtrl.stream;
      });
      lessonBlocStreamCtrl.add(LessonLoaded(lesson: fakeLesson));

      registryBloc = RegistryBloc(
          lessonBloc: mockLessonBloc,
          userBloc: mockUserBloc);
    });

    tearDown(() {
      reset(mockUserBloc);
      reset(mockLessonBloc);
      lessonBlocStreamCtrl?.close();
      registryBloc?.close();
    });

    test("initial state is RegistryUninitialized", () {
      expect(registryBloc.initialState, RegistryUninitialized());
    });

    group("when add Register", () {
      Attendee fakeAttendee = Attendee(
          name: "pepe",
          grade: Grade.white,
          imageUrl: "lol",
          email: "not@anemail");

      setUp(() {
        when(mockLessonBloc.add(LessonRegister(attendee: fakeAttendee)))
            .thenAnswer((_) {
          lessonBlocStreamCtrl.add(LessonLoaded(
            lesson: Lesson(attendees: [...fakeLesson.attendees, fakeAttendee]),
          ));
          return Future.value(null);
        });

        registryBloc.add(Register(attendee: fakeAttendee));
      });

      test("should emit RegistryLoaded and call register for an attendee",
          () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            currentUser: fakeUser,
            attendees: fakeLesson.attendees,
          ),
          RegistryLoaded(
            currentUser: fakeUser,
            attendees: [...fakeLesson.attendees, fakeAttendee],
          ),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("when add Unregister", () {
      setUp(() {
        when(mockLessonBloc.add(LessonUnregister(attendee: testAttendee1)))
            .thenAnswer((_) {
          lessonBlocStreamCtrl.add(LessonLoaded(
            lesson: Lesson(attendees: [testAttendee2, testAttendee3]),
          ));
          return Future.value(null);
        });

        registryBloc.add(Unregister(attendee: testAttendee1));
      });

      test("should emit RegistryLoaded and call unregister for an attendee",
          () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
              currentUser: fakeUser, attendees: fakeLesson.attendees),
          RegistryLoaded(
              currentUser: fakeUser, attendees: [testAttendee2, testAttendee3]),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("when add ConfirmAttendees", () {
      setUp(() {
        when(mockLessonBloc.add(LessonAcceptAll()))
            .thenAnswer((_) {
          lessonBlocStreamCtrl.add(LessonLoaded(
            lesson: Lesson(acceptedAttendees: [testAttendee2, testAttendee3]),
          ));
          return Future.value(null);
        });

        registryBloc.add(ConfirmAttendees());
      });

      test("should emit RegistryLoaded and call unregister for an attendee",
          () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
              currentUser: fakeUser, attendees: fakeLesson.attendees),
          RegistryLoading(),
          RegistryLoaded(
              currentUser: fakeUser, acceptedAttendees: [testAttendee2, testAttendee3]),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}

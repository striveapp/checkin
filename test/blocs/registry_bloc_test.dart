import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockLessonApi extends Mock implements LessonApi {}

class MockLessonRepository extends Mock implements LessonRepository {}

void main() {
  group("RegistryBloc", () {
    RegistryBloc registryBloc;
    MockUserBloc mockUserBloc;
    MockLessonApi mockLessonApi;
    MockLessonRepository mockLessonRepository;

    var testAttendee1 = Attendee(
        name: "Test1", email: "test1@test.com", imageUrl: "some image", grade: Grade.white);
    var testAttendee2 = Attendee(
        name: "Test2", email: "test2@test.com", imageUrl: "some image", grade: Grade.white);
    var testAttendee3 = Attendee(
        name: "Test3", email: "test3@test.com", imageUrl: "some image", grade: Grade.white);

    Lesson fakeLesson = Lesson(
      id: "test id",
      date: "test date",
      classCapacity: 10,
      attendees: [
        testAttendee1,
        testAttendee2,
        testAttendee3,
      ],
      acceptedAttendees: [],
    );
    User fakeUser = User(
        name: "Logged User",
        email: "test@test.com",
        imageUrl: "someImage",
        selectedGymId: "testGym");

    setUp(() {
      mockUserBloc = MockUserBloc();
      mockLessonApi = MockLessonApi();
      mockLessonRepository = MockLessonRepository();

      whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));

      registryBloc = RegistryBloc(
          lesson: fakeLesson,
          lessonRepository: mockLessonRepository,
          lessonApi: mockLessonApi,
          userBloc: mockUserBloc);
    });

    tearDown(() {
      reset(mockUserBloc);
      registryBloc?.close();
    });

    test("initial state is RegistryUninitialized", () {
      expect(registryBloc.initialState, RegistryUninitialized());
    });

    group("when RegistryUpdated", () {
      test("when currentUser is already accepted in lesson should emit RegistryLoaded with isAccepted = true", () {

      });

      test("when currentUser is registered in lesson should emit RegistryLoaded with isRegisteredUser = true", () {

      });

      test("when currentUser is not registered in lesson should emit RegistryLoaded with isRegisteredUser = false", () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: fakeLesson.classCapacity,
            currentUser: fakeUser,
            attendees: fakeLesson.attendees,
            acceptedAttendees: [],
            isAcceptedUser: false,
            isRegisteredUser: false,
            isFullRegistry: false,
          ),
        ];

        await expectLater(
            registryBloc,
            emitsInOrder(expectedState),
        );
      });

      test("when lesson is full should emit RegistryLoaded with isFull = true", () {

      });

    });

    group("when add Register", () {
      Attendee fakeAttendee =
          Attendee(name: "pepe", grade: Grade.white, imageUrl: "lol", email: "not@anemail");

      setUp(() {
        when(mockLessonRepository.register(
                fakeUser.selectedGymId, fakeLesson.date, fakeLesson.id, fakeAttendee))
            .thenAnswer((realInvocation) => Future.value(null));

        registryBloc.add(Register(gymId: fakeUser.selectedGymId, attendee: fakeAttendee));
      });

      test("should call register for an attendee", () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: fakeLesson.classCapacity,
            currentUser: fakeUser,
            attendees: fakeLesson.attendees,
          ),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );

        verify(mockLessonRepository.register(
            fakeUser.selectedGymId, fakeLesson.date, fakeLesson.id, fakeAttendee));
      });
    });

    group("when add Unregister", () {
      setUp(() {
        when(mockLessonRepository.unregister(
                fakeUser.selectedGymId, fakeLesson.date, fakeLesson.id, testAttendee1))
            .thenAnswer((realInvocation) => Future.value());

        registryBloc.add(Unregister(gymId: fakeUser.selectedGymId, attendee: testAttendee1));
      });

      test("should call unregister for an attendee", () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: fakeLesson.classCapacity,
            currentUser: fakeUser,
            attendees: fakeLesson.attendees,
          ),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );
        verify(mockLessonRepository.unregister(
            fakeUser.selectedGymId, fakeLesson.date, fakeLesson.id, testAttendee1));
      });
    });

    group("when add AcceptAttendees", () {
      setUp(() {
        when(mockLessonApi.acceptAll(fakeUser.selectedGymId, fakeLesson))
            .thenAnswer((realInvocation) => Future.value());
        registryBloc.add(AcceptAttendees(gymId: fakeUser.selectedGymId));
      });

      test("should call api to accept all attendees", () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: fakeLesson.classCapacity,
            currentUser: fakeUser,
            attendees: fakeLesson.attendees,
          ),
          RegistryLoading(),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );

        verify(mockLessonApi.acceptAll(fakeUser.selectedGymId, fakeLesson));
      });
    });
  });
}

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

    Lesson baseLesson = Lesson(
      id: "test id",
      date: "test date",
      classCapacity: 10,
      attendees: [],
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
    });

    tearDown(() {
      reset(mockUserBloc);
      registryBloc?.close();
    });

    test("initial state is RegistryUninitialized", () {
      whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));

      registryBloc = RegistryBloc(
          lesson: baseLesson,
          lessonRepository: mockLessonRepository,
          lessonApi: mockLessonApi,
          userBloc: mockUserBloc);

      expect(registryBloc.initialState, RegistryUninitialized());
    });

    group("when RegistryUpdated", () {
      test("when currentUser is already accepted in lesson should emit RegistryLoaded with isAccepted = true", () async {
        User acceptedUser = User(
            name: testAttendee1.name,
            email: testAttendee1.email,
            imageUrl: testAttendee1.imageUrl,
            selectedGymId: "testGym");

        Lesson fakeLessonWithAcceptedAttendee = baseLesson.copyWith(
          attendees: [],
          acceptedAttendees: [testAttendee1]
        );


        whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: acceptedUser)));

        registryBloc = RegistryBloc(
            lesson: fakeLessonWithAcceptedAttendee,
            lessonRepository: mockLessonRepository,
            lessonApi: mockLessonApi,
            userBloc: mockUserBloc);

        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: fakeLessonWithAcceptedAttendee.classCapacity,
            currentUser: acceptedUser,
            attendees: fakeLessonWithAcceptedAttendee.attendees,
            acceptedAttendees: fakeLessonWithAcceptedAttendee.acceptedAttendees,
            isAcceptedUser: true,
            isRegisteredUser: false,
            isFullRegistry: false,
          ),
        ];

        await expectLater(
            registryBloc,
            emitsInOrder(expectedState),
        );
      });

      test("when currentUser is registered in lesson should emit RegistryLoaded with isRegisteredUser = true", () async {
        User registeredUser = User(
            name: testAttendee1.name,
            email: testAttendee1.email,
            imageUrl: testAttendee1.imageUrl,
            selectedGymId: "testGym");

        Lesson lessonWithRegisteredUser = baseLesson.copyWith(
          attendees: [testAttendee1],
          acceptedAttendees: []
        );

        whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: registeredUser)));

        registryBloc = RegistryBloc(
            lesson: lessonWithRegisteredUser,
            lessonRepository: mockLessonRepository,
            lessonApi: mockLessonApi,
            userBloc: mockUserBloc);

        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: lessonWithRegisteredUser.classCapacity,
            currentUser: registeredUser,
            attendees: lessonWithRegisteredUser.attendees,
            acceptedAttendees: lessonWithRegisteredUser.acceptedAttendees,
            isAcceptedUser: false,
            isRegisteredUser: true,
            isFullRegistry: false,
          ),
        ];

        await expectLater(
            registryBloc,
            emitsInOrder(expectedState),
        );

      });

      test("when currentUser is not registered in lesson should emit RegistryLoaded with isRegisteredUser = false", () async {
        Lesson lessonWithoutRegisteredUser = baseLesson.copyWith(
          attendees: [],
          acceptedAttendees: []
        );

        whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));

        registryBloc = RegistryBloc(
            lesson: lessonWithoutRegisteredUser,
            lessonRepository: mockLessonRepository,
            lessonApi: mockLessonApi,
            userBloc: mockUserBloc);


        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: lessonWithoutRegisteredUser.classCapacity,
            currentUser: fakeUser,
            attendees: lessonWithoutRegisteredUser.attendees,
            acceptedAttendees: lessonWithoutRegisteredUser.acceptedAttendees,
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

      test("when lesson is full should emit RegistryLoaded with isFull = true", () async {
        Lesson fakeLessonFull = baseLesson.copyWith(
            attendees: [],
            acceptedAttendees: [testAttendee1],
            classCapacity: 1
        );


        whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));

        registryBloc = RegistryBloc(
            lesson: fakeLessonFull,
            lessonRepository: mockLessonRepository,
            lessonApi: mockLessonApi,
            userBloc: mockUserBloc);

        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: fakeLessonFull.classCapacity,
            currentUser: fakeUser,
            attendees: fakeLessonFull.attendees,
            acceptedAttendees: fakeLessonFull.acceptedAttendees,
            isAcceptedUser: false,
            isRegisteredUser: false,
            isFullRegistry: true,
          ),
        ];

        await expectLater(
            registryBloc,
            emitsInOrder(expectedState),
        );

      });
    });

    group("when add Register", () {
      Attendee fakeAttendee =
          Attendee(name: "pepe", grade: Grade.white, imageUrl: "lol", email: "not@anemail");

      setUp(() {
        whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));

        registryBloc = RegistryBloc(
            lesson: baseLesson,
            lessonRepository: mockLessonRepository,
            lessonApi: mockLessonApi,
            userBloc: mockUserBloc);

        when(mockLessonRepository.register(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id, fakeAttendee))
            .thenAnswer((realInvocation) => Future.value(null));

        registryBloc.add(Register(gymId: fakeUser.selectedGymId, attendee: fakeAttendee));
      });

      test("should call register for an attendee", () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: baseLesson.classCapacity,
            currentUser: fakeUser,
            attendees: baseLesson.attendees,
            acceptedAttendees: baseLesson.acceptedAttendees,
            isAcceptedUser: false,
            isRegisteredUser: false,
            isFullRegistry: false
          ),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );

        verify(mockLessonRepository.register(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, fakeAttendee));
      });
    });

    group("when add Unregister", () {
      User registeredUser = User(
          name: testAttendee1.name,
          email: testAttendee1.email,
          imageUrl: testAttendee1.imageUrl,
          selectedGymId: "testGym");

      Lesson lessonWithRegisteredUser = baseLesson.copyWith(
          attendees: [testAttendee1]
      );

      setUp(() {

        whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: registeredUser)));

        registryBloc = RegistryBloc(
            lesson: lessonWithRegisteredUser,
            lessonRepository: mockLessonRepository,
            lessonApi: mockLessonApi,
            userBloc: mockUserBloc);

        when(mockLessonRepository.unregister(
                registeredUser.selectedGymId, lessonWithRegisteredUser.date, lessonWithRegisteredUser.id, testAttendee1))
            .thenAnswer((realInvocation) => Future.value());

        registryBloc.add(Unregister(gymId: registeredUser.selectedGymId, attendee: testAttendee1));
      });

      test("should call unregister for an attendee", () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: lessonWithRegisteredUser.classCapacity,
            currentUser: registeredUser,
            attendees: lessonWithRegisteredUser.attendees,
            acceptedAttendees: lessonWithRegisteredUser.acceptedAttendees,
            isFullRegistry: false,
            isAcceptedUser: false,
            isRegisteredUser: true
          ),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );
        verify(mockLessonRepository.unregister(
            registeredUser.selectedGymId, lessonWithRegisteredUser.date, lessonWithRegisteredUser.id, testAttendee1));
      });
    });

    group("when add AcceptAttendees", () {
      User masterUser = User(
          name: "Gym Master",
          email: "gym@master.com",
          imageUrl: "masterPic",
          selectedGymId: "testGym");

      Lesson fakeLessonWithRegisteredAttendee = baseLesson.copyWith(
          attendees: [testAttendee1],
          acceptedAttendees: []
      );

      setUp(() {
        whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: masterUser)));

        registryBloc = RegistryBloc(
            lesson: fakeLessonWithRegisteredAttendee,
            lessonRepository: mockLessonRepository,
            lessonApi: mockLessonApi,
            userBloc: mockUserBloc);


        when(mockLessonApi.acceptAll(masterUser.selectedGymId, fakeLessonWithRegisteredAttendee))
            .thenAnswer((realInvocation) => Future.value());
      });

      test("should call api to accept all attendees", () async {
        registryBloc.add(AcceptAttendees(gymId: masterUser.selectedGymId));

        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(
            classCapacity: fakeLessonWithRegisteredAttendee.classCapacity,
            currentUser: masterUser,
            attendees: fakeLessonWithRegisteredAttendee.attendees,
            acceptedAttendees: fakeLessonWithRegisteredAttendee.acceptedAttendees,
            isAcceptedUser: false,
            isRegisteredUser: false,
            isFullRegistry: false
          ),
          RegistryLoading(),
        ];

        await expectLater(
          registryBloc,
          emitsInOrder(expectedState),
        );

        verify(mockLessonApi.acceptAll(masterUser.selectedGymId, fakeLessonWithRegisteredAttendee));
      });
    });
  });
}

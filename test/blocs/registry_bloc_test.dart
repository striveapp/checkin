import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockUserBloc extends MockBloc<UserState> implements UserBloc {}

class MockLessonApi extends Mock implements LessonApi {}

class MockLessonRepository extends Mock implements LessonRepository {}

void main() {
  group("RegistryBloc", () {
    MockUserBloc mockUserBloc;
    MockLessonApi mockLessonApi;
    MockLessonRepository mockLessonRepository;

    var testAttendee1 = Attendee(
        name: "Test1", email: "test1@test.com", imageUrl: "some image", grade: Grade.white);

    Lesson baseLesson = Lesson(
      id: "test id",
      date: "test date",
      classCapacity: 10,
      masters: [],
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
      configureThrowOnMissingStub([mockLessonApi, mockLessonRepository]);
    });

    tearDown(() {
      reset(mockUserBloc);
      logAndVerifyNoMoreInteractions([mockLessonApi, mockLessonRepository]);
    });

    group("initial state", () {
      RegistryBloc registryBloc;

      setUp(() {
        whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));
        when(mockLessonRepository.getLesson(fakeUser.selectedGymId, baseLesson.date, baseLesson.id))
            .thenAnswer((realInvocation) => Stream.value(baseLesson));

        registryBloc = RegistryBloc(
            lessonId: baseLesson.id,
            lessonDate: baseLesson.date,
            lessonRepository: mockLessonRepository,
            lessonApi: mockLessonApi,
            userBloc: mockUserBloc);
      });

      tearDown(() {
        verify(
            mockLessonRepository.getLesson(fakeUser.selectedGymId, baseLesson.date, baseLesson.id));
      });

      test('is RegistryUninitialized', () {
        expect(registryBloc.state, RegistryUninitialized());
      });

      tearDown(() {
        registryBloc?.close();
      });
    });

    group("on RegistryUpdated event", () {
      User acceptedUser = User(
          name: testAttendee1.name,
          email: testAttendee1.email,
          imageUrl: testAttendee1.imageUrl,
          selectedGymId: "testGym");

      Lesson fakeLessonWithAcceptedAttendee =
          baseLesson.copyWith(attendees: [], acceptedAttendees: [testAttendee1]);

      group("when currentUser is already accepted in lesson", () {
        setUp(() {
          whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: acceptedUser)));
          when(mockLessonRepository.getLesson(
            acceptedUser.selectedGymId,
            fakeLessonWithAcceptedAttendee.date,
            fakeLessonWithAcceptedAttendee.id,
          )).thenAnswer((realInvocation) => Stream.value(fakeLessonWithAcceptedAttendee));
        });

        tearDown(() {
          verify(mockLessonRepository.getLesson(
            acceptedUser.selectedGymId,
            fakeLessonWithAcceptedAttendee.date,
            fakeLessonWithAcceptedAttendee.id,
          ));
        });

        blocTest(
          "should emit RegistryLoaded with isAccepted = true",
          build: () => RegistryBloc(
              lessonId: fakeLessonWithAcceptedAttendee.id,
              lessonDate: fakeLessonWithAcceptedAttendee.date,
              lessonRepository: mockLessonRepository,
              lessonApi: mockLessonApi,
              userBloc: mockUserBloc),
          expect: [
            RegistryLoaded(
              currentUser: acceptedUser,
              currentLesson: fakeLessonWithAcceptedAttendee,
              isAcceptedUser: true,
              isRegisteredUser: false,
              isFullRegistry: false,
              isEmptyRegistry: false,
              isMasterOfTheClass: false,
            ),
          ],
        );
      });

      group("when currentUser is registered in lesson", () {
        User registeredUser = User(
            name: testAttendee1.name,
            email: testAttendee1.email,
            imageUrl: testAttendee1.imageUrl,
            selectedGymId: "testGym");

        Lesson lessonWithRegisteredUser =
            baseLesson.copyWith(attendees: [testAttendee1], acceptedAttendees: []);

        setUp(() {
          whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: registeredUser)));
          when(mockLessonRepository.getLesson(
            registeredUser.selectedGymId,
            lessonWithRegisteredUser.date,
            lessonWithRegisteredUser.id,
          )).thenAnswer((realInvocation) => Stream.value(lessonWithRegisteredUser));
        });

        tearDown(() {
          verify(mockLessonRepository.getLesson(
            registeredUser.selectedGymId,
            lessonWithRegisteredUser.date,
            lessonWithRegisteredUser.id,
          ));
        });

        blocTest(
          "should emit should emit RegistryLoaded with isRegisteredUser = true",
          build: () => RegistryBloc(
              lessonId: fakeLessonWithAcceptedAttendee.id,
              lessonDate: fakeLessonWithAcceptedAttendee.date,
              lessonRepository: mockLessonRepository,
              lessonApi: mockLessonApi,
              userBloc: mockUserBloc),
          expect: [
            RegistryLoaded(
              currentUser: registeredUser,
              currentLesson: lessonWithRegisteredUser,
              isAcceptedUser: false,
              isRegisteredUser: true,
              isFullRegistry: false,
              isEmptyRegistry: false,
              isMasterOfTheClass: false,
            ),
          ],
        );
      });

      group("when currentUser is not registered in lesson", () {
        Lesson lessonWithoutRegisteredUser =
            baseLesson.copyWith(attendees: [], acceptedAttendees: []);

        setUp(() {
          whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));
          when(mockLessonRepository.getLesson(fakeUser.selectedGymId,
                  lessonWithoutRegisteredUser.date, lessonWithoutRegisteredUser.id))
              .thenAnswer((realInvocation) => Stream.value(lessonWithoutRegisteredUser));
        });

        tearDown(() {
          verify(mockLessonRepository.getLesson(fakeUser.selectedGymId,
              lessonWithoutRegisteredUser.date, lessonWithoutRegisteredUser.id));
        });

        blocTest(
          "should emit RegistryLoaded with isRegisteredUser = false",
          build: () => RegistryBloc(
              lessonId: lessonWithoutRegisteredUser.id,
              lessonDate: lessonWithoutRegisteredUser.date,
              lessonRepository: mockLessonRepository,
              lessonApi: mockLessonApi,
              userBloc: mockUserBloc),
          expect: [
            RegistryLoaded(
              currentUser: fakeUser,
              currentLesson: lessonWithoutRegisteredUser,
              isAcceptedUser: false,
              isRegisteredUser: false,
              isFullRegistry: false,
              isEmptyRegistry: true,
              isMasterOfTheClass: false,
            ),
          ],
        );
      });

      group("when lesson is full", () {
        Lesson fakeLessonFull = baseLesson
            .copyWith(attendees: [], acceptedAttendees: [testAttendee1], classCapacity: 1);

        setUp(() {
          whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));
          when(mockLessonRepository.getLesson(
            fakeUser.selectedGymId,
            fakeLessonFull.date,
            fakeLessonFull.id,
          )).thenAnswer((realInvocation) => Stream.value(fakeLessonFull));
        });

        tearDown(() {
          verify(mockLessonRepository.getLesson(
            fakeUser.selectedGymId,
            fakeLessonFull.date,
            fakeLessonFull.id,
          ));
        });

        blocTest(
          "should emit RegistryLoaded with isFullRegistry = true",
          build: () => RegistryBloc(
              lessonId: fakeLessonFull.id,
              lessonDate: fakeLessonFull.date,
              lessonRepository: mockLessonRepository,
              lessonApi: mockLessonApi,
              userBloc: mockUserBloc),
          expect: [
            RegistryLoaded(
              currentUser: fakeUser,
              currentLesson: fakeLessonFull,
              isAcceptedUser: false,
              isRegisteredUser: false,
              isFullRegistry: true,
              isEmptyRegistry: false,
              isMasterOfTheClass: false,
            ),
          ],
        );
      });

      group("when lesson is empty", (){
        Lesson fakeLessonFull = baseLesson
            .copyWith(attendees: [], acceptedAttendees: [],);

        setUp((){
          whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));
          when(mockLessonRepository.getLesson(
            fakeUser.selectedGymId,
            fakeLessonFull.date,
            fakeLessonFull.id,
          )).thenAnswer((realInvocation) => Stream.value(fakeLessonFull));
        });

        tearDown((){
          verify(mockLessonRepository.getLesson(
            fakeUser.selectedGymId,
            fakeLessonFull.date,
            fakeLessonFull.id,
          ));
        });

        blocTest(
          "should emit RegistryLoaded with isEmptyRegistry = true",
          build: () => RegistryBloc(
              lessonId: fakeLessonFull.id,
              lessonDate: fakeLessonFull.date,
              lessonRepository: mockLessonRepository,
              lessonApi: mockLessonApi,
              userBloc: mockUserBloc),
          expect: [
            RegistryLoaded(
              currentUser: fakeUser,
              currentLesson: fakeLessonFull,
              isAcceptedUser: false,
              isRegisteredUser: false,
              isFullRegistry: false,
              isEmptyRegistry: true,
              isMasterOfTheClass: false,
            ),
          ],
        );
      });
    });

    group("on Register event", () {
      Attendee fakeAttendee =
          Attendee(name: "pepe", grade: Grade.white, imageUrl: "lol", email: "not@anemail");

      setUp(() {
        whenListen(mockUserBloc, Stream.value(null));
        when(mockLessonRepository.register(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id, fakeAttendee))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown((){
        verify(mockLessonRepository.register(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, fakeAttendee));
      });

      blocTest("should call register for an attendee", build: () =>  RegistryBloc(
          lessonId: baseLesson.id,
          lessonDate: baseLesson.date,
          lessonRepository: mockLessonRepository,
          lessonApi: mockLessonApi,
          userBloc: mockUserBloc),
        act: (bloc) => bloc.add(Register(gymId: fakeUser.selectedGymId, attendee: fakeAttendee)),
          expect: [],
          verify: (bloc) async {
            await untilCalled(mockLessonRepository.register(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id, fakeAttendee));
          });
    });

    group("on Unregister event", () {
      User registeredUser = User(
          name: testAttendee1.name,
          email: testAttendee1.email,
          imageUrl: testAttendee1.imageUrl,
          selectedGymId: "testGym");

      Lesson lessonWithRegisteredUser = baseLesson.copyWith(attendees: [testAttendee1]);

      setUp(() {
        whenListen(mockUserBloc, Stream.value(null));
        when(mockLessonRepository.unregister(registeredUser.selectedGymId,
                lessonWithRegisteredUser.date, lessonWithRegisteredUser.id, testAttendee1))
            .thenAnswer((realInvocation) => Future.value());
      });

      tearDown((){
        verify(mockLessonRepository.unregister(registeredUser.selectedGymId,
            lessonWithRegisteredUser.date, lessonWithRegisteredUser.id, testAttendee1));
      });

      blocTest("should call unregister for an attendee", build: () =>  RegistryBloc(
          lessonId: lessonWithRegisteredUser.id,
          lessonDate: lessonWithRegisteredUser.date,
          lessonRepository: mockLessonRepository,
          lessonApi: mockLessonApi,
          userBloc: mockUserBloc),
          act: (bloc) => bloc.add(Unregister(gymId: registeredUser.selectedGymId, attendee: testAttendee1)),
          expect: [],
          verify: (bloc) async {
            await untilCalled(mockLessonRepository.unregister(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id, testAttendee1));
          });
    });

    group("on AcceptAttendees event", () {
      User masterUser = User(
          name: "Gym Master",
          email: "gym@master.com",
          imageUrl: "masterPic",
          selectedGymId: "testGym");

      Lesson fakeLessonWithRegisteredAttendee = baseLesson.copyWith(
          masters: [Master.fromUser(masterUser)],
          attendees: [testAttendee1],
          acceptedAttendees: []);

      setUp(() {
        whenListen(mockUserBloc, Stream.value(null));

        when(mockLessonApi.acceptAll(
          masterUser.selectedGymId,
          fakeLessonWithRegisteredAttendee.id,
          fakeLessonWithRegisteredAttendee.date,
        )).thenAnswer((realInvocation) => Future.value());
      });

      tearDown((){
        verify(mockLessonApi.acceptAll(
          masterUser.selectedGymId,
          fakeLessonWithRegisteredAttendee.id,
          fakeLessonWithRegisteredAttendee.date,
        ));
      });

      blocTest("should call api to accept all attendees", build: () =>  RegistryBloc(
          lessonId: fakeLessonWithRegisteredAttendee.id,
          lessonDate: fakeLessonWithRegisteredAttendee.date,
          lessonRepository: mockLessonRepository,
          lessonApi: mockLessonApi,
          userBloc: mockUserBloc),
          act: (bloc) => bloc.add(AcceptAttendees(gymId: masterUser.selectedGymId)),
          expect: [RegistryLoading()],
          verify: (bloc) async {
            await untilCalled(mockLessonApi.acceptAll(
              masterUser.selectedGymId,
              fakeLessonWithRegisteredAttendee.id,
              fakeLessonWithRegisteredAttendee.date,
            ));
          });
    });
  });
}

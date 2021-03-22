import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockLessonApi extends Mock implements LessonApi {}

class MockLessonRepository extends Mock implements LessonRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

class MockImageRepository extends Mock implements ImageRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockDateUtil extends Mock implements DateUtil {}

void main() {
  group("RegistryBloc", () {
    MockLessonApi mockLessonApi;
    MockLessonRepository mockLessonRepository;
    MockImageRepository mockImageRepository;
    MockStorageRepository mockStorageRepository;
    MockUserRepository mockUserRepository;
    MockDateUtil mockDateUtil;

    var testAttendee1 = Attendee(
      name: "Test1",
      email: "test1@test.com",
      imageUrl: "some image",
      grade: Grade.white,
    );

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
      mockLessonApi = MockLessonApi();
      mockLessonRepository = MockLessonRepository();
      mockLessonRepository = MockLessonRepository();
      mockImageRepository = MockImageRepository();
      mockStorageRepository = MockStorageRepository();
      mockUserRepository = MockUserRepository();
      mockDateUtil = MockDateUtil();

      configureThrowOnMissingStub([
        mockLessonApi,
        mockLessonRepository,
        mockImageRepository,
        mockStorageRepository,
        mockUserRepository,
        mockDateUtil,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockLessonApi,
        mockLessonRepository,
        mockImageRepository,
        mockStorageRepository,
        mockUserRepository,
        mockDateUtil,
      ]);
    });

    group("initial state", () {
      blocTest("is RegistryUninitialized",
          build: () => RegistryBloc(
                lessonId: baseLesson.id,
                lessonDate: baseLesson.date,
                lessonRepository: mockLessonRepository,
                imageRepository: mockImageRepository,
                storageRepository: mockStorageRepository,
                lessonApi: mockLessonApi,
                userRepository: mockUserRepository,
                dateUtil: mockDateUtil,
              ),
          expect: () => [],
          verify: (bloc) {
            expect(bloc.state, RegistryUninitialized());
          });
    });

    group("on InitializeRegistry", () {
      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.value(fakeUser));
        when(mockLessonRepository.getLesson(fakeUser.selectedGymId, baseLesson.date, baseLesson.id))
            .thenAnswer((realInvocation) => Stream.value(baseLesson));
        when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
        verify(mockLessonRepository.getLesson(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
        ));
        verify(mockDateUtil.getCurrentDateTime());
      });

      blocTest(
        "should retrieve the lesson for the date",
        build: () => RegistryBloc(
          lessonId: baseLesson.id,
          lessonDate: baseLesson.date,
          lessonRepository: mockLessonRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
          lessonApi: mockLessonApi,
          userRepository: mockUserRepository,
          dateUtil: mockDateUtil,
        ),
        act: (bloc) => bloc.add(RegistryEvent.initializeRegistry()),
        expect: () => [
          RegistryLoaded(
            currentUser: fakeUser,
            currentLesson: baseLesson,
            isEmptyRegistry: true,
            nocache: testDate,
          )
        ],
      );
    });

    group("on RegistryUpdated event", () {
      group("when currentUser is already accepted in lesson", () {
        User acceptedUser = User(
            name: testAttendee1.name,
            email: testAttendee1.email,
            imageUrl: testAttendee1.imageUrl,
            selectedGymId: "testGym");

        Lesson fakeLessonWithAcceptedAttendee =
            baseLesson.copyWith(attendees: [], acceptedAttendees: [testAttendee1]);

        setUp(() {
          when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
        });

        tearDown(() {
          verify(mockDateUtil.getCurrentDateTime());
        });

        blocTest(
          "should emit RegistryLoaded with isAccepted = true",
          build: () => RegistryBloc(
            lessonId: fakeLessonWithAcceptedAttendee.id,
            lessonDate: fakeLessonWithAcceptedAttendee.date,
            lessonRepository: mockLessonRepository,
            imageRepository: mockImageRepository,
            storageRepository: mockStorageRepository,
            lessonApi: mockLessonApi,
            userRepository: mockUserRepository,
            dateUtil: mockDateUtil,
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: acceptedUser,
            currentLesson: fakeLessonWithAcceptedAttendee,
          )),
          expect: () => [
            RegistryLoaded(
              currentUser: acceptedUser,
              currentLesson: fakeLessonWithAcceptedAttendee,
              isAcceptedUser: true,
              nocache: testDate,
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
          when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
        });

        tearDown(() {
          verify(mockDateUtil.getCurrentDateTime());
        });

        blocTest(
          "should emit should emit RegistryLoaded with isRegisteredUser = true",
          build: () => RegistryBloc(
            lessonId: lessonWithRegisteredUser.id,
            lessonDate: lessonWithRegisteredUser.date,
            lessonRepository: mockLessonRepository,
            imageRepository: mockImageRepository,
            storageRepository: mockStorageRepository,
            lessonApi: mockLessonApi,
            userRepository: mockUserRepository,
            dateUtil: mockDateUtil,
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: registeredUser,
            currentLesson: lessonWithRegisteredUser,
          )),
          expect: () => [
            RegistryLoaded(
              currentUser: registeredUser,
              currentLesson: lessonWithRegisteredUser,
              isRegisteredUser: true,
              nocache: testDate,
            ),
          ],
        );
      });

      group("when lesson is full", () {
        Lesson fakeLessonFull = baseLesson
            .copyWith(attendees: [], acceptedAttendees: [testAttendee1], classCapacity: 1);

        setUp(() {
          when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
        });

        tearDown(() {
          verify(mockDateUtil.getCurrentDateTime());
        });

        blocTest(
          "should emit RegistryLoaded with isFullRegistry = true",
          build: () => RegistryBloc(
            lessonId: fakeLessonFull.id,
            lessonDate: fakeLessonFull.date,
            lessonRepository: mockLessonRepository,
            imageRepository: mockImageRepository,
            storageRepository: mockStorageRepository,
            lessonApi: mockLessonApi,
            userRepository: mockUserRepository,
            dateUtil: mockDateUtil,
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: fakeUser,
            currentLesson: fakeLessonFull,
          )),
          expect: () => [
            RegistryLoaded(
              currentUser: fakeUser,
              currentLesson: fakeLessonFull,
              isFullRegistry: true,
              nocache: testDate,
            ),
          ],
        );
      });

      group("when lesson is empty", () {
        setUp(() {
          when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
        });

        tearDown(() {
          verify(mockDateUtil.getCurrentDateTime());
        });

        blocTest(
          "should emit RegistryLoaded with isEmptyRegistry = true",
          build: () => RegistryBloc(
            lessonId: baseLesson.id,
            lessonDate: baseLesson.date,
            lessonRepository: mockLessonRepository,
            imageRepository: mockImageRepository,
            storageRepository: mockStorageRepository,
            lessonApi: mockLessonApi,
            userRepository: mockUserRepository,
            dateUtil: mockDateUtil,
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: fakeUser,
            currentLesson: baseLesson,
          )),
          expect: () => [
            RegistryLoaded(
              currentUser: fakeUser,
              currentLesson: baseLesson,
              isEmptyRegistry: true,
              nocache: testDate,
            ),
          ],
        );
      });

      group("when lesson is closed", () {
        Lesson fakeLessonClosed = baseLesson.copyWith(
          attendees: [testAttendee1],
          isClosed: true,
        );

        setUp(() {
          when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
        });

        tearDown(() {
          verify(mockDateUtil.getCurrentDateTime());
        });

        blocTest(
          "should emit RegistryLoaded with isClosedRegistry = true",
          build: () => RegistryBloc(
            lessonId: fakeLessonClosed.id,
            lessonDate: fakeLessonClosed.date,
            lessonRepository: mockLessonRepository,
            imageRepository: mockImageRepository,
            storageRepository: mockStorageRepository,
            lessonApi: mockLessonApi,
            userRepository: mockUserRepository,
            dateUtil: mockDateUtil,
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: fakeUser,
            currentLesson: fakeLessonClosed,
          )),
          expect: () => [
            RegistryLoaded(
              currentUser: fakeUser,
              currentLesson: fakeLessonClosed,
              isClosedRegistry: true,
              nocache: testDate,
            ),
          ],
        );
      });

      group("when lesson is not present anymore", () {
        final notExistingDate = '2020-30-02';
        final notExistingLessonId = "not_really_there_anymore";

        blocTest(
          "should emit RegistryMissing",
          build: () => RegistryBloc(
            lessonDate: notExistingDate,
            lessonId: notExistingLessonId,
            lessonRepository: mockLessonRepository,
            imageRepository: mockImageRepository,
            storageRepository: mockStorageRepository,
            lessonApi: mockLessonApi,
            userRepository: mockUserRepository,
            dateUtil: mockDateUtil,
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: fakeUser,
            currentLesson: null,
          )),
          expect: () => [
            RegistryMissing(),
          ],
        );
      });
    });

    group("on Register event", () {
      Attendee fakeAttendee =
          Attendee(name: "pepe", grade: Grade.white, imageUrl: "lol", email: "not@anemail");

      setUp(() {
        when(mockLessonRepository.register(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id, fakeAttendee))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        verify(mockLessonRepository.register(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, fakeAttendee));
      });

      blocTest("should call register for an attendee",
          build: () => RegistryBloc(
                lessonId: baseLesson.id,
                lessonDate: baseLesson.date,
                lessonRepository: mockLessonRepository,
                imageRepository: mockImageRepository,
                storageRepository: mockStorageRepository,
                lessonApi: mockLessonApi,
                userRepository: mockUserRepository,
                dateUtil: mockDateUtil,
              ),
          act: (bloc) => bloc.add(Register(gymId: fakeUser.selectedGymId, attendee: fakeAttendee)),
          expect: () => [],
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
        when(mockLessonRepository.unregister(registeredUser.selectedGymId,
                lessonWithRegisteredUser.date, lessonWithRegisteredUser.id, testAttendee1))
            .thenAnswer((realInvocation) => Future.value());
      });

      tearDown(() {
        verify(mockLessonRepository.unregister(registeredUser.selectedGymId,
            lessonWithRegisteredUser.date, lessonWithRegisteredUser.id, testAttendee1));
      });

      blocTest("should call unregister for an attendee",
          build: () => RegistryBloc(
                lessonId: lessonWithRegisteredUser.id,
                lessonDate: lessonWithRegisteredUser.date,
                lessonRepository: mockLessonRepository,
                imageRepository: mockImageRepository,
                storageRepository: mockStorageRepository,
                lessonApi: mockLessonApi,
                userRepository: mockUserRepository,
                dateUtil: mockDateUtil,
              ),
          act: (bloc) =>
              bloc.add(Unregister(gymId: registeredUser.selectedGymId, attendee: testAttendee1)),
          expect: () => [],
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
        acceptedAttendees: [],
      );

      setUp(() {
        when(mockLessonApi.acceptAll(
          masterUser.selectedGymId,
          fakeLessonWithRegisteredAttendee.id,
          fakeLessonWithRegisteredAttendee.date,
        )).thenAnswer((realInvocation) => Future.value());
      });

      tearDown(() {
        verify(mockLessonApi.acceptAll(
          masterUser.selectedGymId,
          fakeLessonWithRegisteredAttendee.id,
          fakeLessonWithRegisteredAttendee.date,
        ));
      });

      blocTest("should call api to accept all attendees",
          build: () => RegistryBloc(
                lessonId: fakeLessonWithRegisteredAttendee.id,
                lessonDate: fakeLessonWithRegisteredAttendee.date,
                lessonRepository: mockLessonRepository,
                imageRepository: mockImageRepository,
                storageRepository: mockStorageRepository,
                lessonApi: mockLessonApi,
                userRepository: mockUserRepository,
                dateUtil: mockDateUtil,
              ),
          act: (bloc) => bloc.add(AcceptAttendees(gymId: masterUser.selectedGymId)),
          expect: () => [RegistryLoading()],
          verify: (bloc) async {
            await untilCalled(mockLessonApi.acceptAll(
              masterUser.selectedGymId,
              fakeLessonWithRegisteredAttendee.id,
              fakeLessonWithRegisteredAttendee.date,
            ));
          });
    });

    group("on CloseLesson event", () {
      setUp(() {
        when(mockLessonRepository.closeLesson(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        verify(mockLessonRepository.closeLesson(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
        ));
      });

      blocTest("should close the class",
          build: () => RegistryBloc(
                lessonId: baseLesson.id,
                lessonDate: baseLesson.date,
                lessonRepository: mockLessonRepository,
                imageRepository: mockImageRepository,
                storageRepository: mockStorageRepository,
                lessonApi: mockLessonApi,
                userRepository: mockUserRepository,
                dateUtil: mockDateUtil,
              ),
          act: (bloc) => bloc.add(CloseLesson(
                gymId: fakeUser.selectedGymId,
              )),
          expect: () => [RegistryLoading()]);
    });

    group("on DeleteLesson event", () {
      setUp(() {
        when(mockLessonRepository.deleteLesson(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        untilCalled(mockLessonRepository.deleteLesson(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
        ));
        verify(mockLessonRepository.deleteLesson(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
        ));
      });

      blocTest("should delete the class",
          build: () => RegistryBloc(
                lessonId: baseLesson.id,
                lessonDate: baseLesson.date,
                lessonRepository: mockLessonRepository,
                imageRepository: mockImageRepository,
                storageRepository: mockStorageRepository,
                lessonApi: mockLessonApi,
                userRepository: mockUserRepository,
                dateUtil: mockDateUtil,
              ),
          act: (bloc) => bloc.add(DeleteLesson(
                gymId: fakeUser.selectedGymId,
              )),
          expect: () => []);
    });
  });
}

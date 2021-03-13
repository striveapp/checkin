import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockLessonApi extends Mock implements LessonApi {}

class MockLessonRepository extends Mock implements LessonRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

class MockImageRepository extends Mock implements ImageRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("RegistryBloc", () {
    MockLessonApi mockLessonApi;
    MockLessonRepository mockLessonRepository;
    MockImageRepository mockImageRepository;
    MockStorageRepository mockStorageRepository;
    MockUserRepository mockUserRepository;

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

      configureThrowOnMissingStub([
        mockLessonApi,
        mockLessonRepository,
        mockImageRepository,
        mockStorageRepository,
        mockUserRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockLessonApi,
        mockLessonRepository,
        mockImageRepository,
        mockStorageRepository,
        mockUserRepository,
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
              ),
          expect: [],
          verify: (bloc) {
            expect(bloc.state, RegistryUninitialized());
          });
    });

    group("on InitializeRegistry", () {
      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.value(fakeUser));
        when(mockLessonRepository.getLesson(fakeUser.selectedGymId, baseLesson.date, baseLesson.id))
            .thenAnswer((realInvocation) => Stream.value(baseLesson));
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
        verify(mockLessonRepository.getLesson(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
        ));
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
        ),
        act: (bloc) => bloc.add(RegistryEvent.initializeRegistry()),
        expect: [
          RegistryLoaded(
            currentUser: fakeUser,
            currentLesson: baseLesson,
            isEmptyRegistry: true,
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
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: acceptedUser,
            currentLesson: fakeLessonWithAcceptedAttendee,
          )),
          expect: [
            RegistryLoaded(
              currentUser: acceptedUser,
              currentLesson: fakeLessonWithAcceptedAttendee,
              isAcceptedUser: true,
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
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: registeredUser,
            currentLesson: lessonWithRegisteredUser,
          )),
          expect: [
            RegistryLoaded(
              currentUser: registeredUser,
              currentLesson: lessonWithRegisteredUser,
              isRegisteredUser: true,
            ),
          ],
        );
      });

      group("when lesson is full", () {
        Lesson fakeLessonFull = baseLesson
            .copyWith(attendees: [], acceptedAttendees: [testAttendee1], classCapacity: 1);

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
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: fakeUser,
            currentLesson: fakeLessonFull,
          )),
          expect: [
            RegistryLoaded(
              currentUser: fakeUser,
              currentLesson: fakeLessonFull,
              isFullRegistry: true,
            ),
          ],
        );
      });

      group("when lesson is empty", () {
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
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: fakeUser,
            currentLesson: baseLesson,
          )),
          expect: [
            RegistryLoaded(
              currentUser: fakeUser,
              currentLesson: baseLesson,
              isEmptyRegistry: true,
            ),
          ],
        );
      });

      group("when lesson is closed", () {
        Lesson fakeLessonClosed = baseLesson.copyWith(
          attendees: [testAttendee1],
          isClosed: true,
        );

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
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: fakeUser,
            currentLesson: fakeLessonClosed,
          )),
          expect: [
            RegistryLoaded(
              currentUser: fakeUser,
              currentLesson: fakeLessonClosed,
              isClosedRegistry: true,
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
          ),
          act: (bloc) => bloc.add(RegistryUpdated(
            currentUser: fakeUser,
            currentLesson: null,
          )),
          expect: [
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
              ),
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
              ),
          act: (bloc) =>
              bloc.add(Unregister(gymId: registeredUser.selectedGymId, attendee: testAttendee1)),
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
              ),
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
              ),
          act: (bloc) => bloc.add(CloseLesson(
                gymId: fakeUser.selectedGymId,
              )),
          expect: [RegistryLoading()]);
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
              ),
          act: (bloc) => bloc.add(DeleteLesson(
                gymId: fakeUser.selectedGymId,
              )),
          expect: []);
    });

    group("on UpdateTimeStart event", () {
      setUp(() {
        when(mockLessonRepository.updateLessonTimeStart(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id, "04:20"))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        untilCalled(mockLessonRepository.updateLessonTimeStart(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, "04:20"));
        verify(mockLessonRepository.updateLessonTimeStart(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, "04:20"));
      });

      blocTest(
        "should call repository with newTimeStart",
        build: () => RegistryBloc(
          lessonId: baseLesson.id,
          lessonDate: baseLesson.date,
          lessonRepository: mockLessonRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
          lessonApi: mockLessonApi,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(
          RegistryEvent.updateTimeStart(
            gymId: fakeUser.selectedGymId,
            newTimeStart: "04:20",
          ),
        ),
        expect: [],
      );
    });

    group("on UpdateTimeEnd event", () {
      setUp(() {
        when(mockLessonRepository.updateLessonTimeEnd(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id, "13:37"))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        untilCalled(mockLessonRepository.updateLessonTimeEnd(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, "13:37"));
        verify(mockLessonRepository.updateLessonTimeEnd(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, "13:37"));
      });

      blocTest(
        "should call repository with newTimeEnd",
        build: () => RegistryBloc(
          lessonId: baseLesson.id,
          lessonDate: baseLesson.date,
          lessonRepository: mockLessonRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
          lessonApi: mockLessonApi,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(
          RegistryEvent.updateTimeEnd(
            gymId: fakeUser.selectedGymId,
            newTimeEnd: "13:37",
          ),
        ),
        expect: [],
      );
    });

    group("on UpdateName event", () {
      var newName = "The class of death!";

      setUp(() {
        when(mockLessonRepository.updateLessonName(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id, newName))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        untilCalled(mockLessonRepository.updateLessonName(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, newName));
        verify(mockLessonRepository.updateLessonName(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, newName));
      });

      blocTest(
        "should call repository with newName",
        build: () => RegistryBloc(
          lessonId: baseLesson.id,
          lessonDate: baseLesson.date,
          lessonRepository: mockLessonRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
          lessonApi: mockLessonApi,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(
          RegistryEvent.updateName(
            gymId: fakeUser.selectedGymId,
            newName: newName,
          ),
        ),
        expect: [],
      );
    });

    group("on UpdateCapacity event", () {
      var newCapacity = 420;

      setUp(() {
        when(mockLessonRepository.updateLessonCapacity(
                fakeUser.selectedGymId, baseLesson.date, baseLesson.id, newCapacity))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        untilCalled(mockLessonRepository.updateLessonCapacity(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, newCapacity));
        verify(mockLessonRepository.updateLessonCapacity(
            fakeUser.selectedGymId, baseLesson.date, baseLesson.id, newCapacity));
      });

      blocTest(
        "should call repository with newCapacity",
        build: () => RegistryBloc(
          lessonId: baseLesson.id,
          lessonDate: baseLesson.date,
          lessonRepository: mockLessonRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
          lessonApi: mockLessonApi,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(
          RegistryEvent.updateCapacity(
            gymId: fakeUser.selectedGymId,
            newCapacity: newCapacity,
          ),
        ),
        expect: [],
      );
    });

    group("on UpdateImageUrl event", () {
      var newImageUrl = "http://1337.o/a.png";
      File fakeImage = File("some_file");

      setUp(() {
        when(mockImageRepository.getCroppedImage()).thenAnswer((_) {
          return Future.value(fakeImage);
        });

        when(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))))
            .thenAnswer((_) {
          return Future.value(newImageUrl);
        });

        when(mockLessonRepository.updateLessonImage(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
          newImageUrl,
        )).thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(mockImageRepository.getCroppedImage());
        await untilCalled(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))));
        await untilCalled(mockLessonRepository.updateLessonImage(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
          newImageUrl,
        ));

        verify(mockImageRepository.getCroppedImage());
        verify(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))));
        verify(mockLessonRepository.updateLessonImage(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
          newImageUrl,
        ));
      });

      blocTest(
        "should call repository with newImageUrl",
        build: () => RegistryBloc(
          lessonId: baseLesson.id,
          lessonDate: baseLesson.date,
          lessonRepository: mockLessonRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
          lessonApi: mockLessonApi,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(
          RegistryEvent.updateImageUrl(
            gymId: fakeUser.selectedGymId,
          ),
        ),
        expect: [],
      );
    });

    group("on UpdateMasters event", () {
      var newMasters = [
        Master(
            name: "felicio",
            imageUrl: "http://felicio.mastronzo.jpg",
            email: "felicio@mastronzo.com")
      ];

      setUp(() {
        when(mockLessonRepository.updateLessonMasters(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
          newMasters,
        )).thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(mockLessonRepository.updateLessonMasters(
          fakeUser.selectedGymId,
          baseLesson.date,
          baseLesson.id,
          newMasters,
        ));
      });

      blocTest(
        "should call repository with newMasters",
        build: () => RegistryBloc(
          lessonId: baseLesson.id,
          lessonDate: baseLesson.date,
          lessonRepository: mockLessonRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
          lessonApi: mockLessonApi,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(
          RegistryEvent.updateMasters(
            gymId: fakeUser.selectedGymId,
            newMasters: newMasters,
          ),
        ),
        expect: [],
      );
    });
  });
}

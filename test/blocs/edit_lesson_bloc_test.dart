import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/edit_lesson/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockLessonRepository extends Mock implements LessonRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

class MockImageRepository extends Mock implements ImageRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("EditLessonBloc", () {
    MockLessonRepository mockLessonRepository;
    MockImageRepository mockImageRepository;
    MockStorageRepository mockStorageRepository;
    MockUserRepository mockUserRepository;

    String fakeGymId = "testGym";
    Lesson baseLesson = Lesson(
      id: "test id",
      date: "test date",
      classCapacity: 10,
      masters: [],
      attendees: [],
      acceptedAttendees: [],
    );
    List<Master> availableMasters = [
      Master(
        name: "master1",
        imageUrl: "http://the.jpg",
        email: "master1@master.com",
      ),
      Master(
        name: "master2",
        imageUrl: "http://the.png",
        email: "master2@master.com",
      ),
    ];

    setUp(() {
      mockLessonRepository = MockLessonRepository();
      mockImageRepository = MockImageRepository();
      mockStorageRepository = MockStorageRepository();
      mockUserRepository = MockUserRepository();

      configureThrowOnMissingStub([
        mockLessonRepository,
        mockImageRepository,
        mockStorageRepository,
        mockUserRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockLessonRepository,
        mockImageRepository,
        mockStorageRepository,
        mockUserRepository,
      ]);
    });

    group("initial state", () {
      blocTest("is EditLessonUninitialized",
          build: () => EditLessonBloc(
                gymId: fakeGymId,
                lesson: baseLesson,
                lessonRepository: mockLessonRepository,
                userRepository: mockUserRepository,
                imageRepository: mockImageRepository,
                storageRepository: mockStorageRepository,
              ),
          expect: [],
          verify: (bloc) {
            expect(bloc.state, EditLessonState.editLessonUninitialized());
          });
    });

    group("on RetrieveMasters event", () {
      setUp(() {
        when(mockUserRepository.retrieveAvailableMasters(
          fakeGymId,
        )).thenAnswer((realInvocation) => Stream.value(availableMasters));
      });

      tearDown(() {
        verify(mockUserRepository.retrieveAvailableMasters(
          fakeGymId,
        ));
      });

      blocTest(
        "fetch the available masters",
        build: () => EditLessonBloc(
          gymId: fakeGymId,
          lesson: baseLesson,
          lessonRepository: mockLessonRepository,
          userRepository: mockUserRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
        ),
        act: (bloc) => bloc.add(
          EditLessonEvent.retrieveMasters(),
        ),
        expect: [
          EditLessonState.mastersLoaded(
            masters: availableMasters,
          )
        ],
      );
    });

    group("on UpdateTimeStart event", () {
      setUp(() {
        when(mockLessonRepository.updateLessonTimeStart(
                fakeGymId, baseLesson.date, baseLesson.id, "04:20"))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        untilCalled(mockLessonRepository.updateLessonTimeStart(
            fakeGymId, baseLesson.date, baseLesson.id, "04:20"));
        verify(mockLessonRepository.updateLessonTimeStart(
            fakeGymId, baseLesson.date, baseLesson.id, "04:20"));
      });

      blocTest(
        "should call repository with newTimeStart",
        build: () => EditLessonBloc(
          gymId: fakeGymId,
          lesson: baseLesson,
          lessonRepository: mockLessonRepository,
          userRepository: mockUserRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
        ),
        act: (bloc) => bloc.add(
          EditLessonEvent.updateTimeStart(
            newTimeStart: "04:20",
          ),
        ),
        expect: [],
      );
    });

    group("on UpdateTimeEnd event", () {
      setUp(() {
        when(mockLessonRepository.updateLessonTimeEnd(
                fakeGymId, baseLesson.date, baseLesson.id, "13:37"))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        untilCalled(mockLessonRepository.updateLessonTimeEnd(
            fakeGymId, baseLesson.date, baseLesson.id, "13:37"));
        verify(mockLessonRepository.updateLessonTimeEnd(
            fakeGymId, baseLesson.date, baseLesson.id, "13:37"));
      });

      blocTest(
        "should call repository with newTimeEnd",
        build: () => EditLessonBloc(
          gymId: fakeGymId,
          lesson: baseLesson,
          lessonRepository: mockLessonRepository,
          userRepository: mockUserRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
        ),
        act: (bloc) => bloc.add(
          EditLessonEvent.updateTimeEnd(
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
                fakeGymId, baseLesson.date, baseLesson.id, newName))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        untilCalled(mockLessonRepository.updateLessonName(
            fakeGymId, baseLesson.date, baseLesson.id, newName));
        verify(mockLessonRepository.updateLessonName(
            fakeGymId, baseLesson.date, baseLesson.id, newName));
      });

      blocTest(
        "should call repository with newName",
        build: () => EditLessonBloc(
          gymId: fakeGymId,
          lesson: baseLesson,
          lessonRepository: mockLessonRepository,
          userRepository: mockUserRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
        ),
        act: (bloc) => bloc.add(
          EditLessonEvent.updateName(
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
                fakeGymId, baseLesson.date, baseLesson.id, newCapacity))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        untilCalled(mockLessonRepository.updateLessonCapacity(
            fakeGymId, baseLesson.date, baseLesson.id, newCapacity));
        verify(mockLessonRepository.updateLessonCapacity(
            fakeGymId, baseLesson.date, baseLesson.id, newCapacity));
      });

      blocTest(
        "should call repository with newCapacity",
        build: () => EditLessonBloc(
          gymId: fakeGymId,
          lesson: baseLesson,
          lessonRepository: mockLessonRepository,
          userRepository: mockUserRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
        ),
        act: (bloc) => bloc.add(
          EditLessonEvent.updateCapacity(
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
          fakeGymId,
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
          fakeGymId,
          baseLesson.date,
          baseLesson.id,
          newImageUrl,
        ));

        verify(mockImageRepository.getCroppedImage());
        verify(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))));
        verify(mockLessonRepository.updateLessonImage(
          fakeGymId,
          baseLesson.date,
          baseLesson.id,
          newImageUrl,
        ));
      });

      blocTest(
        "should call repository with newImageUrl",
        build: () => EditLessonBloc(
          gymId: fakeGymId,
          lesson: baseLesson,
          lessonRepository: mockLessonRepository,
          userRepository: mockUserRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
        ),
        act: (bloc) => bloc.add(
          EditLessonEvent.updateImageUrl(),
        ),
        expect: [],
      );
    });

    group("on UpdateMasters event", () {
      var newMasters = [
        Master(
          name: "felicio",
          imageUrl: "http://felicio.mastronzo.jpg",
          email: "felicio@mastronzo.com",
        )
      ];

      setUp(() {
        when(mockLessonRepository.updateLessonMasters(
          fakeGymId,
          baseLesson.date,
          baseLesson.id,
          newMasters,
        )).thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(mockLessonRepository.updateLessonMasters(
          fakeGymId,
          baseLesson.date,
          baseLesson.id,
          newMasters,
        ));
        verify(mockLessonRepository.updateLessonMasters(
          fakeGymId,
          baseLesson.date,
          baseLesson.id,
          newMasters,
        ));
      });

      blocTest(
        "should call repository with newMasters",
        build: () => EditLessonBloc(
          gymId: fakeGymId,
          lesson: baseLesson,
          lessonRepository: mockLessonRepository,
          userRepository: mockUserRepository,
          imageRepository: mockImageRepository,
          storageRepository: mockStorageRepository,
        ),
        act: (bloc) => bloc.add(
          EditLessonEvent.updateMasters(
            newMasters: newMasters,
          ),
        ),
        expect: [],
      );
    });
  });
}

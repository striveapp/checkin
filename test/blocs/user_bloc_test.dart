import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

class MockImageRepository extends Mock implements ImageRepository {}

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  group("UserBloc", () {
    MockUserRepository mockUserRepository;
    MockStorageRepository mockStorageRepository;
    MockImageRepository mockImageRepository;
    AuthBloc mockAuthBloc;
    User testUser = User(
        name: "Tobuto Nellano",
        email: "tobuto@nelano.com",
        imageUrl: "http://image.url",
        selectedGymId: "fake gym");

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockStorageRepository = MockStorageRepository();
      mockImageRepository = MockImageRepository();
      mockAuthBloc = MockAuthBloc();

      configureThrowOnMissingStub([mockUserRepository, mockStorageRepository, mockImageRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions(
          [mockUserRepository, mockStorageRepository, mockImageRepository]);
    });

    // todo missing initial state test

    group("on UserUpdated event", () {
      setUp(() {
        whenListen(mockAuthBloc, Stream.fromIterable([AuthAuthenticated(loggedUser: testUser)]));
      });

      group("when user is not null", () {
        setUp(() {
          when(mockUserRepository.getUserByEmail(testUser.email)).thenAnswer((_) {
            return Stream<User>.fromFuture(Future.value(testUser));
          });
        });

        tearDown(() async {
          verify(mockUserRepository.getUserByEmail(testUser.email));
        });

        blocTest(
          "should emit UserSuccess",
          build: () => UserBloc(
            authBloc: mockAuthBloc,
            userRepository: mockUserRepository,
            storageRepository: mockStorageRepository,
            imageRepository: mockImageRepository,
          ),
          expect: [UserSuccess(currentUser: testUser)],
        );
      });

      group("when user is null", () {
        setUp(() {
          when(mockUserRepository.getUserByEmail(testUser.email)).thenAnswer((_) {
            return Stream<User>.fromFuture(Future.value(null));
          });
        });

        tearDown(() {
          verify(mockUserRepository.getUserByEmail(testUser.email));
        });

        blocTest(
          "should emit UserError",
          build: () => UserBloc(
            authBloc: mockAuthBloc,
            userRepository: mockUserRepository,
            storageRepository: mockStorageRepository,
            imageRepository: mockImageRepository,
          ),
          expect: [UserError()],
        );
      });
    });

    group("on UpdateGrade event", () {
      setUp(() async {
        when(mockUserRepository.updateGrade(testUser.email, Grade.black)).thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(mockUserRepository.updateGrade(testUser.email, Grade.black));
        verify(mockUserRepository.updateGrade(testUser.email, Grade.black));
      });

      blocTest("should update the user grade",
          build: () => UserBloc(
                authBloc: mockAuthBloc,
                userRepository: mockUserRepository,
                storageRepository: mockStorageRepository,
                imageRepository: mockImageRepository,
              ),
          seed: UserState.userSuccess(currentUser: testUser),
          act: (bloc) => bloc.add(UpdateGrade(newGrade: Grade.black)),
          expect: []);
    });

    group("on UpdateName event", () {
      var newName = "Porco";

      setUp(() {
        when(mockUserRepository.updateUserName(testUser.email, newName)).thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(mockUserRepository.updateUserName(testUser.email, newName));
        verify(mockUserRepository.updateUserName(testUser.email, newName));
      });

      blocTest("should update the user name",
          build: () => UserBloc(
                authBloc: mockAuthBloc,
                userRepository: mockUserRepository,
                storageRepository: mockStorageRepository,
                imageRepository: mockImageRepository,
              ),
          seed: UserState.userSuccess(currentUser: testUser),
          act: (bloc) => bloc.add(UpdateName(newName: newName)),
          expect: []);
    });

    group("on UpdateImageUrl event", () {
      var newImageUrl = "http://porc.o/a.png";
      File fakeImage = File("some_file");

      setUp(() {
        when(mockImageRepository.getCroppedImage()).thenAnswer((_) {
          return Future.value(fakeImage);
        });

        when(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))))
            .thenAnswer((_) {
          return Future.value(newImageUrl);
        });

        when(mockUserRepository.updateUserImageUrl(testUser.email, newImageUrl)).thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(mockImageRepository.getCroppedImage());
        await untilCalled(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))));
        await untilCalled(mockUserRepository.updateUserImageUrl(testUser.email, newImageUrl));
        verify(mockImageRepository.getCroppedImage());
        verify(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))));
        verify(mockUserRepository.updateUserImageUrl(testUser.email, newImageUrl));
      });

      blocTest("should update the user image url",
          build: () => UserBloc(
                authBloc: mockAuthBloc,
                userRepository: mockUserRepository,
                storageRepository: mockStorageRepository,
                imageRepository: mockImageRepository,
              ),
          seed: UserState.userSuccess(currentUser: testUser),
          act: (bloc) => bloc.add(UserEvent.updateImageUrl(
                userEmail: testUser.email,
              )),
          expect: []);
    });

    group("on UpdateFcmToken event", () {
      var newToken = "some token";

      setUp(() {
        when(mockUserRepository.updateUserFcmToken(testUser.email, newToken)).thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(mockUserRepository.updateUserFcmToken(testUser.email, newToken));
        verify(mockUserRepository.updateUserFcmToken(testUser.email, newToken));
      });

      blocTest("should update the user fcm token",
          build: () => UserBloc(
                authBloc: mockAuthBloc,
                userRepository: mockUserRepository,
                storageRepository: mockStorageRepository,
                imageRepository: mockImageRepository,
              ),
          seed: UserState.userSuccess(currentUser: testUser),
          act: (bloc) =>
              bloc.add(UserEvent.updateFcmToken(userEmail: testUser.email, newToken: newToken)),
          expect: []);
    });

    group("on UpdateSelectedGym event", () {
      var newSelectedGymId = "testGym";

      setUp(() {
        when(mockUserRepository.updateSelectedGymId(testUser.email, newSelectedGymId))
            .thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(mockUserRepository.updateSelectedGymId(testUser.email, newSelectedGymId));
        verify(mockUserRepository.updateSelectedGymId(testUser.email, newSelectedGymId));
      });

      blocTest("should update the user selected gym",
          build: () => UserBloc(
                authBloc: mockAuthBloc,
                userRepository: mockUserRepository,
                storageRepository: mockStorageRepository,
                imageRepository: mockImageRepository,
              ),
          seed: UserState.userSuccess(currentUser: testUser),
          act: (bloc) => bloc.add(
              UserEvent.updateSelectedGym(userEmail: testUser.email, newGymId: newSelectedGymId)),
          expect: []);
    });
  });
}

import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
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

void main() {
  group("ProfileBloc", () {
    MockUserRepository mockUserRepository;
    MockStorageRepository mockStorageRepository;
    MockImageRepository mockImageRepository;

    User loggedUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
    );
    User fakeOtherUser = User(
      name: "Test",
      email: "some@other",
      imageUrl: "someImage",
    );

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockStorageRepository = MockStorageRepository();
      mockImageRepository = MockImageRepository();

      configureThrowOnMissingStub([
        mockUserRepository,
        mockStorageRepository,
        mockImageRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockUserRepository,
        mockStorageRepository,
        mockImageRepository,
      ]);
    });

    group("initial state", () {
      blocTest("is InitialProfileState",
          build: () => ProfileBloc(
                userRepository: mockUserRepository,
                storageRepository: mockStorageRepository,
                imageRepository: mockImageRepository,
              ),
          expect: () => [],
          verify: (bloc) {
            expect(bloc.state, InitialProfileState());
          });
    });

    group("on InitialProfileState", () {
      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.value(loggedUser));
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
      });

      group("when the user to load is the current one", () {
        blocTest(
          "should load the current user profile",
          build: () => ProfileBloc(
            userRepository: mockUserRepository,
            storageRepository: mockStorageRepository,
            imageRepository: mockImageRepository,
          ),
          act: (bloc) => bloc.add(InitializeProfile()),
          expect: () => [ProfileLoaded(profileUser: loggedUser, isCurrentUser: true)],
        );
      });

      group("when the user to load is different from the current one", () {
        setUp(() {
          when(mockUserRepository.getUserByEmail(fakeOtherUser.email)).thenAnswer((_) {
            return Stream<User>.value(fakeOtherUser);
          });
        });

        tearDown(() {
          verify(mockUserRepository.getUserByEmail(fakeOtherUser.email));
        });

        blocTest(
          "should load the current user profile",
          build: () => ProfileBloc(
            userRepository: mockUserRepository,
            storageRepository: mockStorageRepository,
            imageRepository: mockImageRepository,
            nonCurrentUserEmail: fakeOtherUser.email,
          ),
          act: (bloc) => bloc.add(InitializeProfile()),
          expect: () => [ProfileLoaded(profileUser: fakeOtherUser, isCurrentUser: false)],
        );
      });
    });

    group("on ProfileUpdated", () {
      group("when load profile of current user", () {
        group("when there is no nonCurrentUserEmail", () {
          blocTest(
            "should emit ProfileLoaded with the current user and isCurrent user as true",
            build: () => ProfileBloc(
              userRepository: mockUserRepository,
              storageRepository: mockStorageRepository,
              imageRepository: mockImageRepository,
            ),
            act: (bloc) => bloc.add(ProfileUpdated(user: loggedUser, isCurrentUser: true)),
            expect: () => [ProfileLoaded(profileUser: loggedUser, isCurrentUser: true)],
          );
        });
        group("when there is a nonCurrentUserEmail but the email is the same", () {
          blocTest(
            "should emit ProfileLoaded with the current user and isCurrent user as true",
            build: () => ProfileBloc(
              userRepository: mockUserRepository,
              storageRepository: mockStorageRepository,
              imageRepository: mockImageRepository,
              nonCurrentUserEmail: loggedUser.email,
            ),
            act: (bloc) => bloc.add(ProfileUpdated(user: loggedUser, isCurrentUser: true)),
            expect: () => [ProfileLoaded(profileUser: loggedUser, isCurrentUser: true)],
          );
        });
      });

      group("when load profile on another user", () {
        blocTest(
          "should emit ProfileLoaded with another user and isCurrent user as false",
          build: () => ProfileBloc(
            userRepository: mockUserRepository,
            storageRepository: mockStorageRepository,
            imageRepository: mockImageRepository,
            nonCurrentUserEmail: fakeOtherUser.email,
          ),
          act: (bloc) => bloc.add(ProfileUpdated(user: fakeOtherUser, isCurrentUser: false)),
          expect: () => [ProfileLoaded(profileUser: fakeOtherUser, isCurrentUser: false)],
        );
      });
    });

    group("on UpdateName event", () {
      var newName = "Porco";

      setUp(() {
        when(mockUserRepository.updateUserName(loggedUser.email, newName)).thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(mockUserRepository.updateUserName(loggedUser.email, newName));
        verify(mockUserRepository.updateUserName(loggedUser.email, newName));
      });

      blocTest("should update the user name",
          build: () => ProfileBloc(
                userRepository: mockUserRepository,
                storageRepository: mockStorageRepository,
                imageRepository: mockImageRepository,
              ),
          act: (bloc) => bloc.add(UpdateName(
                userEmail: loggedUser.email,
                newName: newName,
              )),
          expect: () => []);
    });

    group("on UpdateImageUrl event", () {
      var newImageUrl = "http://porc.o/a.png";
      File fakeImage = File("some_file");

      setUp(() {
        when(mockImageRepository.getCroppedImage()).thenAnswer((_) => Future.value(fakeImage));
        when(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))))
            .thenAnswer((_) => Future.value(newImageUrl));
        when(mockUserRepository.updateUserImageUrl(loggedUser.email, newImageUrl))
            .thenAnswer((_) => Future.value(null));
      });

      tearDown(() async {
        await untilCalled(mockImageRepository.getCroppedImage());
        await untilCalled(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))));
        await untilCalled(mockUserRepository.updateUserImageUrl(loggedUser.email, newImageUrl));
        verify(mockImageRepository.getCroppedImage());
        verify(mockStorageRepository.uploadImage(fakeImage, argThat(endsWith(".png"))));
        verify(mockUserRepository.updateUserImageUrl(loggedUser.email, newImageUrl));
      });

      blocTest("should update the user image url",
          build: () => ProfileBloc(
                userRepository: mockUserRepository,
                storageRepository: mockStorageRepository,
                imageRepository: mockImageRepository,
              ),
          act: (bloc) => bloc.add(UpdateImageUrl(
                userEmail: loggedUser.email,
              )),
          expect: () => []);
    });
  });
}

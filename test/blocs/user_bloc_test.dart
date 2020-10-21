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
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}
class MockstorageRepository extends Mock implements StorageRepository {}
class MockImageRepository extends Mock implements ImageRepository {}
class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  group("UserBloc", () {
    UserRepository mockUserRepository;
    StorageRepository mockstorageRepository;
    ImageRepository mockImageRepository;
    User testUser;
    UserBloc userBloc;
    AuthBloc mockAuthBloc;
    StreamController<User> userStreamCtrl;

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockstorageRepository = MockstorageRepository();
      mockImageRepository = MockImageRepository();
      mockAuthBloc = MockAuthBloc();
      userStreamCtrl = StreamController<User>();
      testUser = User(
          name: "Tobuto Nellano",
          email: "tobuto@nelano.com",
          imageUrl: "http://image.url");
      whenListen(
          mockAuthBloc,
          Stream.fromIterable(
              [AuthAuthenticated(loggedUser: testUser)]));
      when(mockUserRepository.getUserByEmail(testUser.email)).thenAnswer((_) {
        return userStreamCtrl.stream;
      });
    });

    tearDown(() {
      userStreamCtrl.close();
    });

    group("when add UserUpdated", () {
      group("when user is not null", () {
        test("should emits UserSuccess", () async {
          final expectedState = [
            UserLoading(),
            UserSuccess(currentUser: testUser),
          ];

          userStreamCtrl.add(testUser);
          userBloc = UserBloc(
            authBloc: mockAuthBloc,
            userRepository: mockUserRepository,
            storageRepository: mockstorageRepository,
            imageRepository: mockImageRepository,
          );

          await expectLater(
            userBloc,
            emitsInOrder(expectedState),
          );
        });
      });

      group("when user is null", () {
        test("should emit UserLoading when user is null", () async {
          final expectedState = [
            UserLoading(),
            UserError(),
          ];

          userBloc = UserBloc(
            authBloc: mockAuthBloc,
            userRepository: mockUserRepository,
            storageRepository: mockstorageRepository,
            imageRepository: mockImageRepository,
          );

          userStreamCtrl.add(null);
          await expectLater(
            userBloc,
            emitsInOrder(expectedState),
          );
        });
      });
    });

    group("when add UpdateGrade", () {
      test("should update the user grade", () async {
        final setupState = [
          UserLoading(),
          UserSuccess(currentUser: testUser),
        ];

        userBloc = UserBloc(
          authBloc: mockAuthBloc,
          userRepository: mockUserRepository,
          storageRepository: mockstorageRepository,
          imageRepository: mockImageRepository,
        );
        userStreamCtrl.add(testUser);

        await expectLater(
          userBloc,
          emitsInOrder(setupState),
        );

        userBloc.add(UpdateGrade(newGrade: Grade.black));

        User updateUser = User(
          email: testUser.email,
          imageUrl: testUser.imageUrl,
          name: testUser.name,
          grade: Grade.black,
        );

        when(mockUserRepository.updateGrade(
                testUser.email, Grade.black))
            .thenAnswer((_) {
          userStreamCtrl.add(updateUser);
          return Future.value(null);
        });

        final expectedState = [
          UserSuccess(currentUser: testUser),
          UserSuccess(currentUser: updateUser)
        ];

        await expectLater(
          userBloc,
          emitsInOrder(expectedState),
        );
        verify(mockUserRepository.updateGrade(
            testUser.email, Grade.black));
      });
    });

    group("when add UpdateName", () {
      test("should update the user name", () async {
        final setupState = [
          UserLoading(),
          UserSuccess(currentUser: testUser),
        ];

        userBloc = UserBloc(
          authBloc: mockAuthBloc,
          userRepository: mockUserRepository,
          storageRepository: mockstorageRepository,
          imageRepository: mockImageRepository,
        );
        userStreamCtrl.add(testUser);

        await expectLater(
          userBloc,
          emitsInOrder(setupState),
        );

        var newName = "Porco";

        userBloc.add(UpdateName(newName: newName));

        User updateUser = User(
          email: testUser.email,
          imageUrl: testUser.imageUrl,
          name: newName,
        );

        when(mockUserRepository.updateUserName(testUser.email, newName))
            .thenAnswer((_) {
          userStreamCtrl.add(updateUser);
          return Future.value(null);
        });

        final expectedState = [
          UserSuccess(currentUser: testUser),
          UserSuccess(currentUser: updateUser)
        ];

        await expectLater(
          userBloc,
          emitsInOrder(expectedState),
        );
        verify(mockUserRepository.updateUserName(testUser.email, newName));
      });
    });

    group("when add UpdateImageUrl", () {
      test("should update the user image url", () async {
        final setupState = [
          UserLoading(),
          UserSuccess(currentUser: testUser),
        ];

        userBloc = UserBloc(
          authBloc: mockAuthBloc,
          userRepository: mockUserRepository,
          storageRepository: mockstorageRepository,
          imageRepository: mockImageRepository,
        );
        userStreamCtrl.add(testUser);

        await expectLater(
          userBloc,
          emitsInOrder(setupState),
        );

        var newImageUrl = "http://porc.o/a.png";

        userBloc.add(UserEvent.updateImageUrl(
          userEmail: testUser.email,
        ));

        User updateUser = User(
          email: testUser.email,
          name: testUser.name,
          imageUrl: newImageUrl,
        );
        File fakeImage = File("some_file");

        when(mockImageRepository.getCroppedImage()).thenAnswer((_) {
          return Future.value(fakeImage);
        });

        when(mockstorageRepository.uploadImage(fakeImage, argThat(endsWith(".png")))).thenAnswer((_) {
          return Future.value(newImageUrl);
        });

        when(mockUserRepository.updateUserImageUrl(testUser.email, newImageUrl))
            .thenAnswer((_) {
          userStreamCtrl.add(updateUser);
          return Future.value(null);
        });

        final expectedState = [
          UserSuccess(currentUser: testUser),
          UserSuccess(currentUser: updateUser)
        ];

        await expectLater(
          userBloc,
          emitsInOrder(expectedState),
        );
        verify(
            mockUserRepository.updateUserImageUrl(testUser.email, newImageUrl));
      });
    });

    group("when add UpdateSelectedGym", () {
      test("should update the user selected gym", () async {
        final setupState = [
          UserLoading(),
          UserSuccess(currentUser: testUser),
        ];

        userBloc = UserBloc(
          authBloc: mockAuthBloc,
          userRepository: mockUserRepository,
          storageRepository: mockstorageRepository,
          imageRepository: mockImageRepository,
        );
        userStreamCtrl.add(testUser);

        await expectLater(
          userBloc,
          emitsInOrder(setupState),
        );

        var newSelectedGym = "pokemon gym";

        userBloc.add(UserEvent.updateSelectedGym(
            userEmail: testUser.email, newSelectedGym: newSelectedGym));

        User updateUser = User(
          email: testUser.email,
          imageUrl: testUser.imageUrl,
          name: newSelectedGym,
        );

        when(mockUserRepository.updateSelectedGymId(
                testUser.email, newSelectedGym))
            .thenAnswer((_) {
          userStreamCtrl.add(updateUser);
          return Future.value(null);
        });

        final expectedState = [
          UserSuccess(currentUser: testUser),
          UserSuccess(currentUser: updateUser)
        ];

        await expectLater(
          userBloc,
          emitsInOrder(expectedState),
        );
        verify(mockUserRepository.updateSelectedGymId(
            testUser.email, newSelectedGym));
      });
    });

    group("when add UpdateFcmToken", () {
      test("should update the user fcm token", () async {
        final setupState = [
          UserLoading(),
          UserSuccess(currentUser: testUser),
        ];

        userBloc = UserBloc(
          authBloc: mockAuthBloc,
          userRepository: mockUserRepository,
          storageRepository: mockstorageRepository,
          imageRepository: mockImageRepository,
        );
        userStreamCtrl.add(testUser);

        await expectLater(
          userBloc,
          emitsInOrder(setupState),
        );

        var newToken = "some token";

        userBloc.add(UserEvent.updateFcmToken(
            userEmail: testUser.email, newToken: newToken));

        when(mockUserRepository.updateUserFcmToken(testUser.email, newToken))
            .thenAnswer((_) {
          userStreamCtrl.add(testUser);
          return Future.value(null);
        });

        final expectedState = [UserSuccess(currentUser: testUser)];

        await expectLater(
          userBloc,
          emitsInAnyOrder(expectedState),
        );
        verify(mockUserRepository.updateUserFcmToken(testUser.email, newToken));
      });
    });

    group("when add UpdateVersion", () {
      test("should update the user version", () async {
        final setupState = [
          UserLoading(),
          UserSuccess(currentUser: testUser),
        ];

        userBloc = UserBloc(
          authBloc: mockAuthBloc,
          userRepository: mockUserRepository,
          storageRepository: mockstorageRepository,
          imageRepository: mockImageRepository,
        );
        userStreamCtrl.add(testUser);

        await expectLater(
          userBloc,
          emitsInOrder(setupState),
        );

        userBloc.add(UserEvent.updateVersion(
            userEmail: testUser.email));
        // set current version to 1.0.0
        TestWidgetsFlutterBinding.ensureInitialized();
        const MethodChannel('plugins.flutter.io/package_info').setMockMethodCallHandler((MethodCall methodCall) async {
          if (methodCall.method == 'getAll') {
            return <String, dynamic>{
              'version': '1.0.0',
              'buildNumber': '12',
            };
          }
          return null;
        });

        when(mockUserRepository.updateUserVersion(testUser.email, "1.0.0+12"))
            .thenAnswer((_) {
          userStreamCtrl.add(testUser);
          return Future.value(null);
        });

        final expectedState = [UserSuccess(currentUser: testUser)];

        await expectLater(
          userBloc,
          emitsInAnyOrder(expectedState),
        );
        verify(mockUserRepository.updateUserVersion(testUser.email, "1.0.0+12"));
      });
    });
  });
}

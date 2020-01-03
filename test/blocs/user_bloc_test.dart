import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}
class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  group("UserBloc", () {
    UserRepository mockUserRepository;
    User testUser;
    UserBloc userBloc;
    AuthBloc mockAuthBloc;
    StreamController<User> userStreamCtrl;

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockAuthBloc = MockAuthBloc();
      userStreamCtrl = StreamController<User>();
      testUser = User(name: "Tobuto Nellano", email: "tobuto@nelano.com", imageUrl: "http://image.url");
      whenListen(mockAuthBloc, Stream.fromIterable([AuthAuthenticated(loggedUserEmail: testUser.email)]));
      when(mockUserRepository.getUserByEmail(testUser.email))
          .thenAnswer((_) {
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
          userBloc = UserBloc(authBloc: mockAuthBloc, userRepository: mockUserRepository);

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

          userBloc = UserBloc(authBloc: mockAuthBloc, userRepository: mockUserRepository);


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

        userBloc = UserBloc(authBloc: mockAuthBloc, userRepository: mockUserRepository);
        userStreamCtrl.add(testUser);

        await expectLater(
          userBloc,
          emitsInOrder(setupState),
        );
        userBloc.add(UpdateGrade(newGrade: "Black"));

        when(mockUserRepository.updateUserGrade(testUser,  "Black")).thenAnswer((_) {
          userStreamCtrl.add(testUser);
          return Future.value(null);
        });

        final expectedState = [
          UserSuccess(currentUser: testUser),
          UserLoading(),
          UserSuccess(currentUser: testUser)
        ];

        await expectLater(
            userBloc,
            emitsInOrder(expectedState),
        );
        verify(mockUserRepository.updateUserGrade(testUser, "Black"));
      });
    });

    group("when add UpdateName", () {
      test("should update the user name", () async {
        final setupState = [
          UserLoading(),
          UserSuccess(currentUser: testUser),
        ];

        userBloc = UserBloc(authBloc: mockAuthBloc, userRepository: mockUserRepository);
        userStreamCtrl.add(testUser);

        await expectLater(
          userBloc,
          emitsInOrder(setupState),
        );
        userBloc.add(UpdateName(newName: "Porco"));

        when(mockUserRepository.updateUserName(testUser,  "Porco")).thenAnswer((_) {
          userStreamCtrl.add(testUser);
          return Future.value(null);
        });

        final expectedState = [
          UserSuccess(currentUser: testUser),
          UserLoading(),
          UserSuccess(currentUser: testUser)
        ];

        await expectLater(
          userBloc,
          emitsInOrder(expectedState),
        );
        verify(mockUserRepository.updateUserName(testUser, "Porco"));
      });
    });

    //TODO: this should me removed from here
//    group("when add UpdateFcmToken", () {
//      test("should update the user token", () async {
//        final setupState = [
//          UserLoading(),
//          UserSuccess(currentUser: testUser),
//        ];
//
//        userBloc = UserBloc(authBloc: mockAuthBloc, userRepository: mockUserRepository);
//        userStreamCtrl.add(testUser);
//
//        await expectLater(
//          userBloc,
//          emitsInOrder(setupState),
//        );
//        userBloc.add(UpdateFcmToken(currentUser: testUser, newToken: "tha token"));
//
//        when(mockUserRepository.updateUserFcmToken(testUser,  "tha token")).thenAnswer((_) {
//          userStreamCtrl.add(testUser);
//          return Future.value(null);
//        });
//
//        final expectedState = [
//          UserSuccess(currentUser: testUser),
//          UserLoading(),
//          UserSuccess(currentUser: testUser)
//        ];
//
//        await expectLater(
//          userBloc,
//          emitsInOrder(expectedState),
//        );
//        verify(mockUserRepository.updateUserFcmToken(testUser, "tha token"));
//      });
//    });

  });
}

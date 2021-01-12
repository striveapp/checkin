import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';

import 'helper/mock_helper.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("ProfileBloc", () {
    MockUserBloc mockUserBloc;
    MockUserRepository mockUserRepository;

    User loggedUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
    );

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockUserBloc = MockUserBloc();
      whenListen(mockUserBloc,
          Stream.fromIterable([UserSuccess(currentUser: loggedUser)]));
      configureThrowOnMissingStub([mockUserRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockUserRepository]);
    });

    // todo missing initial state test

    group("when load profile of current user", () {
      blocTest(
        "should emit ProfileLoaded with the current user and isCurrent user as true",
        build: () => ProfileBloc(
            userBloc: mockUserBloc, userRepository: mockUserRepository),
        expect: [ProfileLoaded(profileUser: loggedUser, isCurrentUser: true)],
      );
    });

    group("when load profile on another user", () {
      User fakeOtherUser = User(
        name: "Test",
        email: "some@other",
        imageUrl: "someImage",
      );

      setUp(() {
        when(mockUserRepository.getUserByEmail(fakeOtherUser.email))
            .thenAnswer((_) {
          return Stream<User>.value(fakeOtherUser);
        });
      });

      tearDown(() {
        verify(mockUserRepository.getUserByEmail(fakeOtherUser.email));
      });

      blocTest(
        "should emit ProfileLoaded with another user and isCurrent user as false",
        build: () => ProfileBloc(
          userBloc: mockUserBloc,
          userRepository: mockUserRepository,
          nonCurrentUserEmail: fakeOtherUser.email,
        ),
        expect: [
          ProfileLoaded(profileUser: fakeOtherUser, isCurrentUser: false)
        ],
      );
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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
    User fakeOtherUser = User(
      name: "Test",
      email: "some@other",
      imageUrl: "someImage",
    );

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockUserBloc = MockUserBloc();
      configureThrowOnMissingStub([mockUserRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockUserRepository]);
    });

    group("initial state", () {
      blocTest("is InitialProfileState",
          build: () => ProfileBloc(
                userRepository: mockUserRepository,
              ),
          expect: [],
          verify: (bloc) {
            expect(bloc.state, InitialProfileState());
          });
    });

    group("on InitialProfileState", () {
      setUp(() {
        whenListen(mockUserBloc, Stream.fromIterable([UserSuccess(currentUser: loggedUser)]));
      });
      group("when the user to load is the current one", () {
        blocTest(
          "should load the current user profile",
          build: () => ProfileBloc(
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(InitializeProfile()),
          expect: [ProfileLoaded(profileUser: loggedUser, isCurrentUser: true)],
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
            nonCurrentUserEmail: fakeOtherUser.email,
          ),
          act: (bloc) => bloc.add(InitializeProfile()),
          expect: [ProfileLoaded(profileUser: fakeOtherUser, isCurrentUser: false)],
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
            ),
            act: (bloc) => bloc.add(ProfileUpdated(user: loggedUser, isCurrentUser: true)),
            expect: [ProfileLoaded(profileUser: loggedUser, isCurrentUser: true)],
          );
        });
        group("when there is a nonCurrentUserEmail but the email is the same", () {
          blocTest(
            "should emit ProfileLoaded with the current user and isCurrent user as true",
            build: () => ProfileBloc(
              userRepository: mockUserRepository,
              nonCurrentUserEmail: loggedUser.email,
            ),
            act: (bloc) => bloc.add(ProfileUpdated(user: loggedUser, isCurrentUser: true)),
            expect: [ProfileLoaded(profileUser: loggedUser, isCurrentUser: true)],
          );
        });
      });

      group("when load profile on another user", () {
        blocTest(
          "should emit ProfileLoaded with another user and isCurrent user as false",
          build: () => ProfileBloc(
            userRepository: mockUserRepository,
            nonCurrentUserEmail: fakeOtherUser.email,
          ),
          act: (bloc) => bloc.add(ProfileUpdated(user: fakeOtherUser, isCurrentUser: false)),
          expect: [ProfileLoaded(profileUser: fakeOtherUser, isCurrentUser: false)],
        );
      });
    });
  });
}

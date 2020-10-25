import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("ProfileBloc", () {
    ProfileBloc profileBloc;
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

      whenListen(mockUserBloc, Stream.fromIterable([UserSuccess(currentUser: loggedUser)]));
    });

    group("when load profile of current user", () {
      test("should emit ProfileLoaded with the current user and isCurrent user as true", () {
        profileBloc = ProfileBloc(
          userBloc: mockUserBloc,
          userRepository: mockUserRepository
        );

        final expectedState = [
          InitialProfileState(),
          ProfileLoaded(
              profileUser: loggedUser, isCurrentUser: true),
        ];

        expectLater(
          profileBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("when load profile on another user", () {
      test("should emit ProfileLoaded with another user and isCurrent user as false", () {
        User fakeOtherUser = User(
          name: "Test",
          email: "some@other",
          imageUrl: "someImage",
        );

        when(mockUserRepository.getUserByEmail(fakeOtherUser.email)).thenAnswer((_) {
          return Stream<User>.value(fakeOtherUser);
        });

        profileBloc = ProfileBloc(
          userBloc: mockUserBloc,
          userRepository: mockUserRepository,
          nonCurrentUserEmail: fakeOtherUser.email,
        );

        final expectedState = [
          InitialProfileState(),
          ProfileLoaded(
              profileUser: fakeOtherUser, isCurrentUser: false),
        ];

        expectLater(
          profileBloc,
          emitsInOrder(expectedState),
        );
      });
    });

  });
}

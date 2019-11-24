import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
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
      test("should emit ProfileSuccess with the current user and isCurrent user as true", () {
        profileBloc = ProfileBloc(
          userBloc: mockUserBloc,
          userRepository: mockUserRepository,
          profileEmail: loggedUser.email,
        );

        final expectedState = [
          ProfileLoading(),
          ProfileSuccess(
              profileUser: loggedUser, isCurrentUser: true),
        ];

        expectLater(
          profileBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("when load profile on another user", () {
      test("should emit ProfileSuccess with another user and isCurrent user as false", () {
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
          profileEmail: fakeOtherUser.email,
        );

        final expectedState = [
          ProfileLoading(),
          ProfileSuccess(
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

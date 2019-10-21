import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("ProfileBloc", () {
    ProfileBloc profileBloc;
    MockUserRepository mockUserRepository;
    String testEmail = "test@test.com";
    setUp(() {
      mockUserRepository = MockUserRepository();
      when(mockUserRepository.getUserByEmail(testEmail)).thenAnswer((_) {
        return Stream<User>.empty();
      });
      profileBloc = ProfileBloc(
          userRepository: mockUserRepository, profileEmail: testEmail);
    });

    test("initial state is ProfileUninitialized", () {
      expect(profileBloc.initialState, ProfileLoading());
    });

    group("when ProfileUpdated is dispatched", () {
      test(
          "the final status should be ProfileSuccess when the the user is present", () {
        User fakeUser = User(
          name: "Jack Sparrow", email: testEmail, imageUrl: "some image");

        final expectedState = [
          ProfileLoading(),
          ProfileSuccess(profileUser: fakeUser),
        ];

        profileBloc.dispatch(ProfileUpdated(user: fakeUser));

        expectLater(
          profileBloc.state,
          emitsInOrder(expectedState),
        );
      });
      test("the finakl status should be ProfileLoading when the user is not present", () {

        final expectedState = [
          ProfileLoading()
        ];

        profileBloc.dispatch(ProfileUpdated(user: null));

        expectLater(
          profileBloc.state,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}

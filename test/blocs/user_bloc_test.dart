import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}
class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  group("UserBloc", () {
    UserBloc userBloc;
    UserRepository mockUserRepository;
    User testUser;
    AuthBloc mockAuthBloc;

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockAuthBloc = MockAuthBloc();
      testUser = User(name: "Tobuto Nellano", email: "tobuto@nelano.com");
      userBloc = UserBloc(authBloc: mockAuthBloc, userRepository: mockUserRepository);
    });

    test('initial state is UserUninitialized', () {
      expect(userBloc.initialState, UserLoading());
    });

    group("dispatch Create", () {
      setUp(() {
        userBloc.dispatch(Create(user: testUser));
      });

      group("when UserSuccess", () {
        test("should create a user", () async {
          final expectedState = [
            UserLoading(),
            UserSuccess(currentUser: testUser),
          ];

          when(mockUserRepository.createUser(testUser.name, testUser.email,
                  testUser.rank, testUser.isOwner))
              .thenAnswer((_) => Future<User>.value(testUser));

          await expectLater(
            userBloc.state,
            emitsInOrder(expectedState),
          );
        });
      });

      group("when UserError", () {
        test("should not create a user", () async {
          final expectedState = [
            UserLoading(),
            UserError(),
          ];

          when(mockUserRepository.createUser(testUser.name, testUser.email,
                  testUser.rank, testUser.isOwner))
              .thenThrow(Exception("i don't wanna live in this world anymore"));

          await expectLater(
            userBloc.state,
            emitsInOrder(expectedState),
          );
        });
      });
    });
  });
}

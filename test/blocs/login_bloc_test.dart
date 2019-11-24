import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/auth_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group("LoginBloc", () {
    LoginBloc loginBloc;
    UserRepository mockUserRepository;
    AuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockUserRepository = MockUserRepository();

      loginBloc = LoginBloc(
        authRepository: mockAuthRepository,
        userRepository: mockUserRepository,
      );
    });

    tearDown(() {
      loginBloc?.close();
    });

    test('initial state is LoginUninitialized', () {
      expect(loginBloc.initialState, LoginInitial());
    });

    group("LoginWithGoogle", () {
      var fakeLoggedUser = User(
        name: "Batman",
        email: "not@work.com",
        imageUrl: "http://image.url",
      );

      setUp(() {
        loginBloc.add(LoginWithGoogle());
      });

      test("should emit LoginSuccess when a loggedUser is returned", () async {
        when(mockAuthRepository.signInWithGoogle())
            .thenAnswer((_) => Future<User>.value(fakeLoggedUser));

        final expectedState = [
          LoginInitial(),
          LoginSuccess(loggedUser: fakeLoggedUser),
        ];

        await expectLater(
          loginBloc,
          emitsInOrder(expectedState),
        );
        verify(mockUserRepository.createUser(fakeLoggedUser));
      });

      test("should emit LoginFailure when no user is returned", () async {
        when(mockAuthRepository.signInWithGoogle())
            .thenAnswer((_) => Future<User>.value(null));

        final expectedState = [
          LoginInitial(),
          LoginFailure(),
        ];

        await expectLater(
            loginBloc,
            emitsInOrder(expectedState),
        );
        verifyNever(mockUserRepository.createUser(fakeLoggedUser));
      });

      test("should emit LoginFailure if an error is returned", () async {
        when(mockAuthRepository.signInWithGoogle()).thenThrow("Kaboom!");

        final expectedState = [
          LoginInitial(),
          LoginFailure(),
        ];

        await expectLater(
            loginBloc,
            emitsInOrder(expectedState),
        );
        verifyNever(mockUserRepository.createUser(fakeLoggedUser));
      });
    });
  });
}

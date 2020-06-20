import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}
class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  group("LoginBloc", () {
    LoginBloc loginBloc;
    UserRepository mockUserRepository;
    AuthRepository mockAuthRepository;
    AnalyticsRepository mockAnalyticsRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockUserRepository = MockUserRepository();
      mockAnalyticsRepository = MockAnalyticsRepository();

      loginBloc = LoginBloc(
        authRepository: mockAuthRepository,
        userRepository: mockUserRepository,
        analyticsRepository: mockAnalyticsRepository,
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
        uid: "1234",
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

        verify(mockAnalyticsRepository.setUserProperties(fakeLoggedUser.uid));
        verify(mockAnalyticsRepository.logLoginWithGoogleSignIn());
        verify(mockUserRepository.createUser(fakeLoggedUser));
      });

      test("should emit LoginFailure when no user is returned", () async {
        when(mockAuthRepository.signInWithGoogle())
            .thenAnswer((_) => Future<User>.value(null));

        final expectedState = [
          LoginInitial(),
          LoginFailure(errorMessage: 'Login failed'),
        ];

        await expectLater(
            loginBloc,
            emitsInOrder(expectedState),
        );

        verifyNever(mockAnalyticsRepository.setUserProperties(fakeLoggedUser.uid));
        verifyNever(mockAnalyticsRepository.logLoginWithGoogleSignIn());
        verifyNever(mockUserRepository.createUser(fakeLoggedUser));
      });

      test("should emit LoginFailure if an error is returned", () async {
        var error = "Kaboom!";
        when(mockAuthRepository.signInWithGoogle()).thenThrow(error);

        final expectedState = [
          LoginInitial(),
          LoginFailure(errorMessage: "Unexpected error! [$error]"),
        ];

        await expectLater(
            loginBloc,
            emitsInOrder(expectedState),
        );

        verifyNever(mockAnalyticsRepository.setUserProperties(fakeLoggedUser.uid));
        verifyNever(mockAnalyticsRepository.logLoginWithGoogleSignIn());
        verifyNever(mockUserRepository.createUser(fakeLoggedUser));
      });
    });
  });
}

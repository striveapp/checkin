import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/resources/auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockLocalStorageRepository extends Mock implements LocalStorageRepository {}

void main() {
  group("LoginBloc", () {
    MockUserRepository mockUserRepository;
    MockAuthRepository mockAuthRepository;
    MockAnalyticsRepository mockAnalyticsRepository;
    MockLocalStorageRepository mockLocalStorageRepository;

    var fakeUser = User(
      uid: "1234",
      name: "Batman",
      email: "not@work.com",
      imageUrl: "http://image.url",
    );

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockUserRepository = MockUserRepository();
      mockAnalyticsRepository = MockAnalyticsRepository();
      mockLocalStorageRepository = MockLocalStorageRepository();

      configureThrowOnMissingStub([
        mockAuthRepository,
        mockUserRepository,
        mockAnalyticsRepository,
        mockLocalStorageRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockAuthRepository,
        mockUserRepository,
        mockAnalyticsRepository,
        mockLocalStorageRepository
      ]);
    });

    group("initial state", () {
      LoginBloc loginBloc;

      setUp(() {
        loginBloc = LoginBloc(
          authRepository: mockAuthRepository,
          userRepository: mockUserRepository,
          analyticsRepository: mockAnalyticsRepository,
          localStorageRepository: mockLocalStorageRepository,
        );
      });

      test('is LoginInitial', () {
        expect(loginBloc.state, LoginInitial());
      });

      tearDown(() {
        loginBloc?.close();
      });
    });

    group("on LoginWithGoogle event", () {
      group("when a logged user is returned", () {
        setUp(() {
          when(mockAuthRepository.signInWithGoogle())
              .thenAnswer((_) => Future<User>.value(fakeUser));
          when(mockAnalyticsRepository.setUserProperties(fakeUser.uid))
              .thenAnswer((realInvocation) => null);
          when(mockAnalyticsRepository.logLoginWithGoogleSignIn())
              .thenAnswer((realInvocation) => null);

          when(mockUserRepository.createUser(fakeUser)).thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockAuthRepository.signInWithGoogle());
          verify(mockAnalyticsRepository.setUserProperties(fakeUser.uid));
          verify(mockAnalyticsRepository.logLoginWithGoogleSignIn());
          verify(mockUserRepository.createUser(fakeUser));
        });

        blocTest(
          "should emit LoginSuccess and create the user without a gym",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(LoginWithGoogle()),
          expect: [LoginSuccess(loggedUser: fakeUser)],
        );
      });

      group("when no user is returned", () {
        setUp(() {
          when(mockAuthRepository.signInWithGoogle()).thenAnswer((_) => Future<User>.value(null));
        });

        tearDown(() {
          verify(mockAuthRepository.signInWithGoogle());
        });

        blocTest(
          "should emit LoginFailure",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(LoginWithGoogle()),
          expect: [LoginFailure(errorMessage: 'Login failed')],
        );
      });

      group("when an error is returned", () {
        var error = "Kaboom!";

        setUp(() {
          when(mockAuthRepository.signInWithGoogle()).thenThrow(error);
          when(mockAnalyticsRepository.loginError(
            err: error,
            stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
          )).thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockAuthRepository.signInWithGoogle());
          verify(mockAnalyticsRepository.loginError(
            err: error,
            stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
          ));
        });

        blocTest("should emit LoginFailure and track the error",
            build: () => LoginBloc(
                  authRepository: mockAuthRepository,
                  userRepository: mockUserRepository,
                  analyticsRepository: mockAnalyticsRepository,
                  localStorageRepository: mockLocalStorageRepository,
                ),
            act: (bloc) => bloc.add(LoginWithGoogle()),
            expect: [LoginFailure(errorMessage: "Unexpected error! Please contact the gym owner")],
            verify: (bloc) {});
      });
    });

    group("on LoginWithApple event", () {
      group("when a loggedUser is returned", () {
        setUp(() {
          when(mockAuthRepository.signInWithApple())
              .thenAnswer((_) => Future<User>.value(fakeUser));
          when(mockAnalyticsRepository.setUserProperties(fakeUser.uid))
              .thenAnswer((realInvocation) => null);
          when(mockAnalyticsRepository.logLoginWithAppleSignIn())
              .thenAnswer((realInvocation) => null);

          when(mockUserRepository.createUser(fakeUser)).thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockAuthRepository.signInWithApple());
          verify(mockAnalyticsRepository.setUserProperties(fakeUser.uid));
          verify(mockAnalyticsRepository.logLoginWithAppleSignIn());
          verify(mockUserRepository.createUser(fakeUser));
        });

        blocTest(
          "should emit LoginSuccess and create the user without a gym",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(LoginWithApple()),
          expect: [LoginSuccess(loggedUser: fakeUser)],
        );
      });

      group("when no user is returned", () {
        setUp(() {
          when(mockAuthRepository.signInWithApple()).thenAnswer((_) => Future<User>.value(null));
        });

        tearDown(() {
          verify(mockAuthRepository.signInWithApple());
        });

        blocTest(
          "should emit LoginFailure",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(LoginWithApple()),
          expect: [LoginFailure(errorMessage: 'Login failed')],
        );
      });

      group("when an error is returned", () {
        var error = "Kaboom!";
        setUp(() {
          when(mockAuthRepository.signInWithApple()).thenThrow(error);
          when(mockAnalyticsRepository.loginError(
            err: error,
            stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
          )).thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockAuthRepository.signInWithApple());
          verify(mockAnalyticsRepository.loginError(
            err: error,
            stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
          ));
        });

        blocTest(
          "should emit LoginFailure and track the error",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(LoginWithApple()),
          expect: [LoginFailure(errorMessage: "Unexpected error! Please contact the gym owner")],
        );
      });

      group("when apple sign in is not supported", () {
        var error = AppleSignInNotSupportedException();

        setUp(() {
          when(mockAuthRepository.signInWithApple()).thenThrow(error);
          when(mockAnalyticsRepository.loginError(
            err: error,
          )).thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockAuthRepository.signInWithApple());
          verify(mockAnalyticsRepository.loginError(
            err: error,
          ));
        });

        blocTest(
          "should emit LoginFailure",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(LoginWithApple()),
          expect: [
            LoginFailure(
                errorMessage: "Sign in with Apple is not supported for your version of IOS")
          ],
        );
      });
    });

    group("on LoginPasswordless event", () {
      group("when the inserted email is correct", () {
        setUp((){
          when(mockLocalStorageRepository.setUserEmail(fakeUser.email)).thenAnswer((realInvocation) => Future.value());
          when(mockAuthRepository.signInPasswordless(fakeUser.email)).thenAnswer((realInvocation) => Future.value());
        });

        tearDown((){
          verify(mockLocalStorageRepository.setUserEmail(fakeUser.email));
          verify(mockAuthRepository.signInPasswordless(fakeUser.email));
        });

        blocTest(
          "should emit no new state",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(LoginPasswordless(userEmail: fakeUser.email)),
          expect: [],
        );
      });
      group("when the inserted email is NOT correct", () {
        final wrongEmail = "not.really@email";

        setUp((){
          when(mockLocalStorageRepository.setUserEmail(wrongEmail)).thenAnswer((realInvocation) => Future.value());
          when(mockAuthRepository.signInPasswordless(wrongEmail)).thenThrow("Not really the correct email");
          when(mockAnalyticsRepository.passwordlessError(
            err: "Not really the correct email",
            stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
          )).thenAnswer((_) => Future.value());
        });

        tearDown((){
          verify(mockLocalStorageRepository.setUserEmail(wrongEmail));
          verify(mockAuthRepository.signInPasswordless(wrongEmail));
          verify(mockAnalyticsRepository.passwordlessError(
            err: "Not really the correct email",
            stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
          ));
        });

        blocTest(
          "should emit WrongfullyInsertedEmail",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(LoginPasswordless(userEmail: wrongEmail)),
          expect: [
            LoginInitial(),
            WrongfullyInsertedEmail(),
          ],
        );
      });
    });
  });
}

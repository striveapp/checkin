import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/resources/auth_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'helper/mock_helper.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  group("LoginBloc", () {
    MockUserRepository mockUserRepository;
    MockAuthRepository mockAuthRepository;
    MockAnalyticsRepository mockAnalyticsRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockUserRepository = MockUserRepository();
      mockAnalyticsRepository = MockAnalyticsRepository();
      configureThrowOnMissingStub([
        mockAuthRepository,
        mockUserRepository,
        mockAnalyticsRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockAuthRepository,
        mockUserRepository,
        mockAnalyticsRepository,
      ]);
    });

    group("initial state", () {
      LoginBloc loginBloc;

      setUp(() {
        loginBloc = LoginBloc(
          authRepository: mockAuthRepository,
          userRepository: mockUserRepository,
          analyticsRepository: mockAnalyticsRepository,
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
      var fakeLoggedUser = User(
        uid: "1234",
        name: "Batman",
        email: "not@work.com",
        imageUrl: "http://image.url",
      );

      group("when a logged user is returned", () {
        setUp(() {
          when(mockAuthRepository.signInWithGoogle())
              .thenAnswer((_) => Future<User>.value(fakeLoggedUser));
          when(mockAnalyticsRepository.setUserProperties(fakeLoggedUser.uid))
              .thenAnswer((realInvocation) => null);
          when(mockAnalyticsRepository.logLoginWithGoogleSignIn())
              .thenAnswer((realInvocation) => null);
          when(mockUserRepository.createUser(fakeLoggedUser)).thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockAuthRepository.signInWithGoogle());
          verify(mockAnalyticsRepository.setUserProperties(fakeLoggedUser.uid));
          verify(mockAnalyticsRepository.logLoginWithGoogleSignIn());
          verify(mockUserRepository.createUser(fakeLoggedUser));
        });

        blocTest(
          "should emit LoginSuccess",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
          ),
          act: (bloc) => bloc.add(LoginWithGoogle()),
          expect: [LoginSuccess(loggedUser: fakeLoggedUser)],
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
                ),
            act: (bloc) => bloc.add(LoginWithGoogle()),
            expect: [LoginFailure(errorMessage: "Unexpected error! Please contact the gym owner")],
            verify: (bloc) {});
      });
    });

    group("on LoginWithApple event", () {
      var fakeLoggedUser = User(
        uid: "1234",
        name: "Robin",
        email: "almost@work.com",
        imageUrl: "http://image.url",
      );

      group("when a loggedUser is returned", () {
        setUp(() {
          when(mockAuthRepository.signInWithApple())
              .thenAnswer((_) => Future<User>.value(fakeLoggedUser));
          when(mockAnalyticsRepository.setUserProperties(fakeLoggedUser.uid))
              .thenAnswer((realInvocation) => null);
          when(mockAnalyticsRepository.logLoginWithAppleSignIn())
              .thenAnswer((realInvocation) => null);
          when(mockUserRepository.createUser(fakeLoggedUser)).thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockAuthRepository.signInWithApple());
          verify(mockAnalyticsRepository.setUserProperties(fakeLoggedUser.uid));
          verify(mockAnalyticsRepository.logLoginWithAppleSignIn());
          verify(mockUserRepository.createUser(fakeLoggedUser));
        });

        blocTest(
          "should emit LoginSuccess",
          build: () => LoginBloc(
            authRepository: mockAuthRepository,
            userRepository: mockUserRepository,
            analyticsRepository: mockAnalyticsRepository,
          ),
          act: (bloc) => bloc.add(LoginWithApple()),
          expect: [LoginSuccess(loggedUser: fakeLoggedUser)],
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

        tearDown((){
          verify(mockAuthRepository.signInWithApple());
          verify(mockAnalyticsRepository.loginError(
            err: error,
          ));
        });

        blocTest("should emit LoginFailure",
            build: () => LoginBloc(
                  authRepository: mockAuthRepository,
                  userRepository: mockUserRepository,
                  analyticsRepository: mockAnalyticsRepository,
                ),
            act: (bloc) => bloc.add(LoginWithApple()),
            expect: [
              LoginFailure(
                  errorMessage: "Sign in with Apple is not supported for your version of IOS")
            ],
        );
      });
    });
  });
}

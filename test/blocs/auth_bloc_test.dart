import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'helper/mock_helper.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockLocalStorageRepository extends Mock implements LocalStorageRepository {}

void main() {
  group('AuthBloc', () {
    MockAuthRepository mockAuthRepository;
    MockAnalyticsRepository mockAnalyticsRepository;
    MockUserRepository mockUserRepository;
    MockLocalStorageRepository mockLocalStorageRepository;

    User fakeUser = User(
      uid: "123",
      email: "test@test.com",
      name: "lol",
      imageUrl: "http://lol",
    );

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockAnalyticsRepository = MockAnalyticsRepository();
      mockUserRepository = MockUserRepository();
      mockLocalStorageRepository = MockLocalStorageRepository();

      configureThrowOnMissingStub([
        mockAuthRepository,
        mockAnalyticsRepository,
        mockUserRepository,
        mockLocalStorageRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockAuthRepository,
        mockAnalyticsRepository,
        mockUserRepository,
        mockLocalStorageRepository,
      ]);
    });

    group("initial state", () {
      AuthBloc authBloc;

      setUp(() {
        authBloc = AuthBloc(
          authRepository: mockAuthRepository,
          analyticsRepository: mockAnalyticsRepository,
          userRepository: mockUserRepository,
          localStorageRepository: mockLocalStorageRepository,
        );
      });

      test('is AuthUninitialized', () {
        expect(authBloc.state, AuthUninitialized());
      });

      tearDown(() {
        authBloc?.close();
      });
    });

    group("on AppStarted event", () {
      group("when user is logged in", () {
        setUp(() {
          when(mockAuthRepository.getAuthState()).thenAnswer((_) {
            return Stream<User>.value(fakeUser);
          });
          when(mockAnalyticsRepository.setUserProperties(fakeUser.uid))
              .thenAnswer((realInvocation) => null);
          when(mockAnalyticsRepository.logUserLocale()).thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockAuthRepository.getAuthState());
          verify(mockAnalyticsRepository.setUserProperties(fakeUser.uid));
          verify(mockAnalyticsRepository.logUserLocale());
        });

        group("and the local storage is empty", () {
          setUp(() {
            when(mockLocalStorageRepository.getReferredGymId()).thenAnswer((_) => Stream.empty());
            when(mockLocalStorageRepository.removeUserEmail())
                .thenAnswer((realInvocation) => Future.value());
          });

          tearDown(() {
            verify(mockLocalStorageRepository.getReferredGymId());
            verify(mockLocalStorageRepository.removeUserEmail());
          });

          blocTest(
            "should emit AuthAuthenticated with logged user",
            build: () => AuthBloc(
              authRepository: mockAuthRepository,
              analyticsRepository: mockAnalyticsRepository,
              userRepository: mockUserRepository,
              localStorageRepository: mockLocalStorageRepository,
            ),
            act: (bloc) => bloc.add(AppStarted()),
            expect: [
              AuthAuthenticated(loggedUser: fakeUser),
            ],
          );
        });

        group("and the local storage has a referredGym", () {
          var fakeReferredGym = "fakeGym";
          setUp(() {
            when(mockLocalStorageRepository.getReferredGymId())
                .thenAnswer((_) => Stream.value(fakeReferredGym));
            when(mockUserRepository.updateSelectedGymId(
              fakeUser.email,
              fakeReferredGym,
            )).thenAnswer((realInvocation) => Future.value());
            when(mockLocalStorageRepository.removeReferredGym()).thenAnswer((_) => Future.value());
            when(mockLocalStorageRepository.removeUserEmail())
                .thenAnswer((realInvocation) => Future.value());
          });

          tearDown(() {
            verify(mockLocalStorageRepository.getReferredGymId());
            verify(mockUserRepository.updateSelectedGymId(
              fakeUser.email,
              fakeReferredGym,
            ));
            verify(mockLocalStorageRepository.removeReferredGym());
            verify(mockLocalStorageRepository.removeUserEmail());
          });

          blocTest(
            "should emit AuthAuthenticated with logged user",
            build: () => AuthBloc(
              authRepository: mockAuthRepository,
              analyticsRepository: mockAnalyticsRepository,
              userRepository: mockUserRepository,
              localStorageRepository: mockLocalStorageRepository,
            ),
            act: (bloc) => bloc.add(AppStarted()),
            expect: [
              AuthAuthenticated(loggedUser: fakeUser),
            ],
          );
        });
      });

      group("when user is NOT logged in", () {
        setUp(() {
          when(mockAuthRepository.getAuthState()).thenAnswer((_) {
            return Stream<User>.value(null);
          });
        });

        tearDown(() {
          verify(mockAuthRepository.getAuthState());
        });

        blocTest(
          "should emit AuthUnauthenticated",
          build: () => AuthBloc(
            authRepository: mockAuthRepository,
            analyticsRepository: mockAnalyticsRepository,
            userRepository: mockUserRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(AppStarted()),
          expect: [
            AuthUnauthenticated(),
          ],
        );
      });

      group("when there is an error retrieving authentication state", () {
        setUp(() {
          when(mockAuthRepository.getAuthState()).thenThrow("Kaboom!");
        });

        tearDown(() {
          verify(mockAuthRepository.getAuthState());
        });

        blocTest(
          "should emit AuthUnauthenticated",
          build: () => AuthBloc(
            authRepository: mockAuthRepository,
            analyticsRepository: mockAnalyticsRepository,
            userRepository: mockUserRepository,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(AppStarted()),
          expect: [
            AuthUnauthenticated(),
          ],
        );
      });
    });

    group('on LogOut event', () {
      setUp(() {
        when(mockAuthRepository.signOut()).thenAnswer((realInvocation) => null);
      });

      tearDown(() {
        verify(mockAuthRepository.signOut());
      });

      blocTest(
        "should perform logout",
        build: () => AuthBloc(
          authRepository: mockAuthRepository,
          analyticsRepository: mockAnalyticsRepository,
          userRepository: mockUserRepository,
          localStorageRepository: mockLocalStorageRepository,
        ),
        act: (bloc) => bloc.add(LogOut()),
        verify: (bloc) async {
          await untilCalled(mockAuthRepository.signOut());
        },
      );
    });
  });
}

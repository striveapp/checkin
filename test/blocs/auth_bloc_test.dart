// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/util/version_util.dart';
import 'package:mockito/mockito.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

import 'helper/mock_helper.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockGymRepository extends Mock implements GymRepository {}

class MockLocalStorageRepository extends Mock implements LocalStorageRepository {}

class MockVersionUtil extends Mock implements VersionUtil {}

void main() {
  group('AuthBloc', () {
    MockAuthRepository mockAuthRepository;
    MockAnalyticsRepository mockAnalyticsRepository;
    MockUserRepository mockUserRepository;
    MockGymRepository mockGymRepository;
    MockLocalStorageRepository mockLocalStorageRepository;
    MockVersionUtil mockVersionUtil;

    User fakeUser = User(
      uid: "123",
      email: "test@test.com",
      name: "lol",
      imageUrl: "https://lol",
    );

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockAnalyticsRepository = MockAnalyticsRepository();
      mockUserRepository = MockUserRepository();
      mockLocalStorageRepository = MockLocalStorageRepository();
      mockVersionUtil = MockVersionUtil();
      mockGymRepository = MockGymRepository();

      configureThrowOnMissingStub([
        mockAuthRepository,
        mockAnalyticsRepository,
        mockUserRepository,
        mockGymRepository,
        mockLocalStorageRepository,
        mockVersionUtil,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockAuthRepository,
        mockAnalyticsRepository,
        mockUserRepository,
        mockGymRepository,
        mockLocalStorageRepository,
        mockVersionUtil,
      ]);
    });

    group("initial state", () {
      AuthBloc authBloc;

      group("when loggedUser is null", () {
        setUp(() {
          authBloc = AuthBloc(
              authRepository: mockAuthRepository,
              analyticsRepository: mockAnalyticsRepository,
              userRepository: mockUserRepository,
              gymRepository: mockGymRepository,
              localStorageRepository: mockLocalStorageRepository,
              versionUtil: mockVersionUtil,
              loggedUser: null);
        });

        tearDown(() {
          authBloc?.close();
        });

        test('is AuthUnauthenticated', () {
          expect(authBloc.state, AuthUnauthenticated());
        });
      });

      group("when loggedUser is NOT null", () {
        setUp(() {
          authBloc = AuthBloc(
            authRepository: mockAuthRepository,
            analyticsRepository: mockAnalyticsRepository,
            userRepository: mockUserRepository,
            gymRepository: mockGymRepository,
            localStorageRepository: mockLocalStorageRepository,
            versionUtil: mockVersionUtil,
            loggedUser: fakeUser,
          );
        });

        tearDown(() {
          authBloc?.close();
        });

        test('is AuthAuthenticated with logged user', () {
          expect(authBloc.state, AuthAuthenticated(loggedUser: fakeUser));
        });
      });

      tearDown(() {
        authBloc?.close();
      });
    });

    group("on AppStarted event", () {
      group("when user is logged in", () {
        var fakeAppVersion = Version.parse("1.0.0");

        setUp(() {
          when(mockUserRepository.subscribeToUser(fakeUser.email))
              .thenAnswer((realInvocation) => Stream.empty());
          when(mockAuthRepository.getAuthState()).thenAnswer((_) {
            return Stream<User>.value(fakeUser);
          });
          when(mockAnalyticsRepository.setUserProperties(fakeUser.uid))
              .thenAnswer((realInvocation) => null);
          when(mockAnalyticsRepository.logUserLocale()).thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockUserRepository.subscribeToUser(fakeUser.email));
          verify(mockAuthRepository.getAuthState());
          verify(mockAnalyticsRepository.setUserProperties(fakeUser.uid));
          verify(mockAnalyticsRepository.logUserLocale());
        });

        group("and the local storage referredGymId is empty", () {
          setUp(() {
            when(mockVersionUtil.getCurrentVersion())
                .thenAnswer((_) => Future.value(fakeAppVersion));
            when(mockUserRepository.updateUserAppVersion(
              fakeUser.email,
              fakeAppVersion,
            )).thenAnswer((realInvocation) => Future.value());
            when(mockLocalStorageRepository.getReferredGymId()).thenAnswer((_) => Stream.empty());
            when(mockLocalStorageRepository.removeUserEmail())
                .thenAnswer((realInvocation) => Future.value());
          });

          tearDown(() {
            verify(mockVersionUtil.getCurrentVersion());
            verify(mockUserRepository.updateUserAppVersion(
              fakeUser.email,
              Version.parse("1.0.0"),
            ));
            verify(mockLocalStorageRepository.getReferredGymId());
            verify(mockLocalStorageRepository.removeUserEmail());
          });

          blocTest(
            "should emit AuthAuthenticated with logged user",
            build: () => AuthBloc(
              authRepository: mockAuthRepository,
              analyticsRepository: mockAnalyticsRepository,
              userRepository: mockUserRepository,
              gymRepository: mockGymRepository,
              localStorageRepository: mockLocalStorageRepository,
              versionUtil: mockVersionUtil,
            ),
            act: (bloc) => bloc.add(AppStarted()),
            expect: () => [
              AuthAuthenticated(loggedUser: fakeUser),
            ],
          );
        });

        group("and the local storage has a referredGym", () {
          var fakeReferredGym = "fakeGym";
          setUp(() {
            when(mockVersionUtil.getCurrentVersion())
                .thenAnswer((_) => Future.value(fakeAppVersion));
            when(mockUserRepository.updateUserAppVersion(
              fakeUser.email,
              fakeAppVersion,
            )).thenAnswer((realInvocation) => Future.value());
            when(mockLocalStorageRepository.getReferredGymId())
                .thenAnswer((_) => Stream.value(fakeReferredGym));
            when(mockUserRepository.updateSelectedGymId(
              fakeUser.email,
              fakeReferredGym,
            )).thenAnswer((realInvocation) => Future.value());
            when(mockUserRepository.updateKnownGymIds(
              fakeUser.email,
              fakeReferredGym,
            )).thenAnswer((realInvocation) => Future.value());
            when(mockLocalStorageRepository.removeReferredGym()).thenAnswer((_) => Future.value());
            when(mockLocalStorageRepository.removeUserEmail())
                .thenAnswer((realInvocation) => Future.value());
          });

          tearDown(() {
            verify(mockVersionUtil.getCurrentVersion());
            verify(mockUserRepository.updateUserAppVersion(
              fakeUser.email,
              Version.parse("1.0.0"),
            ));
            verify(mockLocalStorageRepository.getReferredGymId());
            verify(mockUserRepository.updateSelectedGymId(
              fakeUser.email,
              fakeReferredGym,
            ));
            verify(mockUserRepository.updateKnownGymIds(
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
                gymRepository: mockGymRepository,
                localStorageRepository: mockLocalStorageRepository,
                versionUtil: mockVersionUtil),
            act: (bloc) => bloc.add(AppStarted()),
            expect: () => [
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
            gymRepository: mockGymRepository,
            localStorageRepository: mockLocalStorageRepository,
            versionUtil: mockVersionUtil,
          ),
          act: (bloc) => bloc.add(AppStarted()),
          expect: () => [
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
            gymRepository: mockGymRepository,
            localStorageRepository: mockLocalStorageRepository,
            versionUtil: mockVersionUtil,
          ),
          act: (bloc) => bloc.add(AppStarted()),
          expect: () => [
            AuthUnauthenticated(),
          ],
        );
      });
    });

    group('on LogOut event', () {
      setUp(() {
        when(mockAuthRepository.signOut()).thenAnswer((realInvocation) => null);
        when(mockLocalStorageRepository.removeGym()).thenAnswer((realInvocation) => null);
        when(mockLocalStorageRepository.removeUser()).thenAnswer((realInvocation) => null);
      });

      tearDown(() {
        verify(mockAuthRepository.signOut());
        verify(mockLocalStorageRepository.removeGym());
        verify(mockLocalStorageRepository.removeUser());
      });

      blocTest(
        "should perform logout",
        build: () => AuthBloc(
            authRepository: mockAuthRepository,
            analyticsRepository: mockAnalyticsRepository,
            userRepository: mockUserRepository,
            gymRepository: mockGymRepository,
            localStorageRepository: mockLocalStorageRepository,
            versionUtil: mockVersionUtil),
        act: (bloc) => bloc.add(LogOut()),
        verify: (bloc) async {
          await untilCalled(mockAuthRepository.signOut());
        },
      );
    });
  });
}

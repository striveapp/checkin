import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/dynamic_link_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/resources/auth_provider.dart';
import 'package:checkin/src/resources/local_storage_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockFirebaseDynamicLinks extends Mock implements FirebaseDynamicLinks {}

class MockPendingDynamicLinkData extends Mock implements PendingDynamicLinkData {}

class MockOnLinkErrorException extends Mock implements OnLinkErrorException {}

class FakeOnLinkErrorException extends Fake implements OnLinkErrorException {
  @override
  String toString() {
    return 'FakeOnLinkErrorException';
  }
}

class MyDynamicLinkToNavigate extends DynamicLinkToNavigate {
  MyDynamicLinkToNavigate({String path}) : super(path: path);

  @override
  bool operator ==(Object other) {
    if (other is DynamicLinkToNavigate) {
      return path == other.path;
    }
    return false;
  }
}

class MockLocalStorageRepository extends Mock implements LocalStorageProvider {}

class MockDynamicLinkRepository extends Mock implements DynamicLinkRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("DynamicLinkBloc", () {
    MockFirebaseDynamicLinks mockFirebaseDynamicLinks;
    MockPendingDynamicLinkData fakeData;
    MockLocalStorageRepository mockLocalStorageRepository;
    MockDynamicLinkRepository mockDynamicLinkRepository;
    MockAuthRepository mockAuthRepository;
    MockAnalyticsRepository mockAnalyticsRepository;
    MockUserRepository mockUserRepository;

    String fakeLessonId = "123456";

    setUp(() {
      mockFirebaseDynamicLinks = MockFirebaseDynamicLinks();
      mockLocalStorageRepository = MockLocalStorageRepository();
      mockDynamicLinkRepository = MockDynamicLinkRepository();
      mockAuthRepository = MockAuthRepository();
      mockAnalyticsRepository = MockAnalyticsRepository();
      mockUserRepository = MockUserRepository();

      fakeData = MockPendingDynamicLinkData();
      configureThrowOnMissingStub([
        mockFirebaseDynamicLinks,
        fakeData,
        mockLocalStorageRepository,
        mockDynamicLinkRepository,
        mockAuthRepository,
        mockAnalyticsRepository,
        mockUserRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockFirebaseDynamicLinks,
        fakeData,
        mockLocalStorageRepository,
        mockDynamicLinkRepository,
        mockAuthRepository,
        mockAnalyticsRepository,
        mockUserRepository
      ]);
    });

    group("initial state", () {
      DynamicLinkBloc dynamicLinkBloc;

      setUp(() {
        dynamicLinkBloc = DynamicLinkBloc(
          dynamicLinks: mockFirebaseDynamicLinks,
          localStorageRepository: mockLocalStorageRepository,
          dynamicLinkRepository: mockDynamicLinkRepository,
          authRepository: mockAuthRepository,
          analyticsRepository: mockAnalyticsRepository,
          userRepository: mockUserRepository,
        );
      });

      test('is DynamicLinkInitial', () {
        expect(dynamicLinkBloc.state, DynamicLinkInitial());
      });

      tearDown(() {
        dynamicLinkBloc?.close();
      });
    });

    group("on DeepLinkSetup event", () {
      group("when there is an initialLink", () {
        setUp(() {
          when(mockFirebaseDynamicLinks.getInitialLink()).thenAnswer((_) {
            return Future<PendingDynamicLinkData>.value(fakeData);
          });
          when(fakeData.link).thenReturn(Uri.parse("https://fakelink.com/path/$fakeLessonId"));
        });

        blocTest(
          "should add DeepLinkReceived event with the correct uri, and emit MyDynamicLinkToNavigate on the correct path",
          build: () => DynamicLinkBloc(
            dynamicLinks: mockFirebaseDynamicLinks,
            localStorageRepository: mockLocalStorageRepository,
            dynamicLinkRepository: mockDynamicLinkRepository,
            authRepository: mockAuthRepository,
            analyticsRepository: mockAnalyticsRepository,
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(DeepLinkSetup()),
          expect: [
            MyDynamicLinkToNavigate(path: "/path/$fakeLessonId"),
          ],
          verify: (bloc) {
            verify(mockFirebaseDynamicLinks.onLink(
                onSuccess: anyNamed("onSuccess"), onError: anyNamed("onError")));
            verify(mockFirebaseDynamicLinks.getInitialLink());
            verify(fakeData.link);
          },
        );
      });
    });

    group("on DeepLinkReceived event", () {
      group("when the deeplink is a gym referred link", () {
        final fakeReferredDeepLink = Uri(path: "/register/fakeGym");

        setUp(() {
          TestWidgetsFlutterBinding.ensureInitialized();
          when(mockLocalStorageRepository.setReferredGymId(
            "fakeGym",
          )).thenAnswer((_) => Future.value(null));
        });

        tearDown(() {
          verify(mockLocalStorageRepository.setReferredGymId(
            "fakeGym",
          ));
        });

        blocTest(
          "should save the referredGym in the local storage",
          build: () => DynamicLinkBloc(
            dynamicLinks: mockFirebaseDynamicLinks,
            localStorageRepository: mockLocalStorageRepository,
            dynamicLinkRepository: mockDynamicLinkRepository,
            authRepository: mockAuthRepository,
            analyticsRepository: mockAnalyticsRepository,
            userRepository: mockUserRepository,
          ),
          act: (DynamicLinkBloc bloc) => bloc.add(DeepLinkReceived(deepLink: fakeReferredDeepLink)),
          expect: [],
        );
      });

      group("when the deeplink is an authentication link", () {
        final fakeAuthenticationLink = Uri(path: "/__/auth/super_safe_links_are_very_safe");

        group("and the user email is found in local storage", () {
          final String fakeUserEmail = "tobuto@nell.ano";

          setUp(() {
            when(mockLocalStorageRepository.getUserEmail())
                .thenAnswer((realInvocation) => Future.value(fakeUserEmail));
          });

          tearDown(() {
            verify(mockLocalStorageRepository.getUserEmail());
          });

          group("and passwordless signin completes successfully", () {
            final User fakeUser = User(
              uid: "fakeUid",
              name: "null",
              email: fakeUserEmail,
              imageUrl: "fakeImage",
            );

            setUp(() {
              when(mockAuthRepository.completeSignInPasswordless(
                      fakeUserEmail, fakeAuthenticationLink))
                  .thenAnswer((realInvocation) => Future.value(fakeUser));
              when(mockAnalyticsRepository.setUserProperties(fakeUser.uid))
                  .thenAnswer((realInvocation) => null);
              when(mockAnalyticsRepository.logLoginWithPasswordlessSignIn())
                  .thenAnswer((realInvocation) => null);
              when(mockUserRepository.createUser(fakeUser)).thenAnswer((realInvocation) => null);
            });

            tearDown(() {
              verify(mockAuthRepository.completeSignInPasswordless(
                  fakeUserEmail, fakeAuthenticationLink));
              verify(mockAnalyticsRepository.setUserProperties(fakeUser.uid));
              verify(mockAnalyticsRepository.logLoginWithPasswordlessSignIn());
              verify(mockUserRepository.createUser(fakeUser));
            });

            blocTest(
              "should complete passwordless signin",
              build: () => DynamicLinkBloc(
                dynamicLinks: mockFirebaseDynamicLinks,
                localStorageRepository: mockLocalStorageRepository,
                dynamicLinkRepository: mockDynamicLinkRepository,
                authRepository: mockAuthRepository,
                analyticsRepository: mockAnalyticsRepository,
                userRepository: mockUserRepository,
              ),
              act: (DynamicLinkBloc bloc) =>
                  bloc.add(DeepLinkReceived(deepLink: fakeAuthenticationLink)),
              expect: [DynamicLinkAuthenticated()],
            );
          });

          group("and passwordless signin throws a UserAlreadyLoggedInException", () {
            setUp(() {
              when(mockAuthRepository.completeSignInPasswordless(
                      fakeUserEmail, fakeAuthenticationLink))
                  .thenThrow(UserAlreadyLoggedInException("test message"));
              when(mockAnalyticsRepository.logAuthLinkOpenWithUserAlreadyLoggedIn(fakeUserEmail))
                  .thenAnswer((realInvocation) => Future.value());
            });

            tearDown(() {
              untilCalled(
                  mockAnalyticsRepository.logAuthLinkOpenWithUserAlreadyLoggedIn(fakeUserEmail));
              verify(mockAnalyticsRepository.logAuthLinkOpenWithUserAlreadyLoggedIn(fakeUserEmail));
              verify(mockAuthRepository.completeSignInPasswordless(
                  fakeUserEmail, fakeAuthenticationLink));
            });

            blocTest(
              "should log that on analytics",
              build: () => DynamicLinkBloc(
                dynamicLinks: mockFirebaseDynamicLinks,
                localStorageRepository: mockLocalStorageRepository,
                dynamicLinkRepository: mockDynamicLinkRepository,
                authRepository: mockAuthRepository,
                analyticsRepository: mockAnalyticsRepository,
                userRepository: mockUserRepository,
              ),
              act: (DynamicLinkBloc bloc) =>
                  bloc.add(DeepLinkReceived(deepLink: fakeAuthenticationLink)),
              expect: [],
            );
          });

          group("and passwordless signin throws a PlatformException with invalid-action-code", () {
            setUp(() {
              when(mockAuthRepository.completeSignInPasswordless(
                      fakeUserEmail, fakeAuthenticationLink))
                  .thenThrow(FirebaseAuthException(
                      code: 'invalid-action-code', message: 'test error message'));
              when(mockAnalyticsRepository.passwordlessError(
                err: DynamicLinkBloc.invalidActionError,
                stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
              )).thenAnswer((realInvocation) => null);
            });

            tearDown(() {
              verify(mockAnalyticsRepository.passwordlessError(
                err: DynamicLinkBloc.invalidActionError,
                stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
              ));
              verify(mockAuthRepository.completeSignInPasswordless(
                  fakeUserEmail, fakeAuthenticationLink));
            });

            blocTest(
              "should log error and emit DynamicBloc error with invalidActionError",
              build: () => DynamicLinkBloc(
                dynamicLinks: mockFirebaseDynamicLinks,
                localStorageRepository: mockLocalStorageRepository,
                dynamicLinkRepository: mockDynamicLinkRepository,
                authRepository: mockAuthRepository,
                analyticsRepository: mockAnalyticsRepository,
                userRepository: mockUserRepository,
              ),
              act: (DynamicLinkBloc bloc) =>
                  bloc.add(DeepLinkReceived(deepLink: fakeAuthenticationLink)),
              expect: [DynamicLinkError(errorMessage: DynamicLinkBloc.invalidActionError)],
            );
          });

          group("and passwordless signin throws an unexpected error", () {
            String unexpectedError = "unexpected error";

            setUp(() {
              when(mockAuthRepository.completeSignInPasswordless(
                      fakeUserEmail, fakeAuthenticationLink))
                  .thenThrow(unexpectedError);
              when(mockAnalyticsRepository.passwordlessError(
                err: unexpectedError,
                stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
              )).thenAnswer((realInvocation) => null);
            });

            tearDown(() {
              verify(mockAnalyticsRepository.passwordlessError(
                err: unexpectedError,
                stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
              ));
              verify(mockAuthRepository.completeSignInPasswordless(
                  fakeUserEmail, fakeAuthenticationLink));
            });

            blocTest(
              "should log error on analytics and emit DynamicLinkError with message",
              build: () => DynamicLinkBloc(
                dynamicLinks: mockFirebaseDynamicLinks,
                localStorageRepository: mockLocalStorageRepository,
                dynamicLinkRepository: mockDynamicLinkRepository,
                authRepository: mockAuthRepository,
                analyticsRepository: mockAnalyticsRepository,
                userRepository: mockUserRepository,
              ),
              act: (DynamicLinkBloc bloc) =>
                  bloc.add(DeepLinkReceived(deepLink: fakeAuthenticationLink)),
              expect: [DynamicLinkError(errorMessage: unexpectedError)],
            );
          });
        });

        group("and the user email is NOT found in local storage", () {
          String error = "Failed assertion: line 511 pos 12: 'email != null': is not true.";

          setUp(() {
            when(mockLocalStorageRepository.getUserEmail())
                .thenAnswer((realInvocation) => Future.value(null));
            when(mockAuthRepository.completeSignInPasswordless(null, fakeAuthenticationLink))
                .thenThrow(error);
            when(mockAnalyticsRepository.passwordlessError(
              err: DynamicLinkBloc.emailMissingError,
              stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
            )).thenAnswer((realInvocation) => null);
          });

          tearDown(() {
            verify(mockLocalStorageRepository.getUserEmail());
            verify(mockAuthRepository.completeSignInPasswordless(null, fakeAuthenticationLink));
            verify(mockAnalyticsRepository.passwordlessError(
              err: DynamicLinkBloc.emailMissingError,
              stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace'),
            ));
          });

          blocTest(
            "should log error on analytics and emit DynamicLinkError with emailMissingError",
            build: () => DynamicLinkBloc(
              dynamicLinks: mockFirebaseDynamicLinks,
              localStorageRepository: mockLocalStorageRepository,
              dynamicLinkRepository: mockDynamicLinkRepository,
              authRepository: mockAuthRepository,
              analyticsRepository: mockAnalyticsRepository,
              userRepository: mockUserRepository,
            ),
            act: (DynamicLinkBloc bloc) =>
                bloc.add(DeepLinkReceived(deepLink: fakeAuthenticationLink)),
            expect: [DynamicLinkError(errorMessage: DynamicLinkBloc.emailMissingError)],
          );
        });
      });
    });

    group("on ShareRegistryLink event", () {
      var fakeDate = '10-01-1993';
      var fakeLessonId = 'coolLessonBrah!';
      var fakeUri = 'http://short.uri/are-cool';

      setUp(() {
        when(mockDynamicLinkRepository.getRegistryLink(fakeDate, fakeLessonId))
            .thenAnswer((realInvocation) => Future.value(fakeUri));
      });

      tearDown(() {
        verify(mockDynamicLinkRepository.getRegistryLink(fakeDate, fakeLessonId));
      });

      blocTest(
        "should emit ShareLink with generated link",
        build: () => DynamicLinkBloc(
          dynamicLinks: mockFirebaseDynamicLinks,
          localStorageRepository: mockLocalStorageRepository,
          dynamicLinkRepository: mockDynamicLinkRepository,
          authRepository: mockAuthRepository,
          analyticsRepository: mockAnalyticsRepository,
          userRepository: mockUserRepository,
        ),
        act: (DynamicLinkBloc bloc) =>
            bloc.add(ShareRegistryLink(date: fakeDate, lessonId: fakeLessonId)),
        expect: [DynamicLinkToShare(link: fakeUri)],
      );
    });

    group("on FirebaseDynamicLinks callbacks (onLink)", () {
      group("onSuccess", () {
        setUp(() {
          when(fakeData.link).thenReturn(Uri.parse("https://fakelink.com/path/$fakeLessonId"));
        });

        blocTest(
            "should add DeepLinkReceived event with the correct uri, and emit MyDynamicLinkToNavigate on the correct path",
            build: () => DynamicLinkBloc(
                  dynamicLinks: mockFirebaseDynamicLinks,
                  localStorageRepository: mockLocalStorageRepository,
                  dynamicLinkRepository: mockDynamicLinkRepository,
                  authRepository: mockAuthRepository,
                  analyticsRepository: mockAnalyticsRepository,
                  userRepository: mockUserRepository,
                ),
            act: (bloc) => (bloc as DynamicLinkBloc).onSuccessLink(fakeData),
            expect: [
              MyDynamicLinkToNavigate(path: "/path/$fakeLessonId"),
            ],
            verify: (bloc) {
              verify(fakeData.link);
            });
      });

      group("onError", () {
        blocTest("shoud emit DynamicLinkError",
            build: () => DynamicLinkBloc(
                  dynamicLinks: mockFirebaseDynamicLinks,
                  localStorageRepository: mockLocalStorageRepository,
                  dynamicLinkRepository: mockDynamicLinkRepository,
                  authRepository: mockAuthRepository,
                  analyticsRepository: mockAnalyticsRepository,
                  userRepository: mockUserRepository,
                ),
            act: (bloc) => (bloc as DynamicLinkBloc).onErrorLink(FakeOnLinkErrorException()),
            expect: [
              DynamicLinkError(errorMessage: "FakeOnLinkErrorException"),
            ]);
      });
    });
  });
}

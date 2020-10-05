import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  group('AuthBloc', () {
    AuthBloc authBloc;
    MockAuthRepository mockAuthRepository;
    MockAnalyticsRepository mockAnalyticsRepository;

    User fakeUser = User(
      uid: "123",
      email: "test@test.com",
      name: "lol",
      imageUrl: "http://lol",
    );

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockAnalyticsRepository = MockAnalyticsRepository();

      authBloc = AuthBloc(
        authRepository: mockAuthRepository,
        analyticsRepository: mockAnalyticsRepository,
      );
    });

    tearDown(() {
      authBloc?.close();
    });

    test('initial state is AuthUninitialized', () {
      expect(authBloc.initialState, AuthUninitialized());
    });

    group("AppStarted", () {
      setUp(() {
        when(mockAuthRepository.getAuthState()).thenAnswer((_) {
          return Stream<User>.value(fakeUser);
        });

        authBloc.add(AppStarted());
      });

      test("should emit AuthAuthenticated with logged user", () async {
        final expectedResponse = [
          AuthUninitialized(),
          AuthAuthenticated(loggedUser: fakeUser),
        ];

        await expectLater(authBloc, emitsInOrder(expectedResponse));
        verify(mockAnalyticsRepository.setUserProperties(fakeUser.uid));
        verify(mockAnalyticsRepository.logUserLocale());
      });
      test("should emit AuthUnauthenticated if logged user is not present", () async {
        when(mockAuthRepository.getAuthState()).thenAnswer((_) {
          return Stream<User>.value(null);
        });

        final expectedResponse = [
          AuthUninitialized(),
          AuthUnauthenticated(),
        ];

        await expectLater(authBloc, emitsInOrder(expectedResponse));
      });
      test("should emit AuthUnauthenticated", () async {
        when(mockAuthRepository.getAuthState()).thenThrow("Kaboom!");
        final expectedResponse = [
          AuthUninitialized(),
          AuthUnauthenticated(),
        ];

        await expectLater(authBloc, emitsInOrder(expectedResponse));
      });
    });

    group('LogOut', () {
      setUp(() {
        authBloc.add(LogOut());
      });

      test("should emit AuthUnauthenticated and perform logout", () {
        final expectedState = [
          AuthUninitialized(),
        ];

        expectLater(
          authBloc,
          emitsInOrder(expectedState),
        ).then((_) {
          verify(mockAuthRepository.signOut());
        });
      });
    });
  });
}

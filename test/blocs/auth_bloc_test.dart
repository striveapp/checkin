import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/auth_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('AuthBloc', () {
    AuthBloc authBloc;
    MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      authBloc = AuthBloc(authRepository: mockAuthRepository);
    });

    tearDown(() {
      authBloc?.close();
    });

    test('initial state is AuthUninitialized', () {
      expect(authBloc.initialState, AuthUninitialized());
    });

    group("AppStarted", () {
      setUp(() {
        authBloc.add(AppStarted());
      });

      test("should emit AuthAuthenticated with logged user email", () {
        var fakeUserEmail = "fakeUserEmail";
        when(mockAuthRepository.getAuthState())
            .thenAnswer((_) {
              return Stream<String>.value(fakeUserEmail);
            });

        final expectedResponse = [
          AuthUninitialized(),
          AuthAuthenticated(loggedUserEmail: fakeUserEmail),
        ];
        expectLater(authBloc, emitsInOrder(expectedResponse));
      });
      test("should emit AuthUnauthenticated if logged user email is not present", () {
        when(mockAuthRepository.getAuthState())
            .thenAnswer((_) {
          return Stream<String>.value(null);
        });

        final expectedResponse = [
          AuthUninitialized(),
          AuthUnauthenticated(),
        ];
        expectLater(authBloc, emitsInOrder(expectedResponse));
      });
      test("should emit AuthUnauthenticated", () {
          when(mockAuthRepository.getAuthState()).thenThrow("Kaboom!");
          final expectedResponse = [
            AuthUninitialized(),
            AuthUnauthenticated(),
          ];

          expectLater(authBloc, emitsInOrder(expectedResponse));
        });
    });

    group('dispatch LoggedIn', () {
      var fakeUser = User(name: "test", email: "test@test.ts", imageUrl: "someImage");
      setUp(() {
        authBloc.add(LoggedIn(currentUser: fakeUser));
      });

      test("should emit AuthAuthenticated with current user email", () {
        final expectedResponse = [
          AuthUninitialized(),
          AuthAuthenticated(loggedUserEmail: fakeUser.email),
        ];
        expectLater(authBloc, emitsInOrder(expectedResponse));
      });
    });

    group('dispatch LoggedOut', () {
      setUp(() {
        authBloc.add(LogOut());
      });

      test("should emit AuthUnauthenticated and perform logout", () {
        final expectedState = [
          AuthUninitialized(),
          AuthUnauthenticated(),
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

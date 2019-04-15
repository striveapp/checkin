import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockFirebaseUser extends Mock implements FirebaseUser {}

void main() {
  group('AuthBloc', () {
    AuthBloc authBloc;
    MockFirebaseAuth firebaseAuth;

    setUp(() {
      firebaseAuth = MockFirebaseAuth();
      authBloc = AuthBloc(auth: firebaseAuth);
    });

    test('initial state is AuthUninitialized', () {
      expect(authBloc.initialState, AuthUninitialized());
    });

    group('dispatch AppStarted', () {
      setUp(() {
        authBloc.dispatch(AppStarted());
      });

      test('if there\'s no current users than final state is AuthUnauthenticated', () {
        final expectedState = [
          AuthUninitialized(),
          AuthUnauthenticated(),
        ];

        expectLater(
          authBloc.state,
          emitsInOrder(expectedState),
        );

      });

      test('if there\'s already a current users than final state is AuthAuthenticated', () {
        var fakeFirebaseUser = MockFirebaseUser();
        var fakeEmail = "porco@mail.com";

        final expectedState = [
          AuthUninitialized(),
          AuthAuthenticated(currentUserEmail: fakeEmail, isFirstLogin: false),
        ];

        when(firebaseAuth.currentUser()).thenAnswer((_) {
          return Future<MockFirebaseUser>.value(fakeFirebaseUser);
        });

        when(fakeFirebaseUser.email).thenReturn(fakeEmail);

        expectLater(
          authBloc.state,
          emitsInOrder(expectedState),
        );
      });
    });

    group('dispatch LoggedIn', () {
      var fakeEmail = "porco@mail.com";
      group("not is first login", () {
        setUp(() {
          authBloc.dispatch(LoggedIn(currentUserEmail: fakeEmail,
              isFirstLogin: false));
        });

        test("the final state should be AuthAuthenticated and pass the current user email", () {
          var fakeFirebaseUser = MockFirebaseUser();
          final expectedState = [
            AuthUninitialized(),
            AuthAuthenticated(currentUserEmail: fakeEmail, isFirstLogin: false),
          ];

          when(firebaseAuth.currentUser()).thenAnswer((_) {
            return Future<MockFirebaseUser>.value(fakeFirebaseUser);
          });

          expectLater(
            authBloc.state,
            emitsInOrder(expectedState),
          );
        });
      });

      group("is first login", () {
        setUp(() {
          authBloc.dispatch(LoggedIn(currentUserEmail: fakeEmail, isFirstLogin: true));
        });
        test("the final state should be AuthAuthenticated and pass the current user and isFirstLogin as true", () {
          var fakeFirebaseUser = MockFirebaseUser();
          final expectedState = [
            AuthUninitialized(),
            AuthAuthenticated(currentUserEmail: fakeEmail, isFirstLogin: true),
          ];

          when(firebaseAuth.currentUser()).thenAnswer((_) {
            return Future<MockFirebaseUser>.value(fakeFirebaseUser);
          });

          expectLater(
            authBloc.state,
            emitsInOrder(expectedState),
          );
        });
      });

    });

    group('dispatch LoggedOut', () {
      setUp(() {
        authBloc.dispatch(LogOut());
      });

      test("the final state should be AuthUnauthenticated and pass the current user", () {
        final expectedState = [
          AuthUninitialized(),
          AuthUnauthenticated(),
        ];

        expectLater(
          authBloc.state,
          emitsInOrder(expectedState),
        ).then((_) {
          verify(firebaseAuth.signOut());
        });
      });
    });
  });
}

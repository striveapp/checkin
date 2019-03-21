import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
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
        var fakeUser = MockFirebaseUser();
        final expectedState = [
          AuthUninitialized(),
          AuthAuthenticated(user: fakeUser),
        ];

        when(firebaseAuth.currentUser()).thenAnswer((_) {
          return Future<MockFirebaseUser>.value(fakeUser);
        });

        expectLater(
          authBloc.state,
          emitsInOrder(expectedState),
        );
      });


    });
    group('dispatch LoggedIn', () {
      setUp(() {
        authBloc.dispatch(LoggedIn());
      });

      test("the final state should be AuthAuthenticated and pass the current user", () {
        var fakeUser = MockFirebaseUser();
        final expectedState = [
          AuthUninitialized(),
          AuthAuthenticated(user: fakeUser),
        ];

        when(firebaseAuth.currentUser()).thenAnswer((_) {
          return Future<MockFirebaseUser>.value(fakeUser);
        });

        expectLater(
          authBloc.state,
          emitsInOrder(expectedState),
        );
      });
    });

    group('dispatch LoggedOut', () {
      setUp(() {
        authBloc.dispatch(LoggedOut());
      });

      //@TODO: not a good solution
      tearDown(() {
        verify(firebaseAuth.signOut()).called(1);
      });
      test("the final state should be AuthAuthenticated and pass the current user", () {
        final expectedState = [
          AuthUninitialized(),
          AuthUnauthenticated(),
        ];

        expectLater(
          authBloc.state,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}

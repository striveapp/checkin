import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
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
      when(firebaseAuth.onAuthStateChanged).thenAnswer((_) {
        return Stream<MockFirebaseUser>.empty();
      });
      authBloc = AuthBloc(auth: firebaseAuth);
    });

    test('my weekday test', () {
      var day = DateFormat('EEEE', 'en_US').format(DateTime.now());
      debugPrint('current day: ' + day);
    });


    test('initial state is AuthUninitialized', () {
      expect(authBloc.initialState, AuthUninitialized());
    });

    group("dispatch AuthUpdated", () {
      group("when is returned the correct user", () {
        var fakeEmail = "porco@mail.com";
        setUp(() {
          authBloc.dispatch(AuthUpdated(currentUserEmail: fakeEmail));
        });
        test("the final state should be AuthAuthenticated", () {
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

      group("when user null is returned", () {
        setUp(() {
          authBloc.dispatch(AuthUpdated(currentUserEmail: null));
        });
        test("the final state should be AuthAuthenticated", () {
          var fakeFirebaseUser = MockFirebaseUser();
          final expectedState = [
            AuthUninitialized(),
            AuthUnauthenticated(),
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

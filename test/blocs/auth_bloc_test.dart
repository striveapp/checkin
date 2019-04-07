import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:test/test.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockFirebaseUser extends Mock implements FirebaseUser {}
class MockUserRepository extends Mock implements UserRepository {}
class MockUser extends Mock implements User {}


void main() {
  group('AuthBloc', () {
    AuthBloc authBloc;
    MockFirebaseAuth firebaseAuth;
    MockUserRepository userRepository;

    setUp(() {
      firebaseAuth = MockFirebaseAuth();
      userRepository = MockUserRepository();
      authBloc = AuthBloc(auth: firebaseAuth, userRepository: userRepository);
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
        var fakeUser = MockUser();
        final expectedState = [
          AuthUninitialized(),
          AuthAuthenticated(user: fakeUser, isFirstLogin: false),
        ];

        when(firebaseAuth.currentUser()).thenAnswer((_) {
          return Future<MockFirebaseUser>.value(fakeFirebaseUser);
        });

        when(userRepository.getUserByEmail(any)).thenAnswer((_) {
          return Future<MockUser>.value(fakeUser);
        });

        expectLater(
          authBloc.state,
          emitsInOrder(expectedState),
        );
      });


    });
    group('dispatch LoggedIn', () {
      group("not is first login", () {
        setUp(() {
          authBloc.dispatch(LoggedIn(isFirstLogin: false));
        });

        test("the final state should be AuthAuthenticated and pass the current user", () {
          var fakeFirebaseUser = MockFirebaseUser();
          var fakeUser = MockUser();
          final expectedState = [
            AuthUninitialized(),
            AuthAuthenticated(user: fakeUser, isFirstLogin: false),
          ];

          when(firebaseAuth.currentUser()).thenAnswer((_) {
            return Future<MockFirebaseUser>.value(fakeFirebaseUser);
          });

          when(userRepository.getUserByEmail(any)).thenAnswer((_) {
            return Future<MockUser>.value(fakeUser);
          });

          expectLater(
            authBloc.state,
            emitsInOrder(expectedState),
          );
        });
      });

      group("is first login", () {
        setUp(() {
          authBloc.dispatch(LoggedIn(isFirstLogin: true));
        });
        test("the final state should be AuthAuthenticated and pass the current user and isFirstLogin as true", () {
          var fakeFirebaseUser = MockFirebaseUser();
          var fakeUser = MockUser();
          final expectedState = [
            AuthUninitialized(),
            AuthAuthenticated(user: fakeUser, isFirstLogin: true),
          ];

          when(firebaseAuth.currentUser()).thenAnswer((_) {
            return Future<MockFirebaseUser>.value(fakeFirebaseUser);
          });

          when(userRepository.getUserByEmail(any)).thenAnswer((_) {
            return Future<MockUser>.value(fakeUser);
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

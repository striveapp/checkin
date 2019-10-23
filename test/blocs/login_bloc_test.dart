import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockAuthResult extends Mock implements AuthResult {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockAuthBloc extends Mock implements AuthBloc {}

class MockUserBloc extends Mock implements UserBloc {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("LoginBloc", () {
    LoginBloc loginBloc;

    AuthBloc mockAuthBloc;
    UserBloc mockUserBloc;
    FirebaseAuth mockFirebaseAuth;
    GoogleSignIn mockGoogleSignIn;
    UserRepository mockUserRepository;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockAuthBloc = MockAuthBloc();
      mockGoogleSignIn = MockGoogleSignIn();
      mockUserRepository = MockUserRepository();
      mockUserBloc = MockUserBloc();
      loginBloc = LoginBloc(
          authBloc: mockAuthBloc,
          auth: mockFirebaseAuth,
          googleSignIn: mockGoogleSignIn,
          userRepository: mockUserRepository,
          userBloc: mockUserBloc);
    });
    test('initial state is LoginUninitialized', () {
      expect(loginBloc.initialState, LoginInitial());
    });

    group("dispatch LoginWithGoogle", () {
      final MockFirebaseUser fakeFirebaseUser = MockFirebaseUser();
      final MockAuthResult fakeAuthResult = MockAuthResult();
      var displayName = "Batman";
      var email = "not@work.com";
      var imageUrl = "http://image.url";
      var fakeUser = User(name: displayName, email: email, imageUrl: imageUrl);

      setUp(() {
        loginBloc.dispatch(LoginWithGoogle());
        var fakeGoogleAccount = MockGoogleSignInAccount();
        var fakeGoogleSignInAuthentication = MockGoogleSignInAuthentication();

        when(fakeGoogleSignInAuthentication.accessToken).thenReturn("");
        when(fakeGoogleSignInAuthentication.idToken).thenReturn("");
        when(fakeGoogleAccount.authentication).thenAnswer((_) {
          return Future<MockGoogleSignInAuthentication>.value(
              fakeGoogleSignInAuthentication);
        });
        when(mockGoogleSignIn.signIn()).thenAnswer((_) {
          return Future<MockGoogleSignInAccount>.value(fakeGoogleAccount);
        });
      });

      group("when isFirstLogin is true", () {
        test("should create new User and dispatch the LoggedIn action",
            () async {
          final expectedState = [LoginInitial(), LoginLoading()];

          when(fakeFirebaseUser.displayName).thenReturn(displayName);
          when(fakeFirebaseUser.email).thenReturn(email);
          when(fakeFirebaseUser.photoUrl).thenReturn(imageUrl);
          when(fakeAuthResult.user).thenReturn(fakeFirebaseUser);
          when(mockFirebaseAuth.signInWithCredential(any)).thenAnswer((_) {
            return Future<MockAuthResult>.value(fakeAuthResult);
          });
          when(mockUserRepository.isNewUser(email))
              .thenAnswer((_) => Future<bool>.value(true));

          await expectLater(
            loginBloc.state,
            emitsInOrder(expectedState),
          );

          verify(mockAuthBloc
              .dispatch(LoggedIn(currentUserEmail: email, isFirstLogin: true)));
          verify(mockUserBloc.dispatch(Create(user: fakeUser)));
        });
      });

      group("when isFirstLogin is false", () {
        test("should update user and dispatch the LoggedIn action", () async {
          final expectedState = [LoginInitial(), LoginLoading()];

          when(fakeFirebaseUser.displayName).thenReturn(displayName);
          when(fakeFirebaseUser.email).thenReturn(email);
          when(fakeFirebaseUser.photoUrl).thenReturn(imageUrl);
          when(fakeAuthResult.user).thenReturn(fakeFirebaseUser);

          when(mockFirebaseAuth.signInWithCredential(any)).thenAnswer((_) {
            return Future<MockAuthResult>.value(fakeAuthResult);
          });
          when(mockUserRepository.isNewUser(email))
              .thenAnswer((_) => Future<bool>.value(false));

          await expectLater(
            loginBloc.state,
            emitsInOrder(expectedState),
          );

          verify(mockUserBloc.dispatch(Create(user: fakeUser)));
          verify(mockAuthBloc.dispatch(
              LoggedIn(currentUserEmail: email, isFirstLogin: false)));
        });
      });

      test("when fail authBloc should not dispatch the LoggedIn action",
          () async {
        final expectedState = [
          LoginInitial(),
          LoginLoading(),
        ];

        when(mockFirebaseAuth.signInWithCredential(any))
            .thenThrow(Exception("that proves the rule"));

        await expectLater(
          loginBloc.state,
          emitsInOrder(expectedState),
        );

        verifyNever(mockAuthBloc.dispatch(LoggedIn()));
      });
    });
  });
}

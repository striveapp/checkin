import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockFirebaseUser extends Mock implements FirebaseUser {}
class MockGoogleSignIn extends Mock implements GoogleSignIn {}
class MockAuthBlock extends Mock implements AuthBloc {}
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}
class MockGoogleSignInAuthentication extends Mock implements GoogleSignInAuthentication {}

void main() {
    group("LoginBloc", () {
        LoginBloc loginBloc;

        AuthBloc mockAuthBloc;
        FirebaseAuth mockFirebaseAuth;
        GoogleSignIn mockGoogleSignIn;

        setUp(() {
            mockFirebaseAuth = MockFirebaseAuth();
            mockAuthBloc = MockAuthBlock();
            mockGoogleSignIn  = MockGoogleSignIn();
            loginBloc = LoginBloc(
                authenticationBloc: mockAuthBloc,
                auth: mockFirebaseAuth,
                googleSignIn: mockGoogleSignIn
            );
        });
        test('initial state is LoginUninitialized', () {
            expect(loginBloc.initialState, LoginInitial());
        });

        group("dispatch LoginWithGoogle", () {
            final MockFirebaseUser fakeUser = MockFirebaseUser();

            setUp(() {
                loginBloc.dispatch(LoginWithGoogle());
                var fakeGoogleAccount = MockGoogleSignInAccount();
                var fakeGoogleSignInAuthentication = MockGoogleSignInAuthentication();

                when(fakeGoogleSignInAuthentication.accessToken).thenReturn("");
                when(fakeGoogleSignInAuthentication.idToken).thenReturn("");
                when(fakeGoogleAccount.authentication)
                    .thenAnswer((_) {
                    return Future<MockGoogleSignInAuthentication>
                        .value(fakeGoogleSignInAuthentication);
                });
                when(mockGoogleSignIn.signIn()).thenAnswer((_) {
                    return Future<MockGoogleSignInAccount>.value(fakeGoogleAccount);
                });

            });

            test("when LoginSuccess authBloc should dispatch the LoggedIn action", () async {
                final expectedState = [
                    LoginInitial(),
                    LoginLoading(),
                    LoginSuccess(user: fakeUser),
                    LoginInitial()
                ];

                when(mockFirebaseAuth.signInWithCredential(any)).thenAnswer((_) {
                    return Future<MockFirebaseUser>.value(fakeUser);
                });

                await expectLater(
                    loginBloc.state,
                    emitsInOrder(expectedState),
                );

                verify(mockAuthBloc.dispatch(LoggedIn()));
            });

            test("when LoginFailure authBloc should not dispatch the LoggedIn action", () async {
                final expectedState = [
                    LoginInitial(),
                    LoginLoading(),
                    LoginFailure(),
                    LoginInitial()
                ];

                when(mockFirebaseAuth.signInWithCredential(any)).thenThrow(Exception("that proves the rule"));

                await expectLater(
                    loginBloc.state,
                    emitsInOrder(expectedState),
                );

                verifyNever(mockAuthBloc.dispatch(LoggedIn()));

            });
        });
    });
}

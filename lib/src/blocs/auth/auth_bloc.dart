import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth auth;
  final UserRepository userRepository;

  AuthBloc({
    @required this.auth,
    @required this.userRepository,
  });

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthState currentState, AuthEvent event) async* {
    var currentUser;
    debugPrint('Processing event [$event]');

    if (event is AppStarted || event is LoggedIn) {
      currentUser = await this.auth.currentUser();
      debugPrint('Current user is [$currentUser]');
      if (currentUser != null) {
        try {
          debugPrint('User is authenticated');
          var user = await this.userRepository.getUserByEmail(currentUser.email);
          debugPrint('Retrieved user infos [$user]');
          yield AuthAuthenticated(user: user);
        } catch(e) {
          print(e);
        }
      } else {
        debugPrint('Current user is not authenticated');
        yield AuthUnauthenticated();
      }
    }

    if (event is LogOut) {
      this.auth.signOut();
      yield AuthUnauthenticated();
    }
  }
}
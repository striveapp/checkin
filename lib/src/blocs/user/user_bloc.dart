import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/user_event.dart';
import 'package:checkin/src/blocs/user/user_state.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

//TODO: This is still used to show the graduation fab, since if appears in the profile
// Cannot be removed because the profile in stats cannot load both current and selected user https://trello.com/c/1WwrY87L

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;

  StreamSubscription userSub;

  UserBloc({
    @required this.userRepository,
    @required this.authBloc,
  }) : super(UserLoading()) {
    _onAuthStateChange(authBloc.state);
    this.authBloc.stream.listen(_onAuthStateChange);
  }

  void _onAuthStateChange(authState) {
    if (authState is AuthAuthenticated) {
      userSub?.cancel();
      userSub = this.userRepository.getUserByEmail(authState.loggedUser.email).listen((user) {
        add(UserUpdated(user: user));
      });
    }

    if (authState is AuthUnauthenticated) {
      userSub?.cancel();
    }
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserUpdated) {
      yield UserSuccess(currentUser: event.user);
    }
  }
}

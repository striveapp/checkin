import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/user_event.dart';
import 'package:checkin/src/blocs/user/user_state.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;
  StreamSubscription userSub;

  UserBloc({@required this.userRepository, @required this.authBloc}) {
    this.authBloc.state.listen((authState) {
      if (authState is AuthAuthenticated) {
        var userEmail = authState.currentUserEmail;
        userSub = this.userRepository.getUserByEmail(userEmail).listen((user) {
          dispatch(UserUpdated(user: user));
        });
      }

      if( authState is AuthUnauthenticated ) {
        if( userSub != null ) {
          userSub.cancel();
        }
        dispatch(UserUpdated(user: null));
      }
    });
  }

  @override
  UserState get initialState => UserLoading();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserUpdated) {
      if( event.user == null ) {
        yield UserLoading();
      } else {
        yield UserSuccess(currentUser: event.user);
      }
    } else if (event is Create) {
      yield* _mapCreateToState(currentState, event);
    } else if (event is Update) {
      yield* _mapUpdateToState(currentState, event);
    } else if (event is UpdateFcmToken) {
      yield* _mapUpdateFcmTokenToState(currentState, event);
    }
  }

  Stream<UserState> _mapCreateToState(
      UserState currentState, Create event) async* {
    try {
      debugPrint('Creating user [' + event.user.toString() + ']');
      await this.userRepository.createUser(
          event.user.name,
          event.user.email,
          event.user.imageUrl,
          event.user.counter,
          event.user.rank,
          event.user.isOwner);
      debugPrint('Created!');
    } catch (e) {
      print('Error during user creation: ' + e.toString());
      yield UserError();
    }
  }

  Stream<UserState> _mapUpdateToState(
      UserState currentState, Update event) async* {
    if (currentState is UserSuccess) {
      try {
        debugPrint('Update user [${currentState ?? "NO"}]');
        if (currentState.currentUser != null) {
          this.userRepository.updateUserGrade(currentState.currentUser, event.grade);
          debugPrint('Updated!');
        } else {
          print('Error during user update, user was null');
          yield UserError();
        }
      } catch (e) {
        print('Error during user update: ' + e.toString());
        yield UserError();
      }
    }
  }

  Stream<UserState> _mapUpdateFcmTokenToState(
      UserState currentState, UpdateFcmToken event) async* {
    if (currentState is UserSuccess) {
      try {
        debugPrint('Update user [${currentState ?? "NO"}]');
        if (currentState.currentUser != null) {
          this.userRepository.updateUserFcmToken(currentState.currentUser, event.token);
          debugPrint('Updated!');
        } else {
          print('Error during user update, user was null');
          yield UserError();
        }
      } catch (e) {
        print('Error during user update: ' + e.toString());
        yield UserError();
      }
    }
  }

  @override
  void dispose() {
    userSub.cancel();
    super.dispose();
  }
}

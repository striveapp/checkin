import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/user_event.dart';
import 'package:checkin/src/blocs/user/user_state.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;
  StreamSubscription userSub;

  UserBloc({@required this.userRepository, @required this.authBloc}) {
    this.authBloc.listen((authState) {
      if (authState is AuthAuthenticated) {
        userSub?.cancel();
        userSub = this
            .userRepository
            .getUserByEmail(authState.loggedUserEmail)
            .listen((user) {
          add(UserUpdated(user: user));
        });
      }

      if (authState is AuthUnauthenticated) {
        userSub?.cancel();
      }
    });
  }

  @override
  UserState get initialState => UserLoading();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserUpdated) {
      if (event.user == null) {
        yield UserError();
      } else {
        yield UserSuccess(currentUser: event.user);
      }
    } else {
      yield* _mapUpdateToState(event);
    }
  }

  Stream<UserState> _mapUpdateToState(UserEvent event) async* {
    try {
      if (event is UpdateGrade) {
        debugPrint('Updating grade...');
        if( this.state is UserSuccess ) {
          yield UserLoading();
          await this.userRepository.updateUserGrade(
            (this.state as UserSuccess).currentUser,
            event.newGrade,
          );
        } else {
          debugPrint('Unable to update user grade to [${event.newGrade}] from userState [$state]');
          yield UserError();
        }

      } else if (event is UpdateName) {
        debugPrint('Updating name...');
        if( this.state is UserSuccess ) {
          yield UserLoading();
          await this.userRepository.updateUserName(
            (this.state as UserSuccess).currentUser,
            event.newName,
          );
        } else {
          debugPrint('Unable to update user name to [${event.newName}] from userState [$state]');
          yield UserError();
        }
      } else if (event is UpdateImage) {
        debugPrint('Updating image...');
        if( this.state is UserSuccess ) {
          yield UserLoading();
          await this.userRepository.updateUserImage(
            (this.state as UserSuccess).currentUser,
            event.newImageUrl,
          );
        } else {
          debugPrint('Unable to update user name to [${event.newImageUrl}] from userState [$state]');
          yield UserError();
        }
      } else if (event is UpdateFcmToken) {
        debugPrint('Updating token...');
        await this.userRepository.updateUserFcmToken(
          event.currentUser,
          event.newToken,
        );
      } else if (event is UpdateSelectedGym) {
        debugPrint('Updating selectedGym...');
        await this.userRepository.updateSelectedGymId(
          event.userEmail,
          event.newSelectedGym,
        );
      }
    } catch (e) {
      print('Error during user update: ' + e.toString());
      yield UserError();
    }
  }

  @override
  Future<void> close() {
    userSub.cancel();
    return super.close();
  }
}

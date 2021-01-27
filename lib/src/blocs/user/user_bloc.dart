import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/user_event.dart';
import 'package:checkin/src/blocs/user/user_state.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final StorageRepository storageRepository;
  final ImageRepository imageRepository;
  final AuthBloc authBloc;
  StreamSubscription userSub;

  UserBloc({
    @required this.userRepository,
    @required this.storageRepository,
    @required this.imageRepository,
    @required this.authBloc,
  }) : super(UserLoading()) {
    _onAuthStateChange(authBloc.state);
    this.authBloc.listen(_onAuthStateChange);
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
      if (event.user == null) {
        yield UserError();
      } else {
        yield UserSuccess(currentUser: event.user);
      }
    } else {
      try {
        //TODO: this should be refactored
        if (this.state is UserSuccess) {
          _mapUpdateToState((this.state as UserSuccess).currentUser.email, event);
        } else {
          debugPrint('Unable to update user [$event] from userState [$state]');
          yield UserError();
        }
      } catch (e) {
        print('Error during user update: ' + e.toString());
        yield UserError();
      }
    }
  }

  void _mapUpdateToState(String userEmail, UserEvent event) {
    event.maybeMap(
        updateName: (UpdateName updateName) async => await userRepository.updateUserName(
              userEmail,
              updateName.newName,
            ),
        updateImageUrl: (UpdateImageUrl updateImageUrl) async {
          File croppedFile = await imageRepository.getCroppedImage();
          if (croppedFile != null) {
            String fileName = "$userEmail-${DateTime.now()}.png";
            String newImageUrl = await storageRepository.uploadImage(croppedFile, fileName);

            await userRepository.updateUserImageUrl(
              userEmail,
              newImageUrl,
            );
          }
        },
        updateGrade: (UpdateGrade updateGrade) async => await userRepository.updateGrade(
              userEmail,
              updateGrade.newGrade,
            ),
        updateFcmToken: (UpdateFcmToken updateFcmToken) async =>
            await userRepository.updateUserFcmToken(
              userEmail,
              updateFcmToken.newToken,
            ),
        updateSelectedGym: (UpdateSelectedGym updateSelectedGym) async =>
            await userRepository.updateSelectedGymId(userEmail, updateSelectedGym.newGymId),
        orElse: () => UserState.userError());
  }

  @override
  Future<void> close() {
    userSub?.cancel();
    return super.close();
  }
}

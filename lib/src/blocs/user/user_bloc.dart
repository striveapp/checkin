import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/user_event.dart';
import 'package:checkin/src/blocs/user/user_state.dart';
import 'package:checkin/src/models/grade.dart';
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
      userSub = this
          .userRepository
          .getUserByEmail(authState.loggedUser.email)
          .listen((user) {
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
          _mapUpdateToState(
              (this.state as UserSuccess).currentUser.email, event);
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
    event.maybeWhen(
        updateName: (String newName) async =>
            await userRepository.updateUserName(
              userEmail,
              newName,
            ),
        updateImageUrl: (String userEmail) async {
          File croppedFile = await imageRepository.getCroppedImage();
          if (croppedFile != null) {
            String fileName = "$userEmail-${DateTime.now()}.png";
            String newImageUrl =
                await storageRepository.uploadImage(croppedFile, fileName);

            await userRepository.updateUserImageUrl(
              userEmail,
              newImageUrl,
            );
          }
        },
        updateGrade: (Grade newGrade) async => await userRepository.updateGrade(
              userEmail,
              newGrade,
            ),
        updateFcmToken: (String userEmail, String newToken) async =>
            await userRepository.updateUserFcmToken(
              userEmail,
              newToken,
            ),
        updateSelectedGym: (String userEmail, String newSelectedGym) async =>
            await userRepository.updateSelectedGymId(
              userEmail,
              newSelectedGym,
            ),
        orElse: () => UserState.userError());
  }

  @override
  Future<void> close() {
    userSub?.cancel();
    return super.close();
  }
}

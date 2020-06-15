import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/user_event.dart';
import 'package:checkin/src/blocs/user/user_state.dart';
import 'package:checkin/src/repositories/uploader_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final UploaderRepository uploaderRepository;
  final AuthBloc authBloc;
  StreamSubscription userSub;

  UserBloc({
    @required this.userRepository,
    @required this.uploaderRepository,
    @required this.authBloc,
  }) {
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
          PickedFile selectedImage =
              await ImagePicker().getImage(source: ImageSource.gallery);
          File croppedFile =
              await ImageCropper.cropImage(sourcePath: selectedImage.path);

          String fileName = "$userEmail-${DateTime.now()}.png";
          String newImageUrl = await uploaderRepository.uploadImage(croppedFile, fileName);
          
          await userRepository.updateUserImageUrl(
            userEmail,
            newImageUrl,
          );
        },
        updateGrade: (String newGrade) async =>
            await userRepository.updateUserGrade(
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
    userSub.cancel();
    return super.close();
  }
}

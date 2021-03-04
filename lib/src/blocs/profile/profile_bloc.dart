import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;
  final StorageRepository storageRepository;
  final ImageRepository imageRepository;
  String nonCurrentUserEmail;

  StreamSubscription<User> _userSub;
  StreamSubscription<User> _currentUserSub;

  ProfileBloc({
    @required this.userRepository,
    @required this.imageRepository,
    @required this.storageRepository,
    this.nonCurrentUserEmail,
  }) : super(InitialProfileState());

  void _onUserChanged(currentUser) {
    if (nonCurrentUserEmail == null || nonCurrentUserEmail == currentUser.email) {
      add(ProfileUpdated(user: currentUser, isCurrentUser: true));
    } else {
      _userSub?.cancel();
      _userSub = this.userRepository.getUserByEmail(this.nonCurrentUserEmail).listen((user) {
        add(ProfileUpdated(user: user, isCurrentUser: false));
      });

      _userSub.onError((err, st) => Logger.log.e(
            "Error loading profile for user [$nonCurrentUserEmail]",
            err,
            st,
          ));
    }
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is InitializeProfile) {
      _currentUserSub?.cancel();
      _currentUserSub = userRepository.getUser().listen(_onUserChanged);
    }

    if (event is ProfileUpdated) {
      yield ProfileLoaded(
        profileUser: event.user,
        isCurrentUser: event.isCurrentUser,
      );
    }

    if (event is UpdateName) {
      await userRepository.updateUserName(
        event.userEmail,
        event.newName,
      );
    }

    if (event is UpdateImageUrl) {
      File croppedFile = await imageRepository.getCroppedImage();
      if (croppedFile != null) {
        String fileName = "${event.userEmail}-${DateTime.now()}.png";
        String newImageUrl = await storageRepository.uploadImage(croppedFile, fileName);

        await userRepository.updateUserImageUrl(
          event.userEmail,
          newImageUrl,
        );
      }
    }
  }

  @override
  Future<void> close() {
    _userSub?.cancel();
    _currentUserSub?.cancel();
    return super.close();
  }
}

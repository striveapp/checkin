import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;
  String profileEmail;
  StreamSubscription userSub;

  ProfileBloc({@required this.userRepository, @required this.profileEmail}) {
    userSub = this
        .userRepository
        .getUserByEmail(this.profileEmail)
        .listen((user) => dispatch(ProfileUpdated(user: user)));

    userSub.onError((error) => debugPrint(
          "Error loading profile with mail [$profileEmail]: $error",
        ));
  }

  @override
  ProfileState get initialState => ProfileLoading();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileUpdated) {
      if (event.user == null) {
        yield ProfileLoading();
      } else {
        yield ProfileSuccess(profileUser: event.user);
      }
    }
  }

  @override
  void dispose() {
    userSub.cancel();
    super.dispose();
  }
}

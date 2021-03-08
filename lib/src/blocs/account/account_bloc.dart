import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/account/account_event.dart';
import 'package:checkin/src/blocs/account/account_state.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AnalyticsRepository analyticsRepository;
  final UserRepository userRepository;

  StreamSubscription<User> _userSub;

  AccountBloc({
    @required this.analyticsRepository,
    @required this.userRepository,
  }) : super(AccountInitial()) {
    _userSub?.cancel();
    _userSub = userRepository.getUser().listen(_onUserChanged);
  }

  void _onUserChanged(User currentUser) {
    Logger.log.d("currentUser: ${currentUser.email}");
    add(AccountUpdated(user: currentUser));
  }

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    if (event is AccountUpdated) {
      yield AccountLoaded(user: event.user);
    }

    if (event is AccountDisplayError) {
      analyticsRepository.setupBankAccountError(error: event.errorMessage);
      yield AccountError(errorMessage: event.errorMessage);
    }
  }

  @override
  Future<void> close() {
    _userSub?.cancel();
    return super.close();
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/account/account_event.dart';
import 'package:checkin/src/blocs/account/account_state.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AnalyticsRepository analyticsRepository;
  final UserRepository userRepository;

  late StreamSubscription<User> _userSub;

  AccountBloc({
    required this.analyticsRepository,
    required this.userRepository,
  }) : super(AccountInitial()) {
    _userSub = userRepository.getUser().listen(_onUserStateChanged);
  }

  void _onUserStateChanged(User currentUser) {
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
    _userSub.cancel();
    return super.close();
  }
}

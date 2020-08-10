import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/account/account_event.dart';
import 'package:checkin/src/blocs/account/account_state.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:flutter/material.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AnalyticsRepository analyticsRepository;
  final UserBloc userBloc;

  AccountBloc({
    @required this.userBloc,
    @required this.analyticsRepository
  })  : assert(userBloc != null && analyticsRepository != null) {
    this.userBloc.listen((userState) {
      if(userState is UserSuccess) {
          add(AccountUpdated(user: userState.currentUser));
        }
    });
  }

  @override
  AccountState get initialState => AccountInitial();

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    if( event is AccountUpdated ) {
        yield AccountLoaded(user: event.user);
    }

    if( event is AccountDisplayError ) {
      analyticsRepository.setupBankAccountError(error: event.errorMessage);
      yield AccountError(errorMessage: event.errorMessage);
    }
  }
}

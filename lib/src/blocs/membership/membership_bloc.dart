import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/membership/membership_event.dart';
import 'package:checkin/src/blocs/membership/membership_state.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:flutter/cupertino.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  MembershipRepository membershipRepository;

  MembershipBloc({@required this.membershipRepository})
      : assert(membershipRepository != null);

  @override
  MembershipState get initialState => MembershipInitial();

  @override
  Stream<MembershipState> mapEventToState(MembershipEvent event) async* {
    if (event is Unsubscribe) {
      yield MembershipLoading();
      await this.membershipRepository.unsubscribe();
      yield MembershipLoaded();
    }
  }
}

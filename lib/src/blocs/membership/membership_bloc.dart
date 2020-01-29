import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/membership/membership_event.dart';
import 'package:checkin/src/blocs/membership/membership_state.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:flutter/cupertino.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final MembershipRepository membershipRepository;
  final UserBloc userBloc;

  StreamSubscription<Membership> membershipSub;

  MembershipBloc({@required this.membershipRepository, @required this.userBloc})
      : assert(membershipRepository != null) {

    this.userBloc.listen((userState) {
      if (userState is UserSuccess) {
        membershipSub?.cancel();
        add(MembershipUpdated(email: userState.currentUser.email, membership: null));
        membershipSub = this.membershipRepository
            .getMembership(userState.currentUser.email).listen((membership) {
          add(MembershipUpdated(email: userState.currentUser.email, membership: membership));
        });
        membershipSub.onError((error) {
          debugPrint("An error occurred while loading membership $error");
        });
      }
    });
  }

  @override
  MembershipState get initialState => MembershipInitial();

  @override
  Stream<MembershipState> mapEventToState(MembershipEvent event) async* {
    if (event is Unsubscribe) {
      yield MembershipLoading();
      await this.membershipRepository.unsubscribe();
    }

    if( event is MembershipUpdated ) {
      if( event.membership?.status == "active") {
        yield MembershipActive(membership: event.membership);
      } else {
        yield MembershipInactive(email: event.email);
      }
    }
  }

  @override
  Future<void> close() {
    membershipSub?.cancel();
    return super.close();
  }
}

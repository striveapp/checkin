import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bloc.dart';

class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  final GymRepository gymRepository;
  final String gymId;
  Gym _gym;

  StreamSubscription<Gym> gymSub;

  PaymentsBloc({
    @required this.gymId,
    @required this.gymRepository}) {
    gymSub?.cancel();
    gymSub = gymRepository
        .getGym(gymId)
        .listen((gym) {
      this._gym = gym;
    });
  }

  @override
  PaymentsState get initialState => InitialPaymentsState();

  @override
  Stream<PaymentsState> mapEventToState(
    PaymentsEvent event,
  ) async* {

    if( event is LaunchStripePayment ) {
      var url = Uri.encodeFull("https://${_gym.domain}/payment.html?pk=${_gym.stripePublicKey}&host=${_gym.host}&customerEmail=${event.customerEmail}&plan=${event.planCode}&nocache=${DateTime.now()}");

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // todo yield error state
        throw 'Could not launch $url';
      }
    }
  }
}


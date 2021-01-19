import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/payment_api.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/payment_method.dart';
import 'package:checkin/src/repositories/payment_method_repository.dart';
import 'package:checkin/src/util/url_launcher_util.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class PaymentMethodsBloc extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  final PaymentApi _paymentApi;
  final PaymentMethodRepository _paymentMethodRepository;
  final UrlLauncherUtil _urlLauncherUtil;
  final UserBloc _userBloc;
  StreamSubscription<PaymentMethod> _paymentMethodSub;

  PaymentMethodsBloc({
    @required PaymentApi paymentApi,
    @required PaymentMethodRepository paymentMethodRepository,
    @required UrlLauncherUtil urlLauncherUtil,
    @required UserBloc userBloc,
  })  : assert(paymentApi != null &&
            paymentMethodRepository != null &&
            urlLauncherUtil != null &&
            userBloc != null),
        _paymentApi = paymentApi,
        _paymentMethodRepository = paymentMethodRepository,
        _urlLauncherUtil = urlLauncherUtil,
        _userBloc = userBloc,
        super(InitialPaymentMethodsState()) {
    try {
      _onUserStateChanged(_userBloc.state);
      _userBloc.listen(_onUserStateChanged);
    } catch (err) {
      debugPrint("Error while fetching the gym stream $err");
    }
  }

  void _onUserStateChanged(UserState userState) {
    if (userState is UserSuccess) {
      _paymentMethodSub = _paymentMethodRepository
          .getPaymentMethod(
              gymId: userState.currentUser.selectedGymId, email: userState.currentUser.email)
          .listen((paymentMethod) {
        add(PaymentMethodUpdated(
            paymentMethod: paymentMethod, userEmail: userState.currentUser.email));
      });
    }
  }

  @override
  Stream<PaymentMethodsState> mapEventToState(
    PaymentMethodsEvent event,
  ) async* {
    if (event is RegisterBankAccount) {
      yield PaymentMethodLoading(show: true);
      try {
        var gym = event.gym;

        String clientSecret =
            await _paymentApi.setupIntent(customerEmail: event.billingEmail, gymId: gym.id);

        yield PaymentMethodLoading(show: false);
        await _urlLauncherUtil.launchUrl(
            "https://${gym.paymentAppDomain}?pk=${gym.stripePublicKey}&customerEmail=${event.billingEmail}&cs=$clientSecret&gymName=${gym.id}&nocache=${DateTime.now()}");
      } catch (err) {
        print(err);
      }
    }
    if (event is ChangeBankAccount) {
      yield PaymentMethodLoading(show: true);
      try {
        var gym = event.gym;

        String clientSecret =
            await _paymentApi.setupIntent(customerEmail: event.billingEmail, gymId: gym.id);

        yield PaymentMethodLoading(show: false);
        await _urlLauncherUtil.launchUrl(
            "https://${gym.paymentAppDomain}?pk=${gym.stripePublicKey}&customerEmail=${event.billingEmail}&cs=$clientSecret&gymName=${gym.id}&nocache=${DateTime.now()}");
      } catch (err) {
        print(err);
      }
    }
    if (event is PaymentMethodUpdated) {
      if (event.paymentMethod != null) {
        yield PaymentMethodLoaded(
          paymentMethod: event.paymentMethod,
        );
      } else {
        yield PaymentMethodEmpty(customerEmail: event.userEmail);
      }
    }
  }

  @override
  Future<void> close() {
    _paymentMethodSub?.cancel();
    return super.close();
  }
}

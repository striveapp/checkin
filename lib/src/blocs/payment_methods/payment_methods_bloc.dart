import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/payment_api.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/payment_method.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/payment_method_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/util/url_launcher_util.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class PaymentMethodsBloc extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  final PaymentApi _paymentApi;
  final PaymentMethodRepository _paymentMethodRepository;
  final UserRepository _userRepository;
  final UrlLauncherUtil _urlLauncherUtil;
  StreamSubscription<User> _userSub;
  StreamSubscription<PaymentMethod> _paymentMethodSub;

  PaymentMethodsBloc({
    @required PaymentApi paymentApi,
    @required PaymentMethodRepository paymentMethodRepository,
    @required UrlLauncherUtil urlLauncherUtil,
    @required UserRepository userRepository,
  })  : assert(paymentApi != null && paymentMethodRepository != null && urlLauncherUtil != null),
        _paymentApi = paymentApi,
        _paymentMethodRepository = paymentMethodRepository,
        _userRepository = userRepository,
        _urlLauncherUtil = urlLauncherUtil,
        super(InitialPaymentMethodsState()) {
    try {
      _userSub = _userRepository.getUser().listen(_onUserChanged);
    } catch (err, st) {
      Logger.log.e("Error while fetching the gym stream", err, st);
    }
  }

  void _onUserChanged(User currentUser) {
    _paymentMethodSub = _paymentMethodRepository
        .getPaymentMethod(
      gymId: currentUser.selectedGymId,
      email: currentUser.email,
    )
        .listen((paymentMethod) {
      add(PaymentMethodUpdated(
        paymentMethod: paymentMethod,
        userEmail: currentUser.email,
      ));
    });
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
      } catch (err, st) {
        Logger.log.e("Error in RegisterBankAccount", err, st);
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
      } catch (err, st) {
        Logger.log.e("Error with ChangeBankAccount", err, st);
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
    _userSub?.cancel();
    return super.close();
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/payment_api.dart';
import 'package:checkin/src/models/payment_method.dart';
import 'package:checkin/src/repositories/payment_method_repository.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class PaymentMethodsBloc
    extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  final PaymentApi _paymentApi;
  final PaymentMethodRepository _paymentMethodRepository;
  StreamSubscription<PaymentMethod> _paymentMethodSub;

  PaymentMethodsBloc({
    @required PaymentApi paymentApi,
    @required PaymentMethodRepository paymentMethodRepository,
  })  : assert(paymentApi != null && paymentMethodRepository != null),
        _paymentApi = paymentApi,
        _paymentMethodRepository = paymentMethodRepository {
    _paymentMethodSub = _paymentMethodRepository.getPaymentMethod(gymId: "test", email: "test@test.com")
        .listen((paymentMethod) {
      add(PaymentMethodUpdated(paymentMethod: paymentMethod));
    });
  }

  @override
  PaymentMethodsState get initialState => InitialPaymentMethodsState();

  @override
  Stream<PaymentMethodsState> mapEventToState(
    PaymentMethodsEvent event,
  ) async* {
    if (event is RegisterBankAccount) {
      //TODO: To be implemented
      _paymentApi.setupIntent();
    }
    if (event is PaymentMethodUpdated) {
      if(event.paymentMethod != null ) {
        yield PaymentMethodLoaded(paymentMethod: event.paymentMethod);
      } else {
        yield PaymentMethodEmpty();
      }
    }
  }

  @override
  Future<void> close() {
    _paymentMethodSub?.cancel();
    return super.close();
  }
}

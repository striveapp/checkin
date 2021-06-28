// @dart=2.9

import 'package:checkin/src/blocs/payment_methods/bloc.dart';
import 'package:checkin/src/models/payment_method.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/payment_methods/active_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'empty_payment_method.dart';

class PaymentMethodsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: 255),
        child: Card(
            child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: BlocListener<PaymentMethodsBloc, PaymentMethodsState>(
              listener: (BuildContext context, PaymentMethodsState state) {
                if (state is PaymentMethodLoading) {
                  if (state.show) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => LoadingIndicator());
                  } else {
                    Navigator.of(context).pop();
                  }
                }
              },
              child: BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
                buildWhen: (PaymentMethodsState previous, PaymentMethodsState current) =>
                    !(current is PaymentMethodLoading),
                builder: (BuildContext context, PaymentMethodsState state) => state.maybeWhen(
                  initialPaymentMethodsState: () => LoadingIndicator(),
                  paymentMethodLoaded: (PaymentMethod paymentMethod) => ActivePaymentMethodView(
                    paymentMethod: paymentMethod,
                  ),
                  paymentMethodEmpty: (String customerEmail) => EmptyPaymentMethod(
                    customerEmail: customerEmail,
                  ),
                  orElse: () => LoadingIndicator(),
                ),
              ),
            ),
          ),
        )));
  }
}

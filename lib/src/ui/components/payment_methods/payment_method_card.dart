import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/payment_methods/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: 280),
        child: Card(
            child: Container(
          height: 150,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
              builder: (BuildContext context, PaymentMethodsState state) {
                return state.when(
                    initialPaymentMethodsState: () => LoadingIndicator(),
                    paymentMethodLoading: () => LoadingIndicator(),
                    paymentMethodLoaded: (event) => Container(),
                    paymentMethodEmpty: (String customerEmail) =>
                        EmptyPaymentMethod(customerEmail: customerEmail,));
              },
            ),
          ),
        )));
  }
}

class EmptyPaymentMethod extends StatelessWidget {
  final String customerEmail;

  const EmptyPaymentMethod({Key key, @required this.customerEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "There are no registered payment methods",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3.apply(fontSizeDelta: 1),
        ),
        BlocBuilder<GymBloc, GymState>(
            builder: (BuildContext context, GymState state) {
          return state.when(
              initialGymState: () => LoadingIndicator(),
              gymLoaded: (Gym gym) => RaisedButton(
                    child: Text(
                      "Connect Bank Account",
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {
                      BlocProvider.of<PaymentMethodsBloc>(context).add(
                          RegisterBankAccount(
                              gym: gym, billingEmail: customerEmail));
                    },
                  ));
        })
      ],
    );
  }
}

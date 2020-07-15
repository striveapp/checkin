import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/payment_methods/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_indicator.dart';

class ActivePaymentMethodView extends StatelessWidget {
  static const String changePaymentInfo = 'Change payment infos';
  static const String billingEmail = 'Billing email';
  static const String bankAccount = 'Bank account';
  final PaymentMethod paymentMethod;

  const ActivePaymentMethodView({Key key, this.paymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            billingEmail.i18n,
            style:
                Theme.of(context).textTheme.headline3.apply(fontWeightDelta: 1),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.email),
              ),
              Expanded(
                  child: Text(
                paymentMethod.billingEmail,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline3,
              )),
            ],
          ),
          Text(
            bankAccount.i18n,
            style:
                Theme.of(context).textTheme.headline3.apply(fontWeightDelta: 1),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.account_balance),
              ),
              Expanded(
                  child: Text(
                      "${paymentMethod.country.toUpperCase()} •• •••• •••• •••• •••• ${paymentMethod.lastFourDigits}",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .apply(letterSpacingDelta: 0.8))),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Center(child: BlocBuilder<GymBloc, GymState>(
              builder: (BuildContext context, GymState state) {
            return state.when(
                initialGymState: () => LoadingIndicator(),
                gymLoaded: (Gym gym) => RaisedButton(
                      child: Text(
                        changePaymentInfo.i18n,
                        style: Theme.of(context).textTheme.button,
                      ),
                      color: Theme.of(context).buttonTheme.colorScheme.error,
                      onPressed: () {
                        BlocProvider.of<PaymentMethodsBloc>(context).add(
                            ChangeBankAccount(
                                gym: gym,
                                billingEmail: paymentMethod.billingEmail,
                                customerId: paymentMethod.customerId));
                      },
                    ));
          }))
        ],
      );
}

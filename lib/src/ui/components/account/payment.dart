// @dart=2.9

import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/membership/membership_card.dart';
import 'package:checkin/src/ui/components/payment_methods/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Payment extends StatelessWidget {
  static const String membership = 'Membership';
  static const String paymentMethods = 'Payment Methods';

  const Payment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymBloc, GymState>(builder: (BuildContext context, GymState state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(membership.i18n, style: Theme.of(context).textTheme.headline1),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: MembershipCard(),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(paymentMethods.i18n, style: Theme.of(context).textTheme.headline1),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: PaymentMethodsCard(),
          ),
        ],
      );
    });
  }
}

import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/ui/components/membership/membership_card.dart';
import 'package:checkin/src/ui/components/payment_methods/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Payment extends StatelessWidget {
  static const String membership = 'Membership';
  static const String paymentMethods = 'Payment Methods';
  
  final bool userHasActivePayments;
  
  const Payment({
    Key key,
    this.userHasActivePayments
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymBloc, GymState>(
      builder: (BuildContext context, GymState state) {
        if( paymentsToggle(state) ) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(membership.i18n,
                    style: Theme.of(context)
                        .textTheme
                        .headline1),
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
                child: Text(paymentMethods.i18n,
                    style: Theme.of(context)
                        .textTheme
                        .headline1),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: PaymentMethodsCard(),
              ),
            ],
          );
        }
        return Container(width: 0.0, height: 0.0,);
      }
    );
  }

  /**
   * user preference should always win when present
   * if not gym preference wins
   * */
  bool paymentsToggle(GymState state) {
    if( userHasActivePayments != null ) {
      debugPrint("User payments toggle is [$userHasActivePayments]!");
      return userHasActivePayments;
    }

    if( state is GymLoaded ) {
      debugPrint("Gym payments toggle is [${state.gym.hasActivePayments}]!");
      return state.gym.hasActivePayments;
    }

    // should never get here
    debugPrint("When you get here you should question your reality!");
    return false;
  }
}

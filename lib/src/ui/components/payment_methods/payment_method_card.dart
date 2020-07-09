import 'package:checkin/src/api/http_client.dart';
import 'package:checkin/src/api/payment_api.dart';
import 'package:checkin/src/blocs/payment_methods/bloc.dart';
import 'package:checkin/src/resources/auth_provider.dart';
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
                    paymentMethodLoaded: (event) => Container(),
                    paymentMethodEmpty: () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "There are no registered payment methods",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .apply(fontSizeDelta: 1),
                        ),
                        RaisedButton(
                          child: Text(
                            "Connect Bank Account",
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: () {
                            callPaymentApi();
                          },
                        ),
                      ],
                    ));
              },
            ),
          ),
        )));
  }

  void callPaymentApi() {
    PaymentApi(httpClient: HttpClient(authRepository: AuthProvider()))
        .setupIntent(
            gymId: "test",
            customerId: "customerId",
            customerEmail: "test@test.com");
  }
}

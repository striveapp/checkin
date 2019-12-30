import 'package:checkin/src/models/subscription_plan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final String customerEmail;

  SubscriptionPlanCard({
    @required this.plan,
    @required this.customerEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: Card(
          child: InkWell(
            onTap: _launchURL,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        plan.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(fontSizeFactor: 1.2, color: Colors.black87),
                      ),
                      Text(
                        plan.description,
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "€${_formatPrice(plan.price)}",
                        style: Theme.of(context).textTheme.headline.apply(
                            fontSizeFactor: 1.7,
                            color: Theme.of(context).accentColor),
                      ),
                      Text(
                        "/${_getIntervalShort(plan.interval)}",
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .apply(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  String _getIntervalShort(String interval) =>
      interval == "Monthly" ? "mo" : "yr";

  String _formatPrice(int price) {
    final f = NumberFormat("###.00");
    final s = f.format(price / 100);
    return s.endsWith('00') ? s.substring(0, s.length - 3) : s;
  }

  void _launchURL() async {

    var url = "https://checkin-test-fba3d.firebaseapp.com/payment.html?customerEmail=$customerEmail&plan=${plan.code}&nocache=${DateTime.now()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

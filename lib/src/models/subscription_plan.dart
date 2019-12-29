import 'package:equatable/equatable.dart';

class SubscriptionPlan extends Equatable {
  final String name;
  final String code;
  final String interval;
  final String currency;
  final String price;


  SubscriptionPlan(
      this.name, this.code, this.interval, this.currency, this.price);

  @override
  List<Object> get props => [name, code, interval, currency, price];

  @override
  String toString() {
    return 'SubscriptionPlan{name: $name, code: $code, interval: $interval, currency: $currency, price: $price}';
  }
}
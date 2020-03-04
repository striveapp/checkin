import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SubscriptionPlan extends Equatable {
  final String name;
  final String description;
  final String code;
  final String interval;
  final String currency;
  final int price;


  SubscriptionPlan({
    @required this.name,
    @required this.code,
    @required this.interval,
    @required this.currency,
    @required this.price,
    this.description = "",
  });

  @override
  List<Object> get props => [name, code, interval, currency, price, description];

  @override
  String toString() => 'SubscriptionPlan{name: $name, description: $description, code: $code, interval: $interval, currency: $currency, price: $price}';
}
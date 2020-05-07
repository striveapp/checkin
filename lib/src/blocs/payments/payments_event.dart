import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PaymentsEvent extends Equatable {
  const PaymentsEvent();
}

class LaunchStripePayment extends PaymentsEvent {
  final String customerEmail;
  final String planCode;

  const LaunchStripePayment({this.customerEmail, this.planCode});

  @override
  List<Object> get props => [customerEmail, planCode];
}
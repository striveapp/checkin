
import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final String interval;
  final String cardLastFourDigits;

  Subscription({
    this.interval,
    this.cardLastFourDigits,
  });

  @override
  List<Object> get props => [interval, cardLastFourDigits];

  @override
  String toString() => 'Subscription{interval: $interval, cardLastFourDigits: $cardLastFourDigits}';
}
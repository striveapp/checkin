
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Membership extends Equatable {
  final String status;
  final int currentPeriodEnd;
  final String cardLastFourDigits;
  final String email;

  Membership({
    @required this.status,
    @required this.email,
    this.currentPeriodEnd,
    this.cardLastFourDigits,
  });

  @override
  List<Object> get props => [status, email, currentPeriodEnd, cardLastFourDigits];

  @override
  String toString() {
    return 'Membership{status: $status, currentPeriodEnd: $currentPeriodEnd, cardLastFourDigits: $cardLastFourDigits, email: $email}';
  }
}
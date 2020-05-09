import 'package:equatable/equatable.dart';

class Gym extends Equatable {
  final String domain;
  final String host;
  final String stripePublicKey;

  Gym({this.domain, this.host, this.stripePublicKey});

  @override
  List<Object> get props  => [domain, host, stripePublicKey];

  @override
  String toString() {
    return 'Gym{domain: $domain, host: $host, stripePublicKey: $stripePublicKey}';
  }

}
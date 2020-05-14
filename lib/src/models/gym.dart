import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Gym extends Equatable {
  final String id;
  final String domain;
  final String host;
  final String stripePublicKey;

  Gym({
    @required this.id,
    @required this.domain,
    @required this.host,
    @required this.stripePublicKey,
  });

  @override
  List<Object> get props => [id, domain, host, stripePublicKey];

  @override
  String toString() {
    return 'Gym{id: $id, domain: $domain, host: $host, stripePublicKey: $stripePublicKey}';
  }
}

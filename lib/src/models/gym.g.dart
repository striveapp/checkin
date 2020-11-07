// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Gym _$_$_GymFromJson(Map<String, dynamic> json) {
  return _$_Gym(
    id: json['id'] as String,
    paymentAppDomain: json['paymentAppDomain'] as String,
    host: json['host'] as String,
    stripePublicKey: json['stripePublicKey'] as String,
    hasActivePayments: json['hasActivePayments'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_GymToJson(_$_Gym instance) => <String, dynamic>{
      'id': instance.id,
      'paymentAppDomain': instance.paymentAppDomain,
      'host': instance.host,
      'stripePublicKey': instance.stripePublicKey,
      'hasActivePayments': instance.hasActivePayments,
    };

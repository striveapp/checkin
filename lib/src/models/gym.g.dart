// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Gym _$_$_GymFromJson(Map<String, dynamic> json) {
  return _$_Gym(
    id: json['id'] as String,
    name: json['name'] as String,
    paymentAppDomain: json['paymentAppDomain'] as String,
    stripePublicKey: json['stripePublicKey'] as String,
    imageUrl: json['imageUrl'] as String,
    hasActivePayments: json['hasActivePayments'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_GymToJson(_$_Gym instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'paymentAppDomain': instance.paymentAppDomain,
      'stripePublicKey': instance.stripePublicKey,
      'imageUrl': instance.imageUrl,
      'hasActivePayments': instance.hasActivePayments,
    };

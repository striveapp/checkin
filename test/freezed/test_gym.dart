import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'gym.dart';

part 'test_gym.freezed.dart';
part 'test_gym.g.dart';

@freezed
abstract class TestGym with _$TestGym {

  factory TestGym({
    String domain,
    String host,
    String stripePublicKey,
    @required String requiredField,
  }) = _TestGym;

  factory TestGym.fromJson(Map<String, dynamic> json) => _$TestGymFromJson(json);

  factory TestGym.fromGym( Gym gym ) {
    return TestGym(domain: gym.domain, host: gym.host, stripePublicKey: gym.stripePublicKey, requiredField: "converted fromGym($gym)");
  }

  const factory TestGym.caseOne([@Default("caseOne") String caseOne]) = _CaseOne;
  const factory TestGym.caseTwo(String caseTwo) = _CaseTwo;
  const factory TestGym.caseThree({@required String caseThree}) = CaseThree;
  const factory TestGym.caseFour({String caseFour}) = CaseFour;
}
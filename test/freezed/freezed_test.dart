// @dart=2.9

import 'dart:convert';

import 'package:test/test.dart';

import 'gym.dart';
import 'test_gym.dart';

void main() {
  test("toString test", () {
    Gym gym = Gym(domain: "testDomain", host: "testHost", stripePublicKey: "testKey");
    print("Old: $gym");

    TestGym testGym = TestGym(
        domain: "testDomain",
        host: "testHost",
        stripePublicKey: "testKey",
        requiredField: "required");
    print("New: $testGym");
  });

  test("equality test", () {
    Gym gym = Gym(domain: "testDomain", host: "testHost", stripePublicKey: "testKey");
    Gym gymClone = Gym(domain: "testDomain", host: "testHost", stripePublicKey: "testKey");
    expect(gym, equals(gymClone));

    TestGym testGym = TestGym(
        domain: "testDomain",
        host: "testHost",
        stripePublicKey: "testKey",
        requiredField: "required");
    TestGym testGymClone = TestGym(
        domain: "testDomain",
        host: "testHost",
        stripePublicKey: "testKey",
        requiredField: "required");
    expect(testGym, equals(testGymClone));
  });

  test("required params test", () {
    Gym gym = Gym(domain: "testDomain", host: "testHost");
    print("Old: $gym");

    TestGym testGym = TestGym(domain: "testDomain", host: "testHost", requiredField: "required");
    print("New: $testGym");
  });

  test("custom constructor test", () {
    Gym gym = Gym(domain: "testDomain", host: "testHost");
    print("Old: $gym");

    TestGym testGym = TestGym.fromGym(gym);
    print("New: $testGym");
  });

  test("json test", () {
    TestGym testGym = TestGym(domain: "testDomain", host: "testHost", requiredField: "required");
    Map<String, dynamic> serializedTestGym = testGym.toJson();

    print("toJson: ${jsonEncode(serializedTestGym)}");

    TestGym deserializedTestGym = TestGym.fromJson(serializedTestGym);
    print("fromJson: $deserializedTestGym");
    expect(testGym, equals(deserializedTestGym));
  });

  test("pattern matching test", () {
    executePatternMatching(
        TestGym(domain: "testDomain", host: "testHost", requiredField: "required"));
    executePatternMatching(TestGym.caseOne());
    executePatternMatching(TestGym.caseTwo("i'm case two"));
    executePatternMatching(TestGym.caseThree(caseThree: "i'm three"));
    executePatternMatching(TestGym.caseFour());
  });
}

void executePatternMatching(TestGym testGym) {
  testGym.when(
      (
        String domain,
        String host,
        String stripePublicKey,
        String requiredField,
      ) =>
          print("case zero"),
      caseOne: (String caseOne) => print("case one [$caseOne]"),
      caseTwo: (String caseTwo) => print("case two [$caseTwo]"),
      caseThree: (String caseThree) => print("case three [$caseThree]]"),
      caseFour: (String caseFour) => print("case four [$caseFour]"));

  testGym.maybeMap((TestGym caseZero) => print("mapped case zero [$caseZero]"),
      caseThree: (CaseThree caseThree) => print("case three [$caseThree]]"),
      caseFour: (CaseFour caseFour) => print("case four [$caseFour]"),
      orElse: () => print("dunno what to do here"));
}

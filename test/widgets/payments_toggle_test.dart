import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/ui/components/account/payment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Payments toggle", () {
    group("When user preference exists, it should win", () {
      test("When user preference is true", () {
        var result = Payment(
          userHasActivePayments: true,
        ).paymentsToggle(GymState.initialGymState());
        expect(result, true);
      });
      test("When user preference is false", () {
        var result = Payment(
          userHasActivePayments: false,
        ).paymentsToggle(GymState.initialGymState());
        expect(result, false);
      });
    });

    group("When user preference is null, gym preference should win", () {
      test("When gym preference is true", () {
        var result = Payment(
          userHasActivePayments: null,
        ).paymentsToggle(GymState.gymLoaded(
            gym: Gym(
                id: "fake-gym",
                paymentAppDomain: "test-domain",
                stripePublicKey: "test-key",
                hasActivePayments: true)));
        expect(result, true);
      });
      test("When gym preference is false", () {
        var result = Payment(
          userHasActivePayments: null,
        ).paymentsToggle(GymState.gymLoaded(
            gym: Gym(
                id: "fake-gym",
                paymentAppDomain: "test-domain",
                stripePublicKey: "test-key",
                hasActivePayments: false)));
        expect(result, false);
      });
      test("When you get here you should question your reality", () {
        var result = Payment(
          userHasActivePayments: null,
        ).paymentsToggle(GymState.initialGymState());
        expect(result, false);
      });
    });
  });
}

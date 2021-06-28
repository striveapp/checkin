// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/subscription_plans/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/subscription_plans_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'helper/mock_helper.dart';

class MockSubscriptionPlansRepository extends Mock implements SubscriptionPlansRepository {}

class MockGymRepository extends Mock implements GymRepository {}

void main() {
  group("SubscriptionPlansBloc", () {
    MockSubscriptionPlansRepository mockSubscriptionPlansRepository;
    MockGymRepository mockGymRepository;

    Gym fakeGym = Gym(
      id: "some_id",
      name: "Test gym",
      paymentAppDomain: "test.com",
      stripePublicKey: "pk_kp",
      hasActivePayments: false,
      imageUrl: "cool-gyms-have-cooler-images",
    );

    setUp(() {
      mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
      mockGymRepository = MockGymRepository();

      configureThrowOnMissingStub([mockSubscriptionPlansRepository, mockGymRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockSubscriptionPlansRepository,
        mockGymRepository,
      ]);
    });

    group("initial state", () {
      SubscriptionPlansBloc subscriptionPlansBloc;

      setUp(() {
        when(mockGymRepository.getGym()).thenAnswer((realInvocation) => Stream.value(fakeGym));
        when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
            .thenAnswer((_) => Stream.empty());
        subscriptionPlansBloc = SubscriptionPlansBloc(
            gymRepository: mockGymRepository,
            subscriptionPlansRepository: mockSubscriptionPlansRepository);
      });

      test('is SubscriptionPlansInitial', () {
        expect(subscriptionPlansBloc.state, SubscriptionPlansInitial());
      });

      tearDown(() {
        verify(mockGymRepository.getGym());
        verify(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id));
        subscriptionPlansBloc?.close();
      });
    });

    group("on SubscriptionPlansUpdated event", () {
      setUp(() {
        when(mockGymRepository.getGym()).thenAnswer((realInvocation) => Stream.value(fakeGym));
      });

      tearDown(() {
        verify(mockGymRepository.getGym());
      });

      group("when there are plans", () {
        List<SubscriptionPlan> testPlans = [
          SubscriptionPlan.simpleSubscription(
              name: "test1", interval: "int1", currency: "EUR", code: "plan1", price: 1)
        ];

        setUp(() {
          when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id)).thenAnswer((_) {
            return Stream<List<SubscriptionPlan>>.fromFuture(Future.value(testPlans));
          });
        });

        tearDown(() {
          verify(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id));
        });

        blocTest("should emit SubscriptionPlansLoaded",
            build: () => SubscriptionPlansBloc(
                gymRepository: mockGymRepository,
                subscriptionPlansRepository: mockSubscriptionPlansRepository),
            expect: () => [SubscriptionPlansLoaded(subscriptionPlans: testPlans)]);
      });

      group("when there are unsorted plans", () {
        List<SubscriptionPlan> testPlans = [
          SubscriptionPlan.simpleSubscription(
              name: "test1", interval: "int1", currency: "EUR", code: "plan1", price: 2),
          SubscriptionPlan.simpleSubscription(
              name: "test1", interval: "int1", currency: "EUR", code: "plan1", price: 1)
        ];

        List<SubscriptionPlan> sortedTestPlans = [
          SubscriptionPlan.simpleSubscription(
              name: "test1", interval: "int1", currency: "EUR", code: "plan1", price: 1),
          SubscriptionPlan.simpleSubscription(
              name: "test1", interval: "int1", currency: "EUR", code: "plan1", price: 2),
        ];

        setUp(() {
          when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id)).thenAnswer((_) {
            return Stream<List<SubscriptionPlan>>.value(testPlans);
          });
        });

        tearDown(() {
          verify(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id));
        });

        blocTest("should emit SubscriptionPlansLoaded with plans sorted by price (asc)",
            build: () => SubscriptionPlansBloc(
                  gymRepository: mockGymRepository,
                  subscriptionPlansRepository: mockSubscriptionPlansRepository,
                ),
            expect: () => [SubscriptionPlansLoaded(subscriptionPlans: sortedTestPlans)]);
      });

      group("when there are NO plans", () {
        setUp(() {
          when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
              .thenAnswer((_) => Stream.empty());
        });

        tearDown(() {
          verify(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id));
        });

        blocTest("should emit SubscriptionPlansEmpty with empty plans",
            build: () => SubscriptionPlansBloc(
                gymRepository: mockGymRepository,
                subscriptionPlansRepository: mockSubscriptionPlansRepository),
            act: (bloc) => bloc.add(SubscriptionPlansUpdated(subscriptionPlans: [])),
            expect: () => [SubscriptionPlansEmpty()]);
      });
    });
  });
}

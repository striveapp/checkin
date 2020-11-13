import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/subscription_plans/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/repositories/subscription_plans_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'helper/mock_helper.dart';

class MockSubscriptionPlansRepository extends Mock
    implements SubscriptionPlansRepository {}

class MockGymBloc extends Mock implements GymBloc {}

void main() {
  group("SubscriptionPlansBloc", () {
    MockSubscriptionPlansRepository mockSubscriptionPlansRepository;
    MockGymBloc mockGymBloc;

    Gym fakeGym = Gym(
        id: "some_id",
        host: "tha_host",
        paymentAppDomain: "test.com",
        stripePublicKey: "pk_kp",
        hasActivePayments: false);

    setUp(() {
      mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
      mockGymBloc = MockGymBloc();
      configureThrowOnMissingStub([mockSubscriptionPlansRepository]);

    });

    group("initial state", () {
      SubscriptionPlansBloc subscriptionPlansBloc;

      setUp(() {
        subscriptionPlansBloc = SubscriptionPlansBloc(
            gymBloc: mockGymBloc,
            subscriptionPlansRepository: mockSubscriptionPlansRepository);
      });

      test('is SubscriptionPlansInitial', () {
        expect(subscriptionPlansBloc.state, SubscriptionPlansInitial());
      });

      tearDown(() {
        subscriptionPlansBloc?.close();
      });
    });

    group("on SubscriptionPlansUpdated event", () {
      setUp((){
        whenListen(mockGymBloc, Stream.fromIterable([GymLoaded(gym: fakeGym)]));
      });

      group("when there are plans", (){
        List<SubscriptionPlan> testPlans = [
          SubscriptionPlan.simpleSubscription(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 1)
        ];

        setUp((){
          when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
              .thenAnswer((_) {
            return Stream<List<SubscriptionPlan>>.fromFuture(
                Future.value(testPlans));
          });
        });

        tearDown((){
          verify(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id));
        });

        blocTest("should emit SubscriptionPlansLoaded",
            build: () => SubscriptionPlansBloc(
                gymBloc: mockGymBloc,
                subscriptionPlansRepository: mockSubscriptionPlansRepository),
            expect: [SubscriptionPlansLoaded(
                subscriptionPlans: testPlans)]);
      });

      group("when there are unsorted plans", (){
        List<SubscriptionPlan> testPlans = [
          SubscriptionPlan.simpleSubscription(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 2),
          SubscriptionPlan.simpleSubscription(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 1)
        ];

        List<SubscriptionPlan> sortedTestPlans = [
          SubscriptionPlan.simpleSubscription(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 1),
          SubscriptionPlan.simpleSubscription(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 2),
        ];

        setUp((){
          when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
              .thenAnswer((_) {
            return Stream<List<SubscriptionPlan>>.value(testPlans);
          });
        });

        tearDown((){
          verify(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id));
        });

        blocTest("should emit SubscriptionPlansLoaded with plans sorted by price (asc)",
            build: () => SubscriptionPlansBloc(
                gymBloc: mockGymBloc,
                subscriptionPlansRepository: mockSubscriptionPlansRepository),
            expect: [SubscriptionPlansLoaded(
                subscriptionPlans: sortedTestPlans)]);
      });

      group("when there are NO plans", () {
        setUp(() {
          when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
              .thenAnswer((_) => Stream.empty());
        });

        blocTest("should emit SubscriptionPlansEmpty with empty plans",
            build: () => SubscriptionPlansBloc(
                gymBloc: mockGymBloc,
                subscriptionPlansRepository: mockSubscriptionPlansRepository),
            act: (bloc) => bloc.add(SubscriptionPlansUpdated(
                subscriptionPlans: [])),
            expect: [SubscriptionPlansEmpty()]);
      });
    });


  });
}

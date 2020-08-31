import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/subscription_plans/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/repositories/subscription_plans_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockSubscriptionPlansRepository extends Mock
    implements SubscriptionPlansRepository {}

class MockGymBloc extends Mock implements GymBloc {}

void main() {
  group("SubscriptionPlansBloc", () {
    SubscriptionPlansBloc subscriptionPlansBloc;
    MockSubscriptionPlansRepository mockSubscriptionPlansRepository;
    Gym fakeGym = Gym(
        id: "some_id",
        host: "tha_host",
        paymentAppDomain: "test.com",
        stripePublicKey: "pk_kp");
    MockGymBloc mockGymBloc;

    setUp(() {
      mockGymBloc = MockGymBloc();
      whenListen(mockGymBloc, Stream.fromIterable([GymLoaded(gym: fakeGym)]));
    });

    group("initial state", () {
      test("initial state is SubscriptionPlansInitial", () {
        mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
        when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
            .thenAnswer((_) => Stream.value([]));
        subscriptionPlansBloc = SubscriptionPlansBloc(
            gymBloc: mockGymBloc,
            subscriptionPlansRepository: mockSubscriptionPlansRepository);
        expect(subscriptionPlansBloc.initialState, SubscriptionPlansInitial());
      });
    });

    group("SubscriptionPlansUpdated", () {
      test(
          "should emits SubscriptionPlansLoaded and passing the available plans",
          () {
        List<SubscriptionPlan> testPlans = [
          SubscriptionPlan.simpleSubscription(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 1)
        ];

        mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
        when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
            .thenAnswer((_) => Stream.empty());
        subscriptionPlansBloc = SubscriptionPlansBloc(
            gymBloc: mockGymBloc,
            subscriptionPlansRepository: mockSubscriptionPlansRepository);
        subscriptionPlansBloc.add(SubscriptionPlansUpdated(
            subscriptionPlans: testPlans));

        final expectedState = [
          SubscriptionPlansInitial(),
          SubscriptionPlansLoaded(
              subscriptionPlans: testPlans),
          emitsDone
        ];

        expectLater(
          subscriptionPlansBloc,
          emitsInOrder(expectedState),
        );
        subscriptionPlansBloc.close();
      });

      test("should emits SubscriptionPlansLoaded when fetched by repository",
          () {
        List<SubscriptionPlan> testPlans = [
          SubscriptionPlan.simpleSubscription(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 1)
        ];

        mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
        when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
            .thenAnswer((_) {
          return Stream<List<SubscriptionPlan>>.fromFuture(
              Future.value(testPlans));
        });

        subscriptionPlansBloc = SubscriptionPlansBloc(
            gymBloc: mockGymBloc,
            subscriptionPlansRepository: mockSubscriptionPlansRepository);

        final expectedState = [
          SubscriptionPlansInitial(),
          SubscriptionPlansLoaded(
              subscriptionPlans: testPlans),
        ];

        expectLater(
          subscriptionPlansBloc,
          emitsInOrder(expectedState),
        );
      });

      test(
          "should emits SubscriptionPlansLoaded with plans sorted by price (asc)",
          () {
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

        mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
        when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
            .thenAnswer((_) {
          return Stream<List<SubscriptionPlan>>.value(testPlans);
        });

        subscriptionPlansBloc = SubscriptionPlansBloc(
            gymBloc: mockGymBloc,
            subscriptionPlansRepository: mockSubscriptionPlansRepository);

        final expectedState = [
          SubscriptionPlansInitial(),
          SubscriptionPlansLoaded(
              subscriptionPlans: sortedTestPlans),
        ];

        expectLater(
          subscriptionPlansBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("SubscriptionPlansEmpty", () {
      setUp(() {
        mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
        when(mockSubscriptionPlansRepository.getPlans(gymId: fakeGym.id))
            .thenAnswer((_) => Stream.empty());
        subscriptionPlansBloc = SubscriptionPlansBloc(
            gymBloc: mockGymBloc,
            subscriptionPlansRepository: mockSubscriptionPlansRepository);
      });
      test("should emits SubscriptionPlansEmpty with empty plans", () {
        subscriptionPlansBloc.add(SubscriptionPlansUpdated(
            subscriptionPlans: []));
        final expectedState = [
          SubscriptionPlansInitial(),
          SubscriptionPlansEmpty(),
          emitsDone
        ];

        expectLater(
          subscriptionPlansBloc,
          emitsInOrder(expectedState),
        );

        subscriptionPlansBloc.close();
      });
    });
  });
}

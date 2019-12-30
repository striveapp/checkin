import 'dart:io';

import 'package:checkin/src/blocs/subscription_plans/bloc.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/resources/subscription_plans_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockSubscriptionPlansRepository extends Mock
    implements SubscriptionPlansRepository {}

void main() {
  group("SubscriptionPlansBloc", () {
    SubscriptionPlansBloc subscriptionPlansBloc;
    MockSubscriptionPlansRepository mockSubscriptionPlansRepository;

    group("initial state", () {
      test("initial state is SubscriptionPlansInitial", () {
        mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
        when(mockSubscriptionPlansRepository.getPlans())
            .thenAnswer((_) => Stream.value([]));
        subscriptionPlansBloc = SubscriptionPlansBloc(
            subscriptionPlansRepository: mockSubscriptionPlansRepository);
        expect(subscriptionPlansBloc.initialState, SubscriptionPlansInitial());
      });
    });

    group("SubscriptionPlansUpdated", () {
      test(
          "should emits SubscriptionPlansLoaded and passing the available plans",
          () {
        List<SubscriptionPlan> testPlans = [
          SubscriptionPlan(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 1)
        ];

        mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
        when(mockSubscriptionPlansRepository.getPlans())
            .thenAnswer((_) => Stream.empty());
        subscriptionPlansBloc = SubscriptionPlansBloc(subscriptionPlansRepository: mockSubscriptionPlansRepository);
        subscriptionPlansBloc.add(SubscriptionPlansUpdated(subscriptionPlans: testPlans));

        final expectedState = [
          SubscriptionPlansInitial(),
          SubscriptionPlansLoaded(subscriptionPlans: testPlans),
          emitsDone
        ];

        expectLater(
          subscriptionPlansBloc,
          emitsInOrder(expectedState),
        );
        subscriptionPlansBloc.close();
      });

      test("should emits SubscriptionPlansLoaded when fetched by repository", () {
        List<SubscriptionPlan> testPlans = [
          SubscriptionPlan(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 1)
        ];

        mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
        when(mockSubscriptionPlansRepository.getPlans()).thenAnswer((_) {
          return Stream<List<SubscriptionPlan>>.fromFuture(Future.value(testPlans));
        });

        subscriptionPlansBloc = SubscriptionPlansBloc(subscriptionPlansRepository: mockSubscriptionPlansRepository);

        final expectedState = [
          SubscriptionPlansInitial(),
          SubscriptionPlansLoaded(subscriptionPlans: testPlans),
        ];

        expectLater(
          subscriptionPlansBloc,
          emitsInOrder(expectedState),
        );
//        TODO: how to fucking test this sheet
//        subscriptionPlansBloc.close();

      });

      test("should emits SubscriptionPlansLoaded with plans sorted by price (desc)", () {
        List<SubscriptionPlan> testPlans = [
          SubscriptionPlan(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 1),
          SubscriptionPlan(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 2)
        ];

        List<SubscriptionPlan> sortedTestPlans = [
          SubscriptionPlan(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 2),
          SubscriptionPlan(
              name: "test1",
              interval: "int1",
              currency: "EUR",
              code: "plan1",
              price: 1),
        ];

        mockSubscriptionPlansRepository = MockSubscriptionPlansRepository();
        when(mockSubscriptionPlansRepository.getPlans()).thenAnswer((_) {
          return Stream<List<SubscriptionPlan>>.value(testPlans);
        });

        subscriptionPlansBloc = SubscriptionPlansBloc(subscriptionPlansRepository: mockSubscriptionPlansRepository);

        final expectedState = [
          SubscriptionPlansInitial(),
          SubscriptionPlansLoaded(subscriptionPlans: sortedTestPlans),
        ];

        expectLater(
          subscriptionPlansBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("SubscriptionPlansEmpty", () {
      setUp(() {
        subscriptionPlansBloc = SubscriptionPlansBloc();
      });
      test("should emits SubscriptionPlansEmpty with empty plans", () {
        subscriptionPlansBloc
            .add(SubscriptionPlansUpdated(subscriptionPlans: []));
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

      test("should emits SubscriptionPlansEmpty with null plans", () {
        subscriptionPlansBloc
            .add(SubscriptionPlansUpdated(subscriptionPlans: null));
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

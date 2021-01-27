import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/subscription/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockMembershipApi extends Mock implements MembershipApi {}

class GymBlocMock extends Mock implements GymBloc {}

void main() {
  group("SubscriptionBloc", () {
    MockMembershipApi mockMembershipApi;
    MockAnalyticsRepository mockAnalyticsRepository;
    GymBloc mockGymBloc;

    setUp(() {
      mockAnalyticsRepository = MockAnalyticsRepository();
      mockMembershipApi = MockMembershipApi();
      mockGymBloc = GymBlocMock();

      configureThrowOnMissingStub([mockAnalyticsRepository, mockMembershipApi]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions(
          [mockAnalyticsRepository, mockMembershipApi]);
    });

    group("initial state", () {
      SubscriptionBloc subscriptionBloc;

      setUp(() {
        subscriptionBloc = SubscriptionBloc(
          gymBloc: mockGymBloc,
          membershipApi: mockMembershipApi,
          analyticsRepository: mockAnalyticsRepository,
        );
      });

      test('is SubscriptionInitial', () {
        expect(subscriptionBloc.state, SubscriptionInitial());
      });

      tearDown(() {
        subscriptionBloc?.close();
      });
    });

    group("on Subscribe event", () {
      setUp(() {
        whenListen(
            mockGymBloc,
            Stream.fromIterable([
              GymLoaded(
                  gym: Gym(
                      id: "fake-gym",
                      name: "Test gym",
                      paymentAppDomain: "test-domain",
                      stripePublicKey: "test-key",
                      hasActivePayments: false,
                    imageUrl: "cool-gyms-have-cooler-images",
                  ))
            ]));
      });

      group("when api call is successful", () {
        setUp(() {
          when(mockMembershipApi.createSubscription(
                  gymId: "fake-gym",
                  priceId: "fake-price",
                  customerId: "fake-customer"))
              .thenAnswer((_) => Future.value(null));
        });

        tearDown(() {
          verify(mockMembershipApi.createSubscription(
              gymId: "fake-gym",
              priceId: "fake-price",
              customerId: "fake-customer"));
        });

        blocTest(
          "should emit SubscriptionLoading and SubscriptionSuccess",
          build: () => SubscriptionBloc(
            gymBloc: mockGymBloc,
            membershipApi: mockMembershipApi,
            analyticsRepository: mockAnalyticsRepository,
          ),
          act: (bloc) => bloc.add(
              Subscribe(priceId: "fake-price", customerId: "fake-customer")),
          expect: [
            SubscriptionLoading(),
            SubscriptionSuccess(),
          ],
        );
      });

      group("when api call blows up", () {
        setUp(() {
          when(mockMembershipApi.createSubscription(
                  gymId: "fake-gym",
                  priceId: "fake-price",
                  customerId: "fake-customer"))
              .thenThrow("a little nice error");

          when(mockAnalyticsRepository.subscriptionError(
                  err: "a little nice error",
                  stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace')))
              .thenAnswer((_) => Future.value(null));
        });

        tearDown(() {
          verify(mockMembershipApi.createSubscription(
              gymId: "fake-gym",
              priceId: "fake-price",
              customerId: "fake-customer"));
          verify(mockAnalyticsRepository.subscriptionError(
              err: "a little nice error",
              stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace')));
        });

        blocTest(
          "should emit SubscriptionLoading and SubscriptionError",
          build: () => SubscriptionBloc(
            gymBloc: mockGymBloc,
            membershipApi: mockMembershipApi,
            analyticsRepository: mockAnalyticsRepository,
          ),
          act: (bloc) => bloc.add(
              Subscribe(priceId: "fake-price", customerId: "fake-customer")),
          expect: [
            SubscriptionLoading(),
            SubscriptionError(
                errorMessage:
                    "Something went wrong with subscription: [a little nice error]"),
          ],
        );
      });

      group("when there is no customerId", () {
        setUp(() {
          when(mockAnalyticsRepository.logSubscriptionWithEmptyCustomer(
                  priceId: "fake-price", gymId: "fake-gym"))
              .thenAnswer((realInvocation) => null);
        });

        tearDown(() {
          verify(mockAnalyticsRepository.logSubscriptionWithEmptyCustomer(
              priceId: "fake-price", gymId: "fake-gym"));
        });

        blocTest(
          "should emit SubscriptionLoading and SubscriptionError",
          build: () => SubscriptionBloc(
            gymBloc: mockGymBloc,
            membershipApi: mockMembershipApi,
            analyticsRepository: mockAnalyticsRepository,
          ),
          act: (bloc) =>
              bloc.add(Subscribe(priceId: "fake-price", customerId: "null")),
          expect: [
            SubscriptionLoading(),
            SubscriptionError(
                errorMessage: "You must first activate your bank account"),
          ],
        );
      });
    });
  });
}

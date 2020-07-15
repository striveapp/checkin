import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/subscription/bloc.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockMembershipApi extends Mock implements MembershipApi {}

void main() {
  group("SubscriptionBloc", () {
    SubscriptionBloc subscriptionBloc;
    MembershipApi mockMembershipApi;
    AnalyticsRepository mockAnalyticsRepository;

    setUp(() {
      mockAnalyticsRepository = MockAnalyticsRepository();
      mockMembershipApi = MockMembershipApi();

      subscriptionBloc = SubscriptionBloc(
        membershipApi: mockMembershipApi,
        analyticsRepository: mockAnalyticsRepository,
      );
    });

    tearDown(() {
      subscriptionBloc?.close();
    });

    test('initial state is LoginUninitialized', () {
      expect(subscriptionBloc.initialState, SubscriptionInitial());
    });

    group("Subscribe", () {
      setUp(() {

      });

      test(
          "should emit SubscriptionLoading and SubscriptionSuccess when api call is successful", () async {
        subscriptionBloc.add(Subscribe(gymId: "fake-gym",
            priceId: "fake-price",
            customerId: "fake-customer"));
        when(mockMembershipApi.createSubscription(gymId: "fake-gym",
            priceId: "fake-price",
            customerId: "fake-customer"))
            .thenAnswer((_) => Future.value(null));

        final expectedState = [
          SubscriptionInitial(),
          SubscriptionLoading(),
          SubscriptionSuccess()
        ];

        await expectLater(
          subscriptionBloc,
          emitsInOrder(expectedState),
        );

        verify(mockMembershipApi.createSubscription(gymId: "fake-gym",
            priceId: "fake-price",
            customerId: "fake-customer"));
      });

      test(
          "should emit SubscriptionLoading and SubscriptionError when api call blows up", () async {
        subscriptionBloc.add(Subscribe(gymId: "fake-gym",
            priceId: "fake-price",
            customerId: "fake-customer"));
        when(mockMembershipApi.createSubscription(gymId: "fake-gym",
            priceId: "fake-price",
            customerId: "fake-customer"))
            .thenThrow("a little nice error");

        when(mockAnalyticsRepository.subscriptionError(
            err: "a little nice error",
            stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace')))
            .thenAnswer((_) => Future.value(null));

        final expectedState = [
          SubscriptionInitial(),
          SubscriptionLoading(),
          SubscriptionError(
              errorMessage: "Something went wrong with subscription: [a little nice error]")
        ];

        await expectLater(
          subscriptionBloc,
          emitsInOrder(expectedState),
        );

        verify(mockMembershipApi.createSubscription(gymId: "fake-gym",
            priceId: "fake-price",
            customerId: "fake-customer"));
        verify(mockAnalyticsRepository.subscriptionError(
            err: "a little nice error",
            stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace')));
      });

      test(
          "should emit SubscriptionLoading and SubscriptionError when there is no customerId", () async {
        subscriptionBloc.add(Subscribe(gymId: "fake-gym",
            priceId: "fake-price",
            customerId: "null"));

        when(mockAnalyticsRepository.logSubscriptionWithEmptyCustomer(priceId: "fake-price", gymId:"fake-gym"));

        final expectedState = [
          SubscriptionInitial(),
          SubscriptionLoading(),
          SubscriptionError(
              errorMessage: "You must first activate your bank account")
        ];

        await expectLater(
          subscriptionBloc,
          emitsInOrder(expectedState),
        );

        verifyNever(mockMembershipApi.createSubscription(gymId: "fake-gym",
            priceId: "fake-price",
            customerId: "null"));
        verify(mockAnalyticsRepository.logSubscriptionWithEmptyCustomer(priceId: "fake-price", gymId:"fake-gym"));
      });
    });
  });
}

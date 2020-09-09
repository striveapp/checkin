import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/api.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/resources/membership_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockMembershipRepository extends Mock implements MembershipProvider {}

class MockMembershipApi extends Mock implements MembershipApi {}

class MockUserBloc extends Mock implements UserBloc {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  MockMembershipRepository mockMembershipRepository =
      MockMembershipRepository();
  MockMembershipApi mockMembershipApi = MockMembershipApi();
  MockUserBloc mockUserBloc = MockUserBloc();
  MembershipBloc membershipBloc;
  AnalyticsRepository mockAnalyticsRepository = MockAnalyticsRepository();

  String fakeEmail = "test@test.com";
  String fakeGymId = "testGym";
  User fakeUser = User(
    email: fakeEmail,
    name: "Test",
    imageUrl: "test",
    selectedGymId: fakeGymId,
  );

  group("MembershipBloc", () {
    group("MembershipUpdated", () {
      group("when there are no active membership", () {
        Membership inactiveMembership =
            Membership(status: "inactive", customerId: "cus_123");
        setUp(() {
          whenListen(mockUserBloc,
              Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
          when(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          )).thenAnswer((realInvocation) => Stream.value(inactiveMembership));
          membershipBloc = MembershipBloc(
            analyticsRepository: mockAnalyticsRepository,
            userBloc: mockUserBloc,
            membershipRepository: mockMembershipRepository,
            membershipApi: mockMembershipApi,
          );
        });

        tearDown(() {
          membershipBloc.close();
        });

        test("should emit MembershipInactive", () async {
          final expectedState = [
            InitialMembershipState(),
            MembershipInactive(
                customerId: "cus_123", customerEmail: fakeUser.email),
          ];

          await expectLater(
            membershipBloc,
            emitsInOrder(expectedState),
          );
          logInvocations([mockMembershipRepository]);

          verify(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          ));
        });
      });

      group("when there is an active membership", () {
        Membership activeMembership =
            Membership(status: "active", customerId: "cus_123");
        setUp(() {
          whenListen(mockUserBloc,
              Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
          when(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          )).thenAnswer((realInvocation) => Stream.value(activeMembership));
          membershipBloc = MembershipBloc(
            analyticsRepository: mockAnalyticsRepository,
            userBloc: mockUserBloc,
            membershipRepository: mockMembershipRepository,
            membershipApi: mockMembershipApi,
          );
        });

        tearDown(() {
          membershipBloc.close();
        });

        test("should emit MembershipActive", () async {
          final expectedState = [
            InitialMembershipState(),
            MembershipActive(
              membership: activeMembership,
            ),
          ];

          await expectLater(
            membershipBloc,
            emitsInOrder(expectedState),
          );
          logInvocations([mockMembershipRepository]);

          verify(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          ));
        });
      });
    });
    group("Unsubscribe", () {
      Membership activeMembership =
          Membership(status: "active", customerId: "cus_123");
      setUp(() {
        whenListen(mockUserBloc,
            Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
        when(mockMembershipRepository.getMembership(
          gymId: fakeUser.selectedGymId,
          email: fakeEmail,
        )).thenAnswer((realInvocation) => Stream.value(activeMembership));
        membershipBloc = MembershipBloc(
          analyticsRepository: mockAnalyticsRepository,
          userBloc: mockUserBloc,
          membershipRepository: mockMembershipRepository,
          membershipApi: mockMembershipApi,
        );
      });

      tearDown(() {
        membershipBloc.close();
      });

      test("should unsubscribe the customer", () async {
        when(mockMembershipApi.unsubscribe(
          gymId: fakeUser.selectedGymId,
        )).thenAnswer((_) => null);

        final expectedState = [
          InitialMembershipState(),
          MembershipActive(membership: activeMembership),
          MembershipLoading(),
        ];

        membershipBloc.add(Unsubscribe());

        await expectLater(
          membershipBloc,
          emitsInAnyOrder(expectedState),
        );
        logInvocations([mockMembershipRepository, mockMembershipApi]);

        verify(mockMembershipRepository.getMembership(
          gymId: fakeUser.selectedGymId,
          email: fakeEmail,
        ));
        verify(mockMembershipApi.unsubscribe(
          gymId: fakeUser.selectedGymId,
        ));
      });

      test("should emit MembershipError and fail when an ApiException is thrown", () async {
        ApiException apiError = ApiException("kaboom!", "the_end_of_the_fuckin_world");
        when(mockMembershipApi.unsubscribe(
          gymId: fakeUser.selectedGymId,
        )).thenThrow(apiError);

        when(mockAnalyticsRepository.logUnsubscribe()).thenAnswer((realInvocation) =>  Future.value(null));

        final expectedState = [
          InitialMembershipState(),
          MembershipActive(membership: activeMembership),
          MembershipLoading(),
          MembershipError(errorMessage: "kaboom!"),
        ];

        membershipBloc.add(Unsubscribe());

        await expectLater(
          membershipBloc,
          emitsInAnyOrder(expectedState),
        );

        logInvocations([mockMembershipRepository, mockMembershipApi]);

        verify(mockMembershipRepository.getMembership(
          gymId: fakeUser.selectedGymId,
          email: fakeEmail,
        ));
        verify(mockMembershipApi.unsubscribe(
          gymId: fakeUser.selectedGymId,
        ));

        verify(mockAnalyticsRepository.logUnsubscribe());

      });
      test("should emit MembershipError and fail when a general Exception is thrown", () async {
        when(mockMembershipApi.unsubscribe(
          gymId: fakeUser.selectedGymId,
        )).thenThrow("a bad little error");

        when(mockAnalyticsRepository.subscriptionError(err: "a bad little error", stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace') ))
            .thenAnswer((_) => Future.value(null));

        final expectedState = [
          InitialMembershipState(),
          MembershipActive(membership: activeMembership),
          MembershipLoading(),
          MembershipError(errorMessage: "Something went wrong while with unsubscribe: [a bad little error]"),
        ];

        membershipBloc.add(Unsubscribe());

        await expectLater(
          membershipBloc,
          emitsInAnyOrder(expectedState),
        );

        logInvocations([mockMembershipRepository, mockMembershipApi]);

        verify(mockMembershipRepository.getMembership(
          gymId: fakeUser.selectedGymId,
          email: fakeEmail,
        ));
        verify(mockMembershipApi.unsubscribe(
          gymId: fakeUser.selectedGymId,
        ));

        verify(mockAnalyticsRepository.unsubscribeError(err: "a bad little error", stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace') ));
      });
    });

  });
}

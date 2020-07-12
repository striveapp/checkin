import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/membership_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockMembershipRepository extends Mock implements MembershipProvider {}

class MockMembershipApi extends Mock implements MembershipApi {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  MockMembershipRepository mockMembershipRepository =
      MockMembershipRepository();
  MockMembershipApi mockMembershipApi = MockMembershipApi();
  MockUserBloc mockUserBloc = MockUserBloc();
  MembershipBloc membershipBloc;

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
        when(mockMembershipApi.unsubscribe(
          gymId: fakeUser.selectedGymId,
        )).thenAnswer((realInvocation) => null);
        membershipBloc = MembershipBloc(
          userBloc: mockUserBloc,
          membershipRepository: mockMembershipRepository,
          membershipApi: mockMembershipApi,
        );
        membershipBloc.add(Unsubscribe());
      });

      tearDown(() {
        membershipBloc.close();
      });

      test("should unsubscribe the customer", () async {
        final expectedState = [
          InitialMembershipState(),
          MembershipActive(membership: activeMembership),
          MembershipLoading(),
        ];

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
    });
//    group("Subscribe", () {
//      Membership inactiveMembership =
//          Membership(status: "inactive", customerId: "cus_123");
//      setUp(() {
//        whenListen(mockUserBloc,
//            Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
//        when(mockMembershipRepository.getMembership(
//          gymId: fakeUser.selectedGymId,
//          email: fakeEmail,
//        )).thenAnswer((realInvocation) => Stream.value(inactiveMembership));
//        when(mockMembershipApi.unsubscribe(
//          gymId: fakeUser.selectedGymId,
//        )).thenAnswer((realInvocation) => null);
//        membershipBloc = MembershipBloc(
//          userBloc: mockUserBloc,
//          membershipRepository: mockMembershipRepository,
//          membershipApi: mockMembershipApi,
//        );
//        membershipBloc
//            .add(Subscribe(priceId: "price_123", customerId: "cus_123"));
//      });
//
//      tearDown(() {
//        membershipBloc.close();
//      });
//
//      test("should subscribe the customer", () async {
//        final expectedState = [
//          InitialMembershipState(),
//          MembershipLoading(),
//        ];
//
//        await expectLater(
//          membershipBloc,
//          emitsInAnyOrder(expectedState),
//        );
//        logInvocations([mockMembershipRepository, mockMembershipApi]);
//
//        verify(mockMembershipRepository.getMembership(
//          gymId: fakeUser.selectedGymId,
//          email: fakeEmail,
//        ));
//        verify(mockMembershipApi.createSubscription(
//            gymId: fakeUser.selectedGymId,
//            priceId: "price_123",
//            customerId: "cus_123"));
//      });
//    });
  });
}

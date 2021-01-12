import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/api.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/resources/membership_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockMembershipRepository extends Mock implements MembershipProvider {}

class MockMembershipApi extends Mock implements MembershipApi {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  String fakeEmail = "test@test.com";
  String fakeGymId = "testGym";
  User fakeUser = User(
    email: fakeEmail,
    name: "Test",
    imageUrl: "test",
    selectedGymId: fakeGymId,
  );

  group("MembershipBloc", () {
    MockMembershipRepository mockMembershipRepository;
    MockMembershipApi mockMembershipApi;
    MockAnalyticsRepository mockAnalyticsRepository;

    setUp(() {
      mockMembershipRepository = MockMembershipRepository();
      mockMembershipApi = MockMembershipApi();
      mockAnalyticsRepository = MockAnalyticsRepository();
      configureThrowOnMissingStub([
        mockMembershipRepository,
        mockMembershipApi,
        mockAnalyticsRepository
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockMembershipRepository,
        mockMembershipApi,
        mockAnalyticsRepository
      ]);
    });

    group("initial state", () {
      MembershipBloc membershipBloc;
      setUp(() {
        when(mockMembershipRepository.getMembership(
                email: fakeEmail, gymId: fakeGymId))
            .thenAnswer((_) => Stream.empty());

        membershipBloc = MembershipBloc(
          membershipRepository: mockMembershipRepository,
          membershipApi: mockMembershipApi,
          analyticsRepository: mockAnalyticsRepository,
          userEmail: fakeUser.email,
          selectedGymId: fakeUser.selectedGymId,
        );
      });

      tearDown(() {
        verify(mockMembershipRepository.getMembership(
            email: fakeEmail, gymId: fakeGymId));
      });

      test("is InitialMembershipState", () {
        expect(membershipBloc.state, InitialMembershipState());
      });

      tearDown(() {
        membershipBloc?.close();
      });
    });

    group("on MembershipUpdated event", () {
      group("when there is an inactive membership", () {
        Membership inactiveMembership = Membership(
            status: Membership.INACTIVE_MEMBERSHIP, customerId: "cus_123");

        setUp(() {
          when(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          )).thenAnswer((realInvocation) => Stream.value(inactiveMembership));
        });

        tearDown(() {
          verify(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          ));
        });

        blocTest("should emit MembershipInactive",
            build: () => MembershipBloc(
                  membershipRepository: mockMembershipRepository,
                  membershipApi: mockMembershipApi,
                  analyticsRepository: mockAnalyticsRepository,
                  userEmail: fakeUser.email,
                  selectedGymId: fakeUser.selectedGymId,
                ),
            expect: [
              MembershipInactive(
                customerId: "cus_123",
                customerEmail: fakeUser.email,
              ),
            ]);
      });
      group("when there is an active membership", () {
        Membership activeMembership = Membership(
            status: Membership.ACTIVE_MEMBERSHIP, customerId: "cus_123");
        setUp(() {
          when(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          )).thenAnswer((realInvocation) => Stream.value(activeMembership));
        });

        tearDown(() {
          verify(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          ));
        });

        blocTest("should emit MembershipActive",
            build: () => MembershipBloc(
                  membershipRepository: mockMembershipRepository,
                  membershipApi: mockMembershipApi,
                  analyticsRepository: mockAnalyticsRepository,
                  userEmail: fakeUser.email,
                  selectedGymId: fakeUser.selectedGymId,
                ),
            expect: [
              MembershipActive(
                membership: activeMembership,
              ),
            ]);
      });
    });

    group("on Unsubscribe event", () {
      group("when NO error occurred", () {
        setUp(() {
          when(mockMembershipRepository.getMembership(
                  email: fakeEmail, gymId: fakeGymId))
              .thenAnswer((_) => Stream.empty());
          when(mockAnalyticsRepository.logUnsubscribe())
              .thenAnswer((realInvocation) => null);
          when(mockMembershipApi.unsubscribe(
            gymId: fakeUser.selectedGymId,
          )).thenAnswer((_) => null);
        });

        tearDown(() {
          verify(mockMembershipRepository.getMembership(
              email: fakeEmail, gymId: fakeGymId));
          verify(mockAnalyticsRepository.logUnsubscribe());
          verify(mockMembershipApi.unsubscribe(
            gymId: fakeUser.selectedGymId,
          ));
        });

        blocTest("should unsubscribe the customer",
            build: () => MembershipBloc(
                  membershipRepository: mockMembershipRepository,
                  membershipApi: mockMembershipApi,
                  analyticsRepository: mockAnalyticsRepository,
                  userEmail: fakeUser.email,
                  selectedGymId: fakeUser.selectedGymId,
                ),
            act: (bloc) => bloc.add(Unsubscribe()),
            expect: [MembershipLoading()],
            verify: (bloc) async {
              await untilCalled(mockAnalyticsRepository.logUnsubscribe());
              await untilCalled(mockMembershipApi.unsubscribe(
                gymId: fakeUser.selectedGymId,
              ));
            });
      });

      group("when en error occurred", () {
        setUp(() {
          resetMocks([
            mockMembershipRepository,
            mockMembershipApi,
            mockAnalyticsRepository
          ]);
        });

        group("and the error is ApiException", () {
          ApiException apiError = ApiException(
            "kaboom!",
            "the_end_of_the_fuckin_world",
          );
          setUp(() {
            when(mockMembershipRepository.getMembership(
                    email: fakeEmail, gymId: fakeGymId))
                .thenAnswer((_) => Stream.empty());

            when(mockAnalyticsRepository.logUnsubscribe())
                .thenAnswer((realInvocation) => Future.value(null));
            when(mockMembershipApi.unsubscribe(
              gymId: fakeUser.selectedGymId,
            )).thenThrow(apiError);
          });

          tearDown(() {
            verify(mockMembershipRepository.getMembership(
                email: fakeEmail, gymId: fakeGymId));
            verify(mockAnalyticsRepository.logUnsubscribe());
            verify(mockMembershipApi.unsubscribe(
              gymId: fakeUser.selectedGymId,
            ));
          });

          blocTest("should emit MembershipError",
              build: () => MembershipBloc(
                    membershipRepository: mockMembershipRepository,
                    membershipApi: mockMembershipApi,
                    analyticsRepository: mockAnalyticsRepository,
                    userEmail: fakeUser.email,
                    selectedGymId: fakeUser.selectedGymId,
                  ),
              act: (bloc) => bloc.add(Unsubscribe()),
              expect: [
                MembershipLoading(),
                MembershipError(errorMessage: "kaboom!"),
              ],
              verify: (bloc) async {
                await untilCalled(mockAnalyticsRepository.logUnsubscribe());
                await untilCalled(mockMembershipApi.unsubscribe(
                  gymId: fakeUser.selectedGymId,
                ));
              });
        });

        group("and the error is NOT an ApiException", () {
          final errorMessage = "a bad little error";

          setUp(() {
            when(mockMembershipRepository.getMembership(
                    email: fakeEmail, gymId: fakeGymId))
                .thenAnswer((_) => Stream.empty());

            when(mockAnalyticsRepository.logUnsubscribe())
                .thenAnswer((realInvocation) => Future.value(null));

            when(mockMembershipApi.unsubscribe(
              gymId: fakeUser.selectedGymId,
            )).thenThrow(errorMessage);

            when(
              mockAnalyticsRepository.unsubscribeError(
                  err: errorMessage,
                  stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace')),
            ).thenAnswer((_) => Future.value(null));
          });

          tearDown(() {
            verify(mockMembershipRepository.getMembership(
                email: fakeEmail, gymId: fakeGymId));
            verify(mockAnalyticsRepository.logUnsubscribe());
            verify(mockMembershipApi.unsubscribe(
              gymId: fakeUser.selectedGymId,
            ));
            verify(
              mockAnalyticsRepository.unsubscribeError(
                  err: errorMessage,
                  stackTrace: argThat(isA<StackTrace>(), named: 'stackTrace')),
            );
          });

          blocTest("should emit MembershipError",
              build: () => MembershipBloc(
                    membershipRepository: mockMembershipRepository,
                    membershipApi: mockMembershipApi,
                    analyticsRepository: mockAnalyticsRepository,
                    userEmail: fakeUser.email,
                    selectedGymId: fakeUser.selectedGymId,
                  ),
              act: (bloc) => bloc.add(Unsubscribe()),
              expect: [
                MembershipLoading(),
                MembershipError(
                    errorMessage:
                        "Something went wrong while with unsubscribe: [$errorMessage]"),
              ],
              verify: (bloc) async {
                await untilCalled(mockAnalyticsRepository.logUnsubscribe());
                await untilCalled(mockMembershipApi.unsubscribe(
                  gymId: fakeUser.selectedGymId,
                ));
                await untilCalled(
                  mockAnalyticsRepository.unsubscribeError(
                    err: errorMessage,
                    stackTrace: argThat(
                      isA<StackTrace>(),
                      named: 'stackTrace',
                    ),
                  ),
                );
              });
        });
      });
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/sessions/sessions_bloc.dart';
import 'package:checkin/src/blocs/sessions/sessions_state.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'helper/mock_helper.dart';

class MockMembershipRepository extends Mock implements MembershipRepository {}

class MockStatsRepository extends Mock implements StatsRepository {}

void main() {
  group("SessionsBloc", () {
    MockMembershipRepository mockMembershipRepository;
    MockStatsRepository mockStatsRepository;

    String fakeEmail = "test@test.com";
    String fakeGymId = "testGym";
    User fakeUser = User(
      email: fakeEmail,
      name: "Test",
      imageUrl: "test",
      selectedGymId: fakeGymId,
    );

    setUp(() {
      mockMembershipRepository = MockMembershipRepository();
      mockStatsRepository = MockStatsRepository();
      configureThrowOnMissingStub([mockMembershipRepository, mockStatsRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockMembershipRepository, mockStatsRepository]);
    });

    // todo missing initial state test

    group("on SessionsUpdated event", () {
      group("when there is inactive membership", () {
        setUp(() {
          Membership inactiveMembership =
              Membership(status: Membership.INACTIVE_MEMBERSHIP, customerId: "cus_123");
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

        blocTest("should emit SessionsUnlimited",
            build: () => SessionsBloc(
                  userEmail: fakeEmail,
                  selectedGymId: fakeGymId,
                  statsRepository: mockStatsRepository,
                  membershipRepository: mockMembershipRepository,
                ),
            expect: () => [SessionsUnlimited()]);
      });

      group(
          "when there is inactive membership with totalLessonsOfPlan from a previous active membership",
          () {
        setUp(() {
          Membership inactiveMembership = Membership(
              status: Membership.INACTIVE_MEMBERSHIP, customerId: "cus_123", totalLessonsOfPlan: 3);

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

        blocTest("should emit SessionsUnlimited",
            build: () => SessionsBloc(
                  userEmail: fakeEmail,
                  selectedGymId: fakeGymId,
                  statsRepository: mockStatsRepository,
                  membershipRepository: mockMembershipRepository,
                ),
            expect: () => [SessionsUnlimited()]);
      });

      group("when there is an active membership with no sessions", () {
        setUp(() {
          Membership activeMembership =
              Membership(status: Membership.ACTIVE_MEMBERSHIP, customerId: "cus_123");

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

        blocTest("should emit SessionsUnlimited",
            build: () => SessionsBloc(
                  userEmail: fakeEmail,
                  selectedGymId: fakeGymId,
                  statsRepository: mockStatsRepository,
                  membershipRepository: mockMembershipRepository,
                ),
            expect: () => [SessionsUnlimited()]);
      });
    });

    group("SessionsUpdatedWithHistory", () {
      group("when there is an active membership with 3 sessions in the user's plan", () {
        setUp(() {
          Membership activeMembership = Membership(
              status: Membership.ACTIVE_MEMBERSHIP, customerId: "cus_123", totalLessonsOfPlan: 3);

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

        group("and the user did 1 lesson this month", () {
          setUp(() {
            var attendedOneLesson = [Lesson()];
            when(mockStatsRepository.getUserStats(
                    fakeUser.selectedGymId, fakeEmail, Timespan.month))
                .thenAnswer((realInvocation) => Stream.value(
                    UserHistory(email: fakeEmail, attendedLessons: attendedOneLesson)));
          });

          tearDown(() {
            verify(mockStatsRepository.getUserStats(
              fakeUser.selectedGymId,
              fakeEmail,
              Timespan.month,
            ));
          });

          blocTest("should emit SessionsLoaded",
              build: () => SessionsBloc(
                    userEmail: fakeEmail,
                    selectedGymId: fakeGymId,
                    statsRepository: mockStatsRepository,
                    membershipRepository: mockMembershipRepository,
                  ),
              expect: () => [SessionsLoaded(totalLessonsOfPlan: 3, attendedLessons: 1)]);
        });

        group("and the user did 3 lessons this month", () {
          setUp(() {
            var attendedOneLesson = [Lesson(), Lesson(), Lesson()];
            when(mockStatsRepository.getUserStats(
                    fakeUser.selectedGymId, fakeEmail, Timespan.month))
                .thenAnswer((realInvocation) => Stream.value(
                    UserHistory(email: fakeEmail, attendedLessons: attendedOneLesson)));
          });

          tearDown(() {
            verify(mockStatsRepository.getUserStats(
              fakeUser.selectedGymId,
              fakeEmail,
              Timespan.month,
            ));
          });

          blocTest("should emit SessionsWarning",
              build: () => SessionsBloc(
                    userEmail: fakeEmail,
                    selectedGymId: fakeGymId,
                    statsRepository: mockStatsRepository,
                    membershipRepository: mockMembershipRepository,
                  ),
              expect: () => [SessionsWarning(totalLessonsOfPlan: 3, attendedLessons: 3)]);
        });
      });
    });
  });
}

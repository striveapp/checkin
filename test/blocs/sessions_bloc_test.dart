import 'package:checkin/src/blocs/sessions/sessions_bloc.dart';
import 'package:checkin/src/blocs/sessions/sessions_state.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:checkin/src/constants.dart' as constants;

class MockMembershipRepository extends Mock implements MembershipRepository {}

class MockStatsRepository extends Mock implements StatsRepository {}

void main() {
  MockMembershipRepository mockMembershipRepository =
      MockMembershipRepository();
  MockStatsRepository mockStatsRepository = MockStatsRepository();
  SessionsBloc sessionsBloc;

  String fakeEmail = "test@test.com";
  String fakeGymId = "testGym";
  User fakeUser = User(
    email: fakeEmail,
    name: "Test",
    imageUrl: "test",
    selectedGymId: fakeGymId,
  );

  group("SessionsBloc", () {
    group("SessionsUpdated", () {
      group("when there is inactive membership", () {
        tearDown(() {
          sessionsBloc.close();
        });

        test("should emit SessionsUnlimited", () async {
          Membership inactiveMembership = Membership(
              status: Membership.INACTIVE_MEMBERSHIP, customerId: "cus_123");

          when(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          )).thenAnswer((realInvocation) => Stream.value(inactiveMembership));

          sessionsBloc = SessionsBloc(
            userEmail: fakeEmail,
            selectedGymId: fakeGymId,
            statsRepository: mockStatsRepository,
            membershipRepository: mockMembershipRepository,
          );

          final expectedState = [
            InitialSessionsState(),
            SessionsUnlimited(),
          ];

          await expectLater(
            sessionsBloc,
            emitsInOrder(expectedState),
          );
          logInvocations([mockMembershipRepository]);

          verify(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          ));
        });

        test("with totalLessonsOfPlan from previous membership should emit SessionUnlimited", () async {
          Membership inactiveMembership = Membership(
              status: Membership.INACTIVE_MEMBERSHIP, customerId: "cus_123", totalLessonsOfPlan: 3);

          when(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          )).thenAnswer((realInvocation) => Stream.value(inactiveMembership));

          sessionsBloc = SessionsBloc(
            userEmail: fakeEmail,
            selectedGymId: fakeGymId,
            statsRepository: mockStatsRepository,
            membershipRepository: mockMembershipRepository,
          );

          final expectedState = [
            InitialSessionsState(),
            SessionsUnlimited(),
          ];

          await expectLater(
            sessionsBloc,
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
        tearDown(() {
          sessionsBloc.close();
        });

        test("and there are no sessions should emit SessionsUnlimited",
            () async {
          Membership activeMembership = Membership(
              status: Membership.ACTIVE_MEMBERSHIP, customerId: "cus_123");

          when(mockMembershipRepository.getMembership(
            gymId: fakeUser.selectedGymId,
            email: fakeEmail,
          )).thenAnswer((realInvocation) => Stream.value(activeMembership));
          sessionsBloc = SessionsBloc(
            userEmail: fakeEmail,
            selectedGymId: fakeGymId,
            statsRepository: mockStatsRepository,
            membershipRepository: mockMembershipRepository,
          );

          final expectedState = [
            InitialSessionsState(),
            SessionsUnlimited(),
          ];

          await expectLater(
            sessionsBloc,
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
    group("SessionsUpdatedWithHistory", () {
      group("when there is an active membership", () {
        group("and there are 3 sessions in the user's plan", () {
          Membership activeMembership = Membership(
              status: Membership.ACTIVE_MEMBERSHIP,
              customerId: "cus_123",
              totalLessonsOfPlan: 3);

          test(
              "and the user did 1 lesson this month, it should emit SessionsLoaded()",
                  () async {
                var attendedOneLesson = [Lesson()];
                when(mockStatsRepository.getUserStats(
                    fakeUser.selectedGymId, fakeEmail, constants.MONTH))
                    .thenAnswer((realInvocation) => Stream.value(UserHistory(
                    email: fakeEmail, attendedLessons: attendedOneLesson)));

                when(mockMembershipRepository.getMembership(
                  gymId: fakeUser.selectedGymId,
                  email: fakeEmail,
                )).thenAnswer((realInvocation) => Stream.value(activeMembership));
                sessionsBloc = SessionsBloc(
                  userEmail: fakeEmail,
                  selectedGymId: fakeGymId,
                  statsRepository: mockStatsRepository,
                  membershipRepository: mockMembershipRepository,
                );

                final expectedState = [
                  InitialSessionsState(),
                  SessionsLoaded(totalLessonsOfPlan: 3, attendedLessons: 1),
                ];

                await expectLater(
                  sessionsBloc,
                  emitsInOrder(expectedState),
                );
                logInvocations([mockMembershipRepository]);

                verify(mockMembershipRepository.getMembership(
                  gymId: fakeUser.selectedGymId,
                  email: fakeEmail,
                ));
                verify(mockStatsRepository.getUserStats(
                  fakeUser.selectedGymId,
                  fakeEmail,
                  constants.MONTH,
                ));
              });

          test(
              "and the user did 3 lessons this month, it should emit SessionsWarning()",
                  () async {
                var attendedOneLesson = [Lesson(), Lesson(), Lesson()];
                when(mockStatsRepository.getUserStats(
                    fakeUser.selectedGymId, fakeEmail, constants.MONTH))
                    .thenAnswer((realInvocation) => Stream.value(UserHistory(
                    email: fakeEmail, attendedLessons: attendedOneLesson)));

                when(mockMembershipRepository.getMembership(
                  gymId: fakeUser.selectedGymId,
                  email: fakeEmail,
                )).thenAnswer((realInvocation) => Stream.value(activeMembership));
                sessionsBloc = SessionsBloc(
                  userEmail: fakeEmail,
                  selectedGymId: fakeGymId,
                  statsRepository: mockStatsRepository,
                  membershipRepository: mockMembershipRepository,
                );

                final expectedState = [
                  InitialSessionsState(),
                  SessionsWarning(totalLessonsOfPlan: 3, attendedLessons: 3),
                ];

                await expectLater(
                  sessionsBloc,
                  emitsInOrder(expectedState),
                );
                logInvocations([mockMembershipRepository]);

                verify(mockMembershipRepository.getMembership(
                  gymId: fakeUser.selectedGymId,
                  email: fakeEmail,
                ));
                verify(mockStatsRepository.getUserStats(
                  fakeUser.selectedGymId,
                  fakeEmail,
                  constants.MONTH,
                ));
              });
        });
      });
    });

  });
}

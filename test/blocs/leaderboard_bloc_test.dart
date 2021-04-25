import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockStatsRepository extends Mock implements StatsRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("LeaderboardBloc", () {
    MockStatsRepository mockStatsRepository;
    MockUserRepository mockUserRepository;

    User fakeUser = User(
      email: "test@test.com",
      name: "ThaTest",
      imageUrl: "tha_image",
      selectedGymId: "some fake gym",
    );

    setUp(() {
      mockStatsRepository = MockStatsRepository();
      mockUserRepository = MockUserRepository();

      configureThrowOnMissingStub([
        mockStatsRepository,
        mockUserRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockStatsRepository,
        mockUserRepository,
      ]);
    });

    group("on InitalizeLeaderboard", () {
      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.value(fakeUser));
        when(mockStatsRepository.getAllUserStats(fakeUser.selectedGymId, Timespan.year))
            .thenAnswer((_) => Stream.empty());
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
        verify(mockStatsRepository.getAllUserStats(fakeUser.selectedGymId, Timespan.year));
      });

      blocTest(
        "initialize the streams",
        build: () => LeaderboardBloc(
          statsRepository: mockStatsRepository,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(
          InitializeLeaderboard(),
        ),
        expect: () => [],
      );
    });

    group("on LeaderboardUpdated event", () {
      group("when 3 user histories are loaded", () {
        List<Lesson> attendedLessons = [
          Lesson(timeStart: "19:00", timeEnd: "20:00"),
          Lesson(timeStart: "10:00", timeEnd: "11:00"),
          Lesson(timeStart: "07:15", timeEnd: "08:30"),
        ];

        List<UserHistory> podium = [
          UserHistory(
            email: "test@test.com",
            attendedLessons: attendedLessons,
          ),
          UserHistory(
            email: "test-two@test.com",
            attendedLessons: attendedLessons,
          ),
          UserHistory(
            email: "test-three@test.com",
            attendedLessons: attendedLessons,
          ),
        ];

        blocTest(
          "emits LeaderboardLoaded with users",
          build: () => LeaderboardBloc(
            statsRepository: mockStatsRepository,
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(LeaderboardUpdated(usersHistory: podium)),
          expect: () => [
            LeaderboardLoaded(
              podium: podium,
              restOfTheUsers: [],
            )
          ],
        );
      });

      group("when loaded user histories are unsorted", () {
        List<Lesson> attendedLessons1 = [
          Lesson(timeStart: "19:00", timeEnd: "20:00"),
          Lesson(timeStart: "10:00", timeEnd: "11:00"),
          Lesson(timeStart: "07:15", timeEnd: "08:30"),
        ];

        List<Lesson> attendedLessons2 = [
          Lesson(timeStart: "19:00", timeEnd: "20:00"),
          Lesson(timeStart: "07:15", timeEnd: "08:30"),
          Lesson(timeStart: "10:00", timeEnd: "11:00"),
          Lesson(timeStart: "10:00", timeEnd: "11:00"),
        ];
        List<Lesson> attendedLessons3 = [
          Lesson(timeStart: "19:00", timeEnd: "20:00"),
        ];
        UserHistory userHistory1 =
            UserHistory(email: "test@test.com", attendedLessons: attendedLessons1);
        UserHistory userHistory2 =
            UserHistory(email: "test-two@test.com", attendedLessons: attendedLessons2);
        UserHistory userHistory3 =
            UserHistory(email: "test-two@test.com", attendedLessons: attendedLessons3);

        List<UserHistory> unsortedUsersHistory = [userHistory1, userHistory2, userHistory3];
        List<UserHistory> sortedUsersHistory = [userHistory2, userHistory1, userHistory3];

        blocTest(
          "should emit LeaderboardLoaded with sorted users by attendedLessons count [desc]",
          build: () => LeaderboardBloc(
            statsRepository: mockStatsRepository,
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(LeaderboardUpdated(usersHistory: unsortedUsersHistory)),
          expect: () => [
            LeaderboardLoaded(podium: sortedUsersHistory, restOfTheUsers: []),
          ],
        );
      });

      group("when more than 3 user histories are loaded", () {
        List<Lesson> attendedLessons = [
          Lesson(timeStart: "19:00", timeEnd: "20:00"),
          Lesson(timeStart: "10:00", timeEnd: "11:00"),
          Lesson(timeStart: "07:15", timeEnd: "08:30"),
        ];

        List<UserHistory> allUserHistories = [
          UserHistory(
            email: "test@test.com",
            attendedLessons: attendedLessons,
          ),
          UserHistory(
            email: "test-two@test.com",
            attendedLessons: attendedLessons,
          ),
          UserHistory(
            email: "test-three@test.com",
            attendedLessons: attendedLessons,
          ),
          UserHistory(
            email: "test-four@test.com",
            attendedLessons: attendedLessons,
          ),
        ];

        List<UserHistory> expectedPodium = [
          UserHistory(
            email: "test@test.com",
            attendedLessons: attendedLessons,
          ),
          UserHistory(
            email: "test-two@test.com",
            attendedLessons: attendedLessons,
          ),
          UserHistory(
            email: "test-three@test.com",
            attendedLessons: attendedLessons,
          ),
        ];

        List<UserHistory> restOfTheUsers = [
          UserHistory(
            email: "test-four@test.com",
            attendedLessons: attendedLessons,
          ),
        ];

        blocTest(
          "emits LeaderboardLoaded with users",
          build: () => LeaderboardBloc(
            statsRepository: mockStatsRepository,
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(LeaderboardUpdated(usersHistory: allUserHistories)),
          expect: () => [
            LeaderboardLoaded(
              podium: expectedPodium,
              restOfTheUsers: restOfTheUsers,
            )
          ],
        );
      });

      group("when less then 3 user histories are loaded", () {
        blocTest(
          "emits LeaderboardLoaded with users",
          build: () => LeaderboardBloc(
            statsRepository: mockStatsRepository,
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(LeaderboardUpdated(usersHistory: [])),
          expect: () => [
            LeaderboardLoaded(
              podium: [],
              restOfTheUsers: [],
              isAvailable: false,
            )
          ],
        );
      });
    });
  });
}

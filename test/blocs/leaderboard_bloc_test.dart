import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockStatsRepository extends Mock implements StatsRepository {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("LeaderboardBloc", () {
    MockStatsRepository mockStatsRepository;
    MockUserBloc mockUserBloc;

    User fakeUser = User(
      email: "test@test.com",
      name: "ThaTest",
      imageUrl: "tha_image",
      selectedGymId: "some fake gym",
    );

    setUp(() {
      mockStatsRepository = MockStatsRepository();
      mockUserBloc = MockUserBloc();
      configureThrowOnMissingStub([mockStatsRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockStatsRepository]);
    });

    // todo missing initial state test
    group("on LeaderboardUpdated event", () {
      setUp(() {
        reset(mockStatsRepository);
      });

      group("when 3 user histories are loaded", () {
        List<Lesson> attendedLessons = [
          Lesson(timeStart: "19:00", timeEnd: "20:00"),
          Lesson(timeStart: "10:00", timeEnd: "11:00"),
          Lesson(timeStart: "07:15", timeEnd: "08:30"),
        ];

        List<UserHistory> userHistories = [
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

        setUp(() {
          whenListen(mockUserBloc, Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
          when(mockStatsRepository.getAllUserStats(fakeUser.selectedGymId, Timespan.year))
              .thenAnswer((_) {
            return Stream<List<UserHistory>>.value(userHistories);
          });
        });

        tearDown(() {
          verify(mockStatsRepository.getAllUserStats(fakeUser.selectedGymId, Timespan.year));
        });

        blocTest(
          "should emit LeaderboardLoaded with users",
          build: () => LeaderboardBloc(
            userBloc: mockUserBloc,
            statsRepository: mockStatsRepository,
          ),
          expect: [LeaderboardLoaded(usersHistory: userHistories)],
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

        setUp(() {
          when(mockStatsRepository.getAllUserStats(fakeUser.selectedGymId, Timespan.week))
              .thenAnswer((_) {
            return Stream<List<UserHistory>>.value(unsortedUsersHistory);
          });
        });

        blocTest(
          "should emit LeaderboardLoaded with sorted users by attendedLessons count [desc]",
          build: () =>
              LeaderboardBloc(userBloc: mockUserBloc, statsRepository: mockStatsRepository),
          act: (bloc) => bloc.add(LeaderboardUpdated(usersHistory: unsortedUsersHistory)),
          expect: [
            LeaderboardLoaded(usersHistory: sortedUsersHistory),
          ],
        );
      });

      group("when only 1 user history is loaded", () {
        List<Lesson> attendedLessons = [
          Lesson(timeStart: "19:00", timeEnd: "20:00"),
          Lesson(timeStart: "10:00", timeEnd: "11:00"),
          Lesson(timeStart: "07:15", timeEnd: "08:30"),
        ];

        List<UserHistory> usersHistory = [
          UserHistory(
            email: "test@test.com",
            attendedLessons: attendedLessons,
          ),
        ];

        setUp(() {
          when(mockStatsRepository.getAllUserStats(fakeUser.selectedGymId, Timespan.week))
              .thenAnswer((_) {
            return Stream<List<UserHistory>>.value(usersHistory);
          });
        });

        blocTest(
          "should emit LeaderboardNotAvailable",
          build: () =>
              LeaderboardBloc(userBloc: mockUserBloc, statsRepository: mockStatsRepository),
          act: (bloc) => bloc.add(
            LeaderboardUpdated(usersHistory: usersHistory),
          ),
          expect: [LeaderboardNotAvailable()],
        );
      });
    });
  });
}

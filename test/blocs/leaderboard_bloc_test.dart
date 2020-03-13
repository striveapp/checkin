import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';


class MockStatsRepository extends Mock implements StatsRepository {}

void main() {
  group("LeaderboardBloc", () {
    LeaderboardBloc leaderboardBloc;
    MockStatsRepository mockStatsRepository;

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
      UserHistory(
        email: "test-two@test.com",
        attendedLessons: attendedLessons,
      ),
    ];

    tearDown(() {
      leaderboardBloc?.close();
    });

    group("LeaderboardUpdated", () {
      setUp(() {
        mockStatsRepository = MockStatsRepository();
        when(mockStatsRepository.getAllUserStats()).thenAnswer((_) {
          return Stream<List<UserHistory>>.value(usersHistory);
        });
        leaderboardBloc = LeaderboardBloc(statsRepository: mockStatsRepository);
      });
      test("should emit LeaderboardLoaded with users", () {

        final expectedState = [
          LeaderboardInitial(),
          LeaderboardLoaded(usersHistory: usersHistory),
        ];

        leaderboardBloc.add(LeaderboardUpdated(usersHistory: usersHistory));

        expectLater(
          leaderboardBloc,
          emitsInOrder(expectedState),
        );
      });

      group("when sorted", () {
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
        UserHistory userHistory1 = UserHistory(
            email: "test@test.com",
            attendedLessons: attendedLessons1
        );
        UserHistory userHistory2 = UserHistory(
            email: "test-two@test.com",
            attendedLessons: attendedLessons2
        );

        List<UserHistory> unsortedUsersHistory = [userHistory1, userHistory2];
        List<UserHistory> sortedUsersHistory = [userHistory2, userHistory1];

        setUp(() {
          mockStatsRepository = MockStatsRepository();
          when(mockStatsRepository.getAllUserStats()).thenAnswer((_) {
            return Stream<List<UserHistory>>.value(unsortedUsersHistory);
          });
          leaderboardBloc = LeaderboardBloc(statsRepository: mockStatsRepository);
        });

        test(
            'should emit LeaderboardLoaded with sorted users by attendedLessons count [desc]',
                () {
              leaderboardBloc.add(LeaderboardUpdated(usersHistory: unsortedUsersHistory));

              final expectedState = [
                LeaderboardInitial(),
                LeaderboardLoaded(usersHistory: sortedUsersHistory),
              ];

              expectLater(leaderboardBloc, emitsInOrder(expectedState));
            });

      });
    });
  });
}

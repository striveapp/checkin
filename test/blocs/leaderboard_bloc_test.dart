import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:test/test.dart';

void main() {
  group("LeaderboardBloc", () {
    LeaderboardBloc leaderboardBloc;

    setUp(() {});

    tearDown(() {
      leaderboardBloc?.close();
    });

    group("LeaderboardUpdated", () {
      setUp(() {
        leaderboardBloc = LeaderboardBloc();
      });
      test("should emit LeaderboardLoaded with users", () {
        List<Lesson> attendedLessons = [
          Lesson(timeStart: "19:00", timeEnd: "20:00"),
          Lesson(timeStart: "10:00", timeEnd: "11:00"),
          Lesson(timeStart: "07:15", timeEnd: "08:30"),
        ];

        List<UserWithHistory> users = [User(name: 'test', email: 'test@test.com', imageUrl: 'test.png').withHistory(UserHistory(attendedLessons: attendedLessons))];

        final expectedState = [
          LeaderboardInitial(),
          LeaderboardLoaded(users: users),
        ];

        leaderboardBloc.add(LeaderboardUpdated(users: users));

        expectLater(
          leaderboardBloc,
          emitsInOrder(expectedState),
        );
      });

      test('should emit LeaderboardLoaded with sorted users by attendedLessons count [desc]', () {
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
        UserWithHistory user1 = User(name: 'test', email: 'test@test.com', imageUrl: 'test.png').withHistory(UserHistory(attendedLessons: attendedLessons1));
        UserWithHistory user2 = User(name: 'test', email: 'test@test.com', imageUrl: 'test.png').withHistory(UserHistory(attendedLessons: attendedLessons2));

        List<UserWithHistory> unsortedUsers = [user1, user2];
        List<UserWithHistory> sortedUsers = [user2, user1];

        leaderboardBloc.add(LeaderboardUpdated(users: unsortedUsers));

        final expectedState = [
          LeaderboardInitial(),
          LeaderboardLoaded(users: sortedUsers),
        ];


        expectLater(leaderboardBloc, emitsInOrder(expectedState));
      });
    });
  });
}

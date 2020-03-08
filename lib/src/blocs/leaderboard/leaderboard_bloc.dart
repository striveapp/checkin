import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() {
    List<Lesson> attendedLessons1 = [
      Lesson(timeStart: "10:00", timeEnd: "11:00"),
      Lesson(timeStart: "07:15", timeEnd: "08:30"),
    ];
    List<Lesson> attendedLessons2 = [
      Lesson(timeStart: "19:00", timeEnd: "20:00"),
      Lesson(timeStart: "10:00", timeEnd: "11:00"),
      Lesson(timeStart: "07:15", timeEnd: "08:30"),
      Lesson(timeStart: "07:15", timeEnd: "08:30"),
      Lesson(timeStart: "07:15", timeEnd: "08:30"),
    ];
    List<Lesson> attendedLessons3 = [
      Lesson(timeStart: "19:00", timeEnd: "20:00"),
      Lesson(timeStart: "10:00", timeEnd: "11:00"),
      Lesson(timeStart: "07:15", timeEnd: "08:30"),
      Lesson(timeStart: "07:15", timeEnd: "08:30"),
    ];
    add(LeaderboardUpdated(users: [
      User(
              name: 'test',
              email: 'test@test.com',
              imageUrl:
                  'https://pbs.twimg.com/profile_images/855814907874246657/q89lwmsi_400x400.jpg')
          .withHistory(UserHistory(attendedLessons: attendedLessons1)),
      User(
              name: 'test',
              email: 'test@test.com',
              imageUrl:
                  'https://pbs.twimg.com/profile_images/855814907874246657/q89lwmsi_400x400.jpg')
          .withHistory(UserHistory(attendedLessons: attendedLessons2)),
      User(
              name: 'test',
              email: 'test@test.com',
              imageUrl:
                  'https://pbs.twimg.com/profile_images/855814907874246657/q89lwmsi_400x400.jpg')
          .withHistory(UserHistory(attendedLessons: attendedLessons3)),
      User(
              name: 'test',
              email: 'test@test.com',
              imageUrl:
                  'https://pbs.twimg.com/profile_images/855814907874246657/q89lwmsi_400x400.jpg')
          .withHistory(UserHistory(attendedLessons: attendedLessons1)),
    ]));
  }
  @override
  get initialState => LeaderboardInitial();

  @override
  Stream<LeaderboardState> mapEventToState(LeaderboardEvent event) async* {
    if (event is LeaderboardUpdated) {
      yield LeaderboardLoaded(users: _getSortedUsers(event.users));
    }
  }

  List<UserWithHistory> _getSortedUsers(List<UserWithHistory> users) {
    List<UserWithHistory> sortedUsers = [...users];

    sortedUsers.sort((UserWithHistory userA, UserWithHistory userB) => userB.history.attendedLessons.length - userA.history.attendedLessons.length);

    return sortedUsers;
  }
}

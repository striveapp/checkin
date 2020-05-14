import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_state.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockStatsRepository extends Mock implements StatsRepository {}

class MockStatsBloc extends Mock implements StatsBloc {}

void main() {
  group("UserStatsBloc", () {
    UserStatsBloc userStatsBloc;
    MockStatsBloc mockStatsBloc;
    MockStatsRepository mockStatsRepository;

    User loggedUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
      selectedGymId: "some fake gym"
    );

    List<Lesson> attendedLessons = [
      Lesson(timeStart: "19:00", timeEnd: "20:00"),
      Lesson(timeStart: "10:00", timeEnd: "11:00"),
      Lesson(timeStart: "07:15", timeEnd: "08:30"),
    ];

    setUp(() {
      mockStatsRepository = MockStatsRepository();
      mockStatsBloc = MockStatsBloc();
    });

    tearDown(() {
      userStatsBloc?.close();
    });

    group("per week", () {
      setUp(() {
        whenListen(mockStatsBloc,
            Stream.fromIterable([TimespanUpdated(timespan: WEEK)]));
        when(mockStatsRepository.getUserStats(
                loggedUser.selectedGymId, loggedUser.email, WEEK))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
              email: "test@test.com", attendedLessons: attendedLessons));
        });
        userStatsBloc = UserStatsBloc(
          statsRepository: mockStatsRepository,
          user: loggedUser,
          statsBloc: mockStatsBloc,
        );
      });

      test(
          "should emits UserStatsLoaded when StatsBloc add a TimespanUpdated event",
          () {
        final expectedState = [
          UserStatsUninitialized(),
          UserStatsLoaded(attendedLessons: attendedLessons, timespan: WEEK),
        ];

        expectLater(
          userStatsBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("per month", () {
      setUp(() {
        whenListen(mockStatsBloc,
            Stream.fromIterable([TimespanUpdated(timespan: MONTH)]));
        when(mockStatsRepository.getUserStats(
                loggedUser.selectedGymId, loggedUser.email, MONTH))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
              email: "test@test.com", attendedLessons: attendedLessons));
        });
        userStatsBloc = UserStatsBloc(
          statsRepository: mockStatsRepository,
          user: loggedUser,
          statsBloc: mockStatsBloc,
        );
      });

      test(
          "should emits StatsLoaded for week first and for month leter when the event is added",
          () {
        final expectedState = [
          UserStatsUninitialized(),
          UserStatsLoaded(attendedLessons: attendedLessons, timespan: MONTH),
        ];

        expectLater(
          userStatsBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("per year", () {
      setUp(() {
        whenListen(mockStatsBloc,
            Stream.fromIterable([TimespanUpdated(timespan: YEAR)]));
        when(mockStatsRepository.getUserStats(
                loggedUser.selectedGymId, loggedUser.email, YEAR))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
              email: "test@test.com", attendedLessons: attendedLessons));
        });
        userStatsBloc = UserStatsBloc(
          statsRepository: mockStatsRepository,
          user: loggedUser,
          statsBloc: mockStatsBloc,
        );
      });
      test(
          "should emits StatsLoaded for week first and for year leter when the event is added",
          () {
        final expectedState = [
          UserStatsUninitialized(),
          UserStatsLoaded(attendedLessons: attendedLessons, timespan: YEAR),
        ];

        expectLater(
          userStatsBloc,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}

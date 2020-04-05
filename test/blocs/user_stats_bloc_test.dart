import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_state.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockStatsRepository extends Mock implements StatsRepository {}

class MockStatsBloc extends Mock implements StatsBloc {}

class MockDateUtil extends Mock implements DateUtil {}

void main() {
  group("UserStatsBloc", () {
    UserStatsBloc userStatsBloc;
    MockStatsBloc mockStatsBloc;
    MockStatsRepository mockStatsRepository;
    MockDateUtil mockDateUtil;

    User loggedUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
    );

    List<Lesson> attendedLessons = [
      Lesson(timeStart: "19:00", timeEnd: "20:00"),
      Lesson(timeStart: "10:00", timeEnd: "11:00"),
      Lesson(timeStart: "07:15", timeEnd: "08:30"),
    ];

    DateTime fakeDateTime = DateTime(2020, 5, 4);

    setUp(() {
      mockStatsRepository = MockStatsRepository();
      mockStatsBloc = MockStatsBloc();
      mockDateUtil = MockDateUtil();
    });

    tearDown(() {
      userStatsBloc?.close();
    });

    group("per week", () {
      setUp(() {
        whenListen(mockStatsBloc,
            Stream.fromIterable([TimespanUpdated(timespan: WEEK)]));
        when(mockDateUtil.getFirstDayOfTimespan(WEEK)).thenReturn(fakeDateTime);
        when(mockStatsRepository.getUserStats(
                loggedUser.email, fakeDateTime.millisecondsSinceEpoch))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
              email: "test@test.com", attendedLessons: attendedLessons));
        });
        userStatsBloc = UserStatsBloc(
          statsRepository: mockStatsRepository,
          userEmail: loggedUser.email,
          dateUtil: mockDateUtil,
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
        when(mockDateUtil.getFirstDayOfTimespan(MONTH))
            .thenReturn(fakeDateTime);
        when(mockStatsRepository.getUserStats(
                loggedUser.email, fakeDateTime.millisecondsSinceEpoch))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
              email: "test@test.com", attendedLessons: attendedLessons));
        });
        userStatsBloc = UserStatsBloc(
          statsRepository: mockStatsRepository,
          userEmail: loggedUser.email,
          dateUtil: mockDateUtil,
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
        when(mockDateUtil.getFirstDayOfTimespan(YEAR)).thenReturn(fakeDateTime);
        when(mockStatsRepository.getUserStats(
                loggedUser.email, fakeDateTime.millisecondsSinceEpoch))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
              email: "test@test.com", attendedLessons: attendedLessons));
        });
        userStatsBloc = UserStatsBloc(
          statsRepository: mockStatsRepository,
          userEmail: loggedUser.email,
          dateUtil: mockDateUtil,
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

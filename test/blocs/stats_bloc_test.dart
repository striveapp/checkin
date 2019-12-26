import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/resources/stats_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockStatsRepository extends Mock implements StatsRepository {}
class MockUserBloc extends Mock implements UserBloc {}
class MockDateUtil extends Mock implements DateUtil {}

void main() {
  group("StatsBloc", () {
    StatsBloc statsBloc;
    MockUserBloc mockUserBloc;
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

    int fakeTimestamp = 123456789;

    setUp(() {
      mockStatsRepository = MockStatsRepository();
      mockUserBloc = MockUserBloc();
      mockDateUtil = MockDateUtil();
      whenListen(mockUserBloc, Stream.fromIterable([UserSuccess(currentUser: loggedUser)]));
    });

    tearDown(() {
      statsBloc?.close();
    });

    group("StatsUpdated", () {
      test("should emits StatsLoaded when create a stats bloc", () {
        when(mockDateUtil.getFirstDayOfTheWeekMilliseconds()).thenReturn(fakeTimestamp);
        when(mockStatsRepository.getUserStats(loggedUser.email, fakeTimestamp)).thenAnswer((_) {
          return Stream<UserHistory>.value(
              UserHistory(attendedLessons: attendedLessons));
        });

        statsBloc = StatsBloc(
            statsRepository: mockStatsRepository, userBloc: mockUserBloc, dateUtil: mockDateUtil);

        final expectedState = [
          StatsUninitialized(),
          StatsLoaded(attendedLessons: attendedLessons, timeSpan: "week"),
        ];

        expectLater(
          statsBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("LoadStats", () {
      group("per week", () {
        setUp(() {
          when(mockDateUtil.getFirstDayOfTheWeekMilliseconds()).thenReturn(fakeTimestamp);
          when(mockStatsRepository.getUserStats(loggedUser.email, fakeTimestamp)).thenAnswer((_) {
            return Stream<UserHistory>.value(
                UserHistory(attendedLessons: attendedLessons));
          });
          statsBloc = StatsBloc(
              statsRepository: mockStatsRepository, userBloc: mockUserBloc, dateUtil: mockDateUtil);
          statsBloc.add(LoadStats(timeSpan: "week"));
        });

        test("should emits StatsLoaded when the event is added", () {
          final expectedState = [
            StatsUninitialized(),
            StatsLoaded(attendedLessons: attendedLessons, timeSpan: "week"),
          ];

          expectLater(
            statsBloc,
            emitsInOrder(expectedState),
          );
        });
      });

      group("per month", () {
        String expectedTimeSpan = "month";

        setUp(() {
          when(mockDateUtil.getFirstDayOfTheWeekMilliseconds()).thenReturn(fakeTimestamp);
          when(mockDateUtil.getFirstDayOfTheMonthMilliseconds()).thenReturn(fakeTimestamp);
          when(mockStatsRepository.getUserStats(loggedUser.email, fakeTimestamp)).thenAnswer((_) {
            return Stream<UserHistory>.value(
                UserHistory(attendedLessons: attendedLessons));
          });
          statsBloc = StatsBloc(
              statsRepository: mockStatsRepository, userBloc: mockUserBloc, dateUtil: mockDateUtil);
          statsBloc.add(LoadStats(timeSpan: expectedTimeSpan));
        });

        test("should emits StatsLoaded for week first and for month leter when the event is added", () {
          final expectedState = [
            StatsUninitialized(),
            StatsLoaded(attendedLessons: attendedLessons, timeSpan: "week"),
            StatsLoaded(attendedLessons: attendedLessons, timeSpan: expectedTimeSpan),
          ];

          expectLater(
            statsBloc,
            emitsInOrder(expectedState),
          );
        });
      });

      group("per year", () {
        String expectedTimeSpan = "year";

        setUp(() {
          when(mockDateUtil.getFirstDayOfTheWeekMilliseconds()).thenReturn(fakeTimestamp);
          when(mockDateUtil.getFirstDayOfTheYearMilliseconds()).thenReturn(fakeTimestamp);
          when(mockStatsRepository.getUserStats(loggedUser.email, fakeTimestamp)).thenAnswer((_) {
            return Stream<UserHistory>.value(
                UserHistory(attendedLessons: attendedLessons));
          });
          statsBloc = StatsBloc(
              statsRepository: mockStatsRepository, userBloc: mockUserBloc, dateUtil: mockDateUtil);
          statsBloc.add(LoadStats(timeSpan: expectedTimeSpan));
        });

        test("should emits StatsLoaded for week first and for year leter when the event is added", () {
          final expectedState = [
            StatsUninitialized(),
            StatsLoaded(attendedLessons: attendedLessons, timeSpan: "week"),
            StatsLoaded(attendedLessons: attendedLessons, timeSpan: expectedTimeSpan),
          ];

          expectLater(
            statsBloc,
            emitsInOrder(expectedState),
          );
        });
      });
    });
  });
}

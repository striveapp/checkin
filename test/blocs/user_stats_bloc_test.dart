import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_state.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helper/mocktail_helper.dart';

class MockStatsRepository extends Mock implements StatsRepository {}

class MockStatsBloc extends MockBloc<StatsEvent, StatsState> implements StatsBloc {}

class FakeStatsState extends Fake implements StatsState {}
class FakeStatsEvent extends Fake implements StatsEvent {}

void main() {
  setUpAll(() {
    registerFallbackValue<StatsState>(FakeStatsState());
    registerFallbackValue<StatsEvent>(FakeStatsEvent());
  });

  group("UserStatsBloc", () {
    MockStatsBloc mockStatsBloc;
    MockStatsRepository mockStatsRepository;

    User loggedUser = User(
        name: "Logged User",
        email: "test@test.com",
        imageUrl: "someImage",
        selectedGymId: "some fake gym");

    List<Lesson> unorderedAttendedLessons = [
      Lesson(
        timeStart: "19:00",
        timeEnd: "20:00",
        date: "2020-01-12",
      ),
      Lesson(
        timeStart: "10:00",
        timeEnd: "11:00",
        date: "2020-01-10",
      ),
      Lesson(
        timeStart: "07:15",
        timeEnd: "08:30",
        date: "2021-01-10",
      ),
    ];

    List<Lesson> orderedAttendedLessons = [
      Lesson(
        timeStart: "07:15",
        timeEnd: "08:30",
        date: "2021-01-10",
      ),
      Lesson(
        timeStart: "19:00",
        timeEnd: "20:00",
        date: "2020-01-12",
      ),
      Lesson(
        timeStart: "10:00",
        timeEnd: "11:00",
        date: "2020-01-10",
      ),
    ];

    setUp(() {
      mockStatsRepository = MockStatsRepository();
      mockStatsBloc = MockStatsBloc();
      configureThrowOnMissingStub([mockStatsRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockStatsRepository]);
    });

    // todo missing initial state test

    //TODO: this tests are redundant
    group("on StatsBloc TimespanUpdated event per week", () {
      setUp(() {
        whenListen(mockStatsBloc, Stream.fromIterable([TimespanUpdated(timespan: Timespan.week)]));
        when(() => mockStatsRepository.getUserStats(
                loggedUser.selectedGymId, loggedUser.email, Timespan.week))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(
              UserHistory(email: "test@test.com", attendedLessons: unorderedAttendedLessons));
        });
      });

      tearDown(() async {
        await untilCalled(() => mockStatsRepository.getUserStats(
            loggedUser.selectedGymId, loggedUser.email, Timespan.week));
        verify(() => mockStatsRepository.getUserStats(
            loggedUser.selectedGymId, loggedUser.email, Timespan.week));
      });

      blocTest(
        "should emit UserStatsLoaded with unorderedAttendedLessons ordered in reverse order",
        build: () => UserStatsBloc(
          statsRepository: mockStatsRepository,
          userEmail: loggedUser.email,
          selectedGymId: loggedUser.selectedGymId,
          statsBloc: mockStatsBloc,
        ),
        expect: () =>
            [UserStatsLoaded(attendedLessons: orderedAttendedLessons, timespan: Timespan.week)],
      );
    });

    group("on StatsBloc TimespanUpdated event per month", () {
      setUp(() {
        whenListen(mockStatsBloc, Stream.fromIterable([TimespanUpdated(timespan: Timespan.month)]));
        when(() => mockStatsRepository.getUserStats(
          loggedUser.selectedGymId,
          loggedUser.email,
          Timespan.month,
        )).thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
            email: "test@test.com",
            attendedLessons: unorderedAttendedLessons,
          ));
        });
      });

      tearDown(() {
        verify(() => mockStatsRepository.getUserStats(
            loggedUser.selectedGymId, loggedUser.email, Timespan.month));
      });

      blocTest(
        "should emit StatsLoaded",
        build: () => UserStatsBloc(
          statsRepository: mockStatsRepository,
          userEmail: loggedUser.email,
          selectedGymId: loggedUser.selectedGymId,
          statsBloc: mockStatsBloc,
        ),
        expect: () => [
          UserStatsLoaded(
            attendedLessons: orderedAttendedLessons,
            timespan: Timespan.month,
          )
        ],
      );
    });

    group("on StatsBloc TimespanUpdated event for all", () {
      setUp(() {
        whenListen(mockStatsBloc, Stream.fromIterable([TimespanUpdated(timespan: Timespan.all)]));
        when(() => mockStatsRepository.getUserStats(
                loggedUser.selectedGymId, loggedUser.email, Timespan.all))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
            email: "test@test.com",
            attendedLessons: unorderedAttendedLessons,
          ));
        });
      });

      tearDown(() async {
        await untilCalled(() => mockStatsRepository.getUserStats(
            loggedUser.selectedGymId, loggedUser.email, Timespan.all));
        verify(() => mockStatsRepository.getUserStats(
            loggedUser.selectedGymId, loggedUser.email, Timespan.all));

      });

      blocTest("should emit StatsLoaded",
          build: () => UserStatsBloc(
                statsRepository: mockStatsRepository,
                userEmail: loggedUser.email,
                selectedGymId: loggedUser.selectedGymId,
                statsBloc: mockStatsBloc,
              ),
          expect: () => [
                UserStatsLoaded(
                  attendedLessons: orderedAttendedLessons,
                  timespan: Timespan.all,
                )
              ]);
    });
  });
}

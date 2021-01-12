import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_state.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockStatsRepository extends Mock implements StatsRepository {}

class MockStatsBloc extends Mock implements StatsBloc {}

void main() {
  group("UserStatsBloc", () {
    MockStatsBloc mockStatsBloc;
    MockStatsRepository mockStatsRepository;

    User loggedUser = User(
        name: "Logged User",
        email: "test@test.com",
        imageUrl: "someImage",
        selectedGymId: "some fake gym");

    List<Lesson> attendedLessons = [
      Lesson(timeStart: "19:00", timeEnd: "20:00"),
      Lesson(timeStart: "10:00", timeEnd: "11:00"),
      Lesson(timeStart: "07:15", timeEnd: "08:30"),
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

    group("on StatsBloc TimespanUpdated event per week", () {
      setUp(() {
        whenListen(mockStatsBloc,
            Stream.fromIterable([TimespanUpdated(timespan: WEEK)]));
        when(mockStatsRepository.getUserStats(
                loggedUser.selectedGymId, loggedUser.email, WEEK))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
              email: "test@test.com", attendedLessons: attendedLessons));
        });
      });

      tearDown(() {
        verify(mockStatsRepository.getUserStats(
            loggedUser.selectedGymId, loggedUser.email, WEEK));
      });

      blocTest(
        "should emit UserStatsLoaded",
        build: () => UserStatsBloc(
          statsRepository: mockStatsRepository,
          userEmail: loggedUser.email,
          selectedGymId: loggedUser.selectedGymId,
          statsBloc: mockStatsBloc,
        ),
        expect: [
          UserStatsLoaded(attendedLessons: attendedLessons, timespan: WEEK)
        ],
      );
    });

    group("on StatsBloc TimespanUpdated event per month", () {
      setUp(() {
        whenListen(mockStatsBloc,
            Stream.fromIterable([TimespanUpdated(timespan: MONTH)]));
        when(mockStatsRepository.getUserStats(
                loggedUser.selectedGymId, loggedUser.email, MONTH))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
              email: "test@test.com", attendedLessons: attendedLessons));
        });
      });

      tearDown(() {
        verify(mockStatsRepository.getUserStats(
            loggedUser.selectedGymId, loggedUser.email, MONTH));
      });

      blocTest(
        "should emit StatsLoaded",
        build: () => UserStatsBloc(
          statsRepository: mockStatsRepository,
          userEmail: loggedUser.email,
          selectedGymId: loggedUser.selectedGymId,
          statsBloc: mockStatsBloc,
        ),
        expect: [
          UserStatsLoaded(attendedLessons: attendedLessons, timespan: MONTH)
        ],
      );
    });

    group("on StatsBloc TimespanUpdated event per year", () {
      setUp(() {
        whenListen(mockStatsBloc,
            Stream.fromIterable([TimespanUpdated(timespan: YEAR)]));
        when(mockStatsRepository.getUserStats(
                loggedUser.selectedGymId, loggedUser.email, YEAR))
            .thenAnswer((_) {
          return Stream<UserHistory>.value(UserHistory(
              email: "test@test.com", attendedLessons: attendedLessons));
        });
      });

      tearDown(() {
        verify(mockStatsRepository.getUserStats(
            loggedUser.selectedGymId, loggedUser.email, YEAR));
      });

      blocTest("should emit StatsLoaded",
          build: () => UserStatsBloc(
                statsRepository: mockStatsRepository,
                userEmail: loggedUser.email,
                selectedGymId: loggedUser.selectedGymId,
                statsBloc: mockStatsBloc,
              ),
          expect: [
            UserStatsLoaded(attendedLessons: attendedLessons, timespan: YEAR)
          ]);
    });
  });
}

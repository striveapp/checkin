@Skip("Issue with bloc_test v8")
import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockStatsBloc extends MockBloc<StatsEvent, StatsState> implements StatsBloc {}

class MockLessonRepository extends Mock implements LessonRepository {}

void main() {
  group("LessonsStatsBloc", () {
    MockStatsBloc mockStatsBloc;
    MockLessonRepository mockLessonRepository;

    Master fakeMaster = Master(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
    );

    Attendee attendee1 = Attendee(
      name: "Test",
      grade: Grade.white,
      email: "fake@test.com",
      imageUrl: "http://imageUrl",
    );

    Attendee attendee2 = Attendee(
      name: "Test2",
      grade: Grade.white,
      email: "fake@test.com",
      imageUrl: "http://imageUrl",
    );

    Attendee attendee3 = Attendee(
      name: "Test3",
      grade: Grade.white,
      email: "fake@test.com",
      imageUrl: "http://imageUrl",
    );

    List<Lesson> allLessons = [
      Lesson(acceptedAttendees: [attendee1, attendee2, attendee3], masters: [fakeMaster]),
      Lesson(acceptedAttendees: [attendee1, attendee2], masters: [fakeMaster]),
    ];

    setUp(() {
      mockLessonRepository = MockLessonRepository();
      mockStatsBloc = MockStatsBloc();
      configureThrowOnMissingStub([mockLessonRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockLessonRepository]);
    });

    // todo missing initial state test

    group("on UpdateLessonStats event", () {
      group("when StatsBloc emits TimespanUpdated state", () {
        setUp(() {
          whenListen(
              mockStatsBloc, Stream.fromIterable([TimespanUpdated(timespan: Timespan.week)]));

          when(mockLessonRepository.getLessonsByMasterAndTimespan(fakeMaster, Timespan.week))
              .thenAnswer((_) => Stream<List<Lesson>>.value(allLessons));
        });

        tearDown(() {
          untilCalled(
              mockLessonRepository.getLessonsByMasterAndTimespan(fakeMaster, Timespan.week));
        });

        //TODO: this should probably be a different data structure, maybe a map with attendee and counter
        blocTest(
          "should emit LessonStatsUpdated",
          build: () => LessonsStatsBloc(
            master: fakeMaster,
            lessonsRepository: mockLessonRepository,
            statsBloc: mockStatsBloc,
          ),
          expect: () => [
            LessonsStatsUpdated(
              acceptedAttendeesWithCounter: {
                attendee1: 2,
                attendee2: 2,
                attendee3: 1,
              },
              totalAttendees: 5,
            ),
          ],
        );
      });
    });
  });
}

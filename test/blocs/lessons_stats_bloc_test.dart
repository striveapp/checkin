import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockStatsBloc extends Mock implements StatsBloc {}

class MockLessonRepository extends Mock implements LessonRepository {}

void main() {
  group("LessonsStatsBloc", () {
    LessonsStatsBloc lessonsStatsBloc;
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
      Lesson(
          acceptedAttendees: [attendee1, attendee2, attendee3],
          masters: [fakeMaster]),
      Lesson(acceptedAttendees: [attendee1, attendee2], masters: [fakeMaster]),
    ];

    setUp(() {
      mockLessonRepository = MockLessonRepository();
      mockStatsBloc = MockStatsBloc();
      whenListen(mockStatsBloc,
          Stream.fromIterable([TimespanUpdated(timespan: WEEK)]));

      when(mockLessonRepository.getLessonsByMasterAndTimespan(fakeMaster, WEEK))
          .thenAnswer((_) => Stream<List<Lesson>>.value(allLessons));

      lessonsStatsBloc = LessonsStatsBloc(
        master: fakeMaster,
        lessonsRepository: mockLessonRepository,
        statsBloc: mockStatsBloc,
      );
    });

    tearDown(() {
      lessonsStatsBloc?.close();
    });

    test(
        "should emits LessonStatsUpdated when StatsBloc add an TimespanUpdated",
        () {
      //TODO: this should probably be a different data structure, maybe a map with attendee and counter
      final expectedState = [
        LessonsStatsInitial(),
        LessonStatsUpdated(acceptedAttendees: [
          attendee1,
          attendee2,
          attendee3,
          attendee1,
          attendee2
        ])
      ];

      expectLater(
        lessonsStatsBloc,
        emitsInOrder(expectedState),
      );
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockStatsBloc extends Mock implements StatsBloc {}

class MockLessonRepository extends Mock implements LessonRepository {}

class MockDateUtil extends Mock implements DateUtil {}

void main() {
  group("LessonsStatsBloc", () {
    LessonsStatsBloc userStatsBloc;
    MockStatsBloc mockStatsBloc;
    MockLessonRepository mockLessonRepository;
    MockDateUtil mockDateUtil;

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

    DateTime fakeDateTime = DateTime(2020, 5, 4);

    setUp(() {
      mockLessonRepository = MockLessonRepository();
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

        when(mockLessonRepository.getLessonsByMasterAndTimespan(
                fakeMaster, fakeDateTime))
            .thenAnswer((_) => Stream<List<Lesson>>.value(allLessons));

        userStatsBloc = LessonsStatsBloc(
          master: fakeMaster,
          lessonsRepository: mockLessonRepository,
          dateUtil: mockDateUtil,
          statsBloc: mockStatsBloc,
        );
      });

      test("should emits LessonStatsUpdated when StatsBloc add an TimespanUpdated",
          () {
        //TODO: this should probably be a different data structure, maybe a map with attendee and counter
        final expectedState = [
          LessonsStatsInitial(),
          LessonStatsUpdated(acceptedAttendees: [
              attendee1,attendee2,attendee3,attendee1,attendee2
          ])
        ];

        expectLater(
          userStatsBloc,
          emitsInOrder(expectedState),
        );
      });
    });

//      group("per month", () {
//        setUp(() {
//          whenListen(mockStatsBloc,
//              Stream.fromIterable([TimespanUpdated(timespan: MONTH)]));
//          when(mockDateUtil.getFirstDayOfTimespan(MONTH))
//              .thenReturn(fakeDateTime);
//          when(mockStatsRepository.getUserStats(
//              fakeMaster.email, fakeDateTime.millisecondsSinceEpoch))
//              .thenAnswer((_) {
//            return Stream<UserHistory>.value(UserHistory(
//                email: "test@test.com", attendedLessons: attendedLessons));
//          });
//          userStatsBloc = LessonsStatsBloc(
//            master: fakeMaster,
//            lessonsRepository: mockLessonRepository,
//            dateUtil: mockDateUtil,
//            statsBloc: mockStatsBloc,
//          );
//        });
//
//        test(
//            "should emits StatsLoaded for week first and for month leter when the event is added",
//                () {
//              final expectedState = [
//                StatsUninitialized(),
//                StatsLoaded(attendedLessons: attendedLessons, timespan: MONTH),
//              ];
//
//              expectLater(
//                userStatsBloc,
//                emitsInOrder(expectedState),
//              );
//            });
//      });
//
//      group("per year", () {
//        setUp(() {
//          whenListen(mockStatsBloc,
//              Stream.fromIterable([TimespanUpdated(timespan: YEAR)]));
//          when(mockDateUtil.getFirstDayOfTimespan(YEAR))
//              .thenReturn(fakeDateTime);
//          when(mockStatsRepository.getUserStats(
//              fakeMaster.email, fakeDateTime.millisecondsSinceEpoch))
//              .thenAnswer((_) {
//            return Stream<UserHistory>.value(UserHistory(
//                email: "test@test.com", attendedLessons: attendedLessons));
//          });
//          userStatsBloc = LessonsStatsBloc(
//            master: fakeMaster,
//            lessonsRepository: mockLessonRepository,
//            dateUtil: mockDateUtil,
//            statsBloc: mockStatsBloc,
//          );
//        });
//        test(
//            "should emits StatsLoaded for week first and for year leter when the event is added",
//                () {
//              final expectedState = [
//                StatsUninitialized(),
//                StatsLoaded(attendedLessons: attendedLessons, timespan: YEAR),
//              ];
//
//              expectLater(
//                userStatsBloc,
//                emitsInOrder(expectedState),
//              );
//            });
//      });
  });
}

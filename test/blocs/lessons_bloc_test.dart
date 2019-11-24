import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLessonRepository extends Mock implements LessonRepository {}

class MockDateUtil extends Mock implements DateUtil {}

void main() {
  group("LessonsBloc", () {
    LessonsBloc lessonsBloc;
    MockLessonRepository mockLessonRepository;
    MockDateUtil mockDateUtil;
    String today = "10 Nov";

    setUp(() {
      mockLessonRepository = MockLessonRepository();
      mockDateUtil = MockDateUtil();
      when(mockLessonRepository.getLessonsForToday()).thenAnswer((_) {
        return Stream<List<Lesson>>.empty();
      });
      when(mockDateUtil.getToday()).thenReturn(today);
      lessonsBloc = LessonsBloc(
          lessonRepository: mockLessonRepository, dateUtil: mockDateUtil);
    });

    tearDown(() {
      lessonsBloc?.close();
    });

    test("initial state is ProfileUninitialized", () {
      expect(lessonsBloc.initialState, LessonsUninitialized());
    });

    group("LessonsUpdated", () {
      group("when no lessons", () {
        test("should emits LessonsLoadedEmpty", () {
          lessonsBloc.add(LessonsUpdated(lessons: []));

          final expectedState = [
            LessonsUninitialized(),
            LessonsLoadedEmpty(day: today),
          ];

          expectLater(
            lessonsBloc,
            emitsInOrder(expectedState),
          );
        });
      });

      group("when lessons", () {
        test("should emits LessonsLoaded with the right lessons", () {
          Lesson lesson = Lesson(timeStart: "19:00", timeEnd: "20:00");
          lessonsBloc.add(LessonsUpdated(lessons: [
            lesson,
          ]));

          final expectedState = [
            LessonsUninitialized(),
            LessonsLoaded(lessons: [
              lesson,
            ], day: today),
          ];

          expectLater(
            lessonsBloc,
            emitsInOrder(expectedState),
          );
        });

        test("should emits LessonLoaded with lessons sorted by time", () {
          List<Lesson> unorderdLessons = [
            Lesson(timeStart: "19:00", timeEnd: "20:00"),
            Lesson(timeStart: "10:00", timeEnd: "11:00"),
            Lesson(timeStart: "07:15", timeEnd: "08:30"),
          ];

          lessonsBloc.add(LessonsUpdated(lessons: unorderdLessons));

          List<Lesson> orderdLessons = [
            Lesson(timeStart: "07:15", timeEnd: "08:30"),
            Lesson(timeStart: "10:00", timeEnd: "11:00"),
            Lesson(timeStart: "19:00", timeEnd: "20:00"),
          ];

          final expectedState = [
            LessonsUninitialized(),
            LessonsLoaded(lessons: orderdLessons, day: today),
          ];

          expectLater(
            lessonsBloc,
            emitsInOrder(expectedState),
          );
        });
      });
    });
  });
}

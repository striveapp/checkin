import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLessonRepository extends Mock implements LessonRepository {}

class MockDateUtil extends Mock implements DateUtil {}

void main() {
  group("LessonsBloc", () {
    LessonsBloc lessonsBloc;
    MockLessonRepository mockLessonRepository;

    setUp(() {
      mockLessonRepository = MockLessonRepository();
    });

    tearDown(() {
      lessonsBloc?.close();
    });

    group("LessonsUpdated", () {
      group("when no lessons", () {
        setUp(() {
          when(mockLessonRepository.getLessonsForToday()).thenAnswer((_) {
            return Stream<List<Lesson>>.value([]);
          });
          lessonsBloc = LessonsBloc(lessonRepository: mockLessonRepository);
        });
        test("should emits LessonsLoadedEmpty", () {
          final expectedState = [
            LessonsUninitialized(),
            LessonsLoadedEmpty(),
          ];

          expectLater(
            lessonsBloc,
            emitsInOrder(expectedState),
          );
        });
      });
      group("when lessons", () {
        List<Lesson> lessons = [
          Lesson(timeStart: "19:00", timeEnd: "20:00")
        ];

        setUp(() {
          when(mockLessonRepository.getLessonsForToday()).thenAnswer((_) {
            return Stream<List<Lesson>>.value(lessons);
          });
          lessonsBloc = LessonsBloc(lessonRepository: mockLessonRepository);
        });

        test("should emits LessonsLoaded with the right lessons", () {
          final expectedState = [
            LessonsUninitialized(),
            LessonsLoaded(lessons: lessons),
          ];

          expectLater(
            lessonsBloc,
            emitsInOrder(expectedState),
          );
        });

        group("when unordered lessons", () {
          List<Lesson> unsortedLessons = [
            Lesson(timeStart: "19:00", timeEnd: "20:00"),
            Lesson(timeStart: "10:00", timeEnd: "11:00"),
            Lesson(timeStart: "07:15", timeEnd: "08:30"),
          ];

          List<Lesson> sortedLessons = [
            Lesson(timeStart: "07:15", timeEnd: "08:30"),
            Lesson(timeStart: "10:00", timeEnd: "11:00"),
            Lesson(timeStart: "19:00", timeEnd: "20:00"),
          ];

          setUp(() {
            when(mockLessonRepository.getLessonsForToday()).thenAnswer((_) {
              return Stream<List<Lesson>>.value(unsortedLessons);
            });
            lessonsBloc = LessonsBloc(lessonRepository: mockLessonRepository);
          });

          test("should emits LessonLoaded with lessons sorted by time", () {
            final expectedState = [
              LessonsUninitialized(),
              LessonsLoaded(lessons: sortedLessons),
            ];

            expectLater(
              lessonsBloc,
              emitsInOrder(expectedState),
            );
          });
        });
      });
    });

    group("LoadLessons", () {
      DateTime selectedDay = DateTime(2020, 1, 1);
      List<Lesson> lessons = [
        Lesson(timeStart: "19:00", timeEnd: "20:00")
      ];
      List<Lesson> newLessons = [
        Lesson(timeStart: "20:00", timeEnd: "21:00")
      ];

      setUp(() {
        when(mockLessonRepository.getLessonsForToday()).thenAnswer((_) {
          return Stream<List<Lesson>>.value(lessons);
        });
        when(mockLessonRepository.getLessonForDay(selectedDay)).thenAnswer((_) {
          return Stream<List<Lesson>>.value(newLessons);
        });
        lessonsBloc = LessonsBloc(lessonRepository: mockLessonRepository);
        lessonsBloc.add(LoadLessons(selectedDay: selectedDay));
      });
      test("should load new lessons for the selected day", () {
        final expectedState = [
          LessonsUninitialized(),
          LessonsLoaded(lessons: lessons),
          LessonsLoaded(lessons: newLessons),
        ];

        expectLater(
          lessonsBloc,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}

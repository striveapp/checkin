import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockLessonRepository extends Mock implements LessonRepository {}

class MockDateUtil extends Mock implements DateUtil {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("LessonsBloc", () {
    MockLessonRepository mockLessonRepository;
    MockUserBloc mockUserBloc;
    MockDateUtil mockDateUtil;

    User fakeUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
      selectedGymId: "someFakeGym",
    );

    setUp(() {
      mockLessonRepository = MockLessonRepository();
      mockUserBloc = MockUserBloc();
      mockDateUtil = MockDateUtil();

      configureThrowOnMissingStub([
        mockLessonRepository,
        mockDateUtil,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockLessonRepository,
        mockDateUtil,
      ]);
    });

    group("initial state", () {
      blocTest("is LessonsUninitialized",
          build: () => LessonsBloc(
                userBloc: mockUserBloc,
                lessonRepository: mockLessonRepository,
                dateUtil: mockDateUtil,
              ),
          expect: [],
          verify: (bloc) {
            expect(bloc.state, LessonsUninitialized());
          });
    });

    group("on InitializeLessons event", () {
      setUp(() {
        whenListen(mockUserBloc, Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
        when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
        when(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, testDate))
            .thenAnswer((realInvocation) => Stream.value([]));
      });

      tearDown(() {
        verify(mockDateUtil.getCurrentDateTime());
        verify(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, testDate));
      });

      blocTest(
        "should listen on lessons for current day",
        build: () => LessonsBloc(
          userBloc: mockUserBloc,
          lessonRepository: mockLessonRepository,
          dateUtil: mockDateUtil,
        ),
        act: (bloc) => bloc.add(InitializeLessons()),
        expect: [
          LessonsLoadedEmpty(
            selectedDay: testDate,
            selectedFilterList: [],
            nocache: testDate,
          )
        ],
      );
    });

    group("on LessonsUpdated event", () {
      group("when there are no lessons", () {
        setUp(() {
          when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
        });

        tearDown(() {
          verify(mockDateUtil.getCurrentDateTime());
        });


        blocTest(
          "should emit LessonsLoadedEmpty",
          build: () => LessonsBloc(
            userBloc: mockUserBloc,
            lessonRepository: mockLessonRepository,
            dateUtil: mockDateUtil,
          ),
          act: (bloc) => bloc.add(LessonsUpdated(
            selectedDay: testDate,
            lessons: [],
            selectedFilterList: [],
          )),
          expect: [
            LessonsLoadedEmpty(
              selectedDay: testDate,
              selectedFilterList: [],
              nocache: testDate,
            )
          ],
        );
      });

      group("when there are unordered lessons", () {
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
          when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
        });

        tearDown(() {
          verify(mockDateUtil.getCurrentDateTime());
        });

        blocTest(
          "should emit LessonLoaded with lessons sorted by time",
          build: () => LessonsBloc(
            userBloc: mockUserBloc,
            lessonRepository: mockLessonRepository,
            dateUtil: mockDateUtil,
          ),
          act: (bloc) => bloc.add(LessonsUpdated(
            selectedDay: testDate,
            lessons: unsortedLessons,
            selectedFilterList: [],
          )),
          expect: [LessonsLoaded(selectedDay: testDate, lessons: sortedLessons, nocache: testDate)],
        );
      });
    });

    group("on LoadLessons event", () {
      DateTime selectedDay = DateTime(2020, 1, 1);
      List<Lesson> lessons = [Lesson(timeStart: "19:00", timeEnd: "20:00")];
      List<Lesson> newLessons = [Lesson(timeStart: "20:00", timeEnd: "21:00")];

      setUp(() {
        whenListen(mockUserBloc, Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
        when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);

        when(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, testDate))
            .thenAnswer((_) {
          return Stream<List<Lesson>>.value(lessons);
        });
        when(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, selectedDay, []))
            .thenAnswer((_) {
          return Stream<List<Lesson>>.value(newLessons);
        });
      });

      tearDown(() {
        verify(mockDateUtil.getCurrentDateTime());
        verify(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, testDate));
        verify(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, selectedDay, []));
      });

      blocTest("should load new lessons for the selected day",
          build: () => LessonsBloc(
                userBloc: mockUserBloc,
                lessonRepository: mockLessonRepository,
                dateUtil: mockDateUtil,
              ),
          act: (bloc) {
            bloc.add(InitializeLessons());
            bloc.add(LoadLessons(selectedDay: selectedDay));
          },
          expect: [
            LessonsLoaded(selectedDay: testDate, lessons: lessons, nocache: testDate),
            LessonsLoaded(selectedDay: selectedDay, lessons: newLessons, nocache: testDate),
          ]);
    });
  });
}

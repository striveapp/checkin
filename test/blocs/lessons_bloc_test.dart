// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/lesson_template_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';
import 'lessons_bloc_test.mocks.dart';

@GenerateMocks([
  LessonRepository,
  LessonTemplateRepository,
  UserRepository,
  DateUtil,
])
void main() {
  group("LessonsBloc", () {
    MockLessonRepository mockLessonRepository;
    MockLessonTemplateRepository mockLessonTemplateRepository;
    MockUserRepository mockUserRepository;
    MockDateUtil mockDateUtil;

    User fakeUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
      selectedGymId: "someFakeGym",
    );

    setUp(() {
      mockLessonRepository = MockLessonRepository();
      mockLessonTemplateRepository = MockLessonTemplateRepository();
      mockUserRepository = MockUserRepository();
      mockDateUtil = MockDateUtil();

      configureThrowOnMissingStub([
        mockLessonRepository,
        mockUserRepository,
        mockDateUtil,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockLessonRepository,
        mockUserRepository,
        mockDateUtil,
      ]);
    });

    group("initial state", () {
      blocTest("is LessonsUninitialized",
          build: () => LessonsBloc(
                userRepository: mockUserRepository,
                lessonRepository: mockLessonRepository,
                lessonTemplateRepository: mockLessonTemplateRepository,
                dateUtil: mockDateUtil,
              ),
          expect: () => [],
          verify: (bloc) {
            expect(bloc.state, LessonsUninitialized());
          });
    });

    group("on InitializeLessons event", () {
      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.value(fakeUser));
        when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
        when(mockDateUtil.getInitialSelectedDayByGym(fakeUser.selectedGymId)).thenReturn(testDate);
        when(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, testDate))
            .thenAnswer((realInvocation) => Stream.value([]));
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
        verify(mockDateUtil.getCurrentDateTime());
        verify(mockDateUtil.getInitialSelectedDayByGym(fakeUser.selectedGymId));
        verify(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, testDate));
      });

      blocTest(
        "listen on lessons for current day",
        build: () => LessonsBloc(
          userRepository: mockUserRepository,
          lessonRepository: mockLessonRepository,
          lessonTemplateRepository: mockLessonTemplateRepository,
          dateUtil: mockDateUtil,
        ),
        act: (bloc) => bloc.add(InitializeLessons()),
        expect: () => [
          LessonsLoaded(
            lessons: [],
            selectedDay: testDate,
            selectedFilterList: [],
            nocache: testDate,
          )
        ],
      );
    });

    group("on LessonsUpdated event", () {
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
            userRepository: mockUserRepository,
            lessonRepository: mockLessonRepository,
            lessonTemplateRepository: mockLessonTemplateRepository,
            dateUtil: mockDateUtil,
          ),
          act: (bloc) => bloc.add(LessonsUpdated(
            selectedDay: testDate,
            lessons: unsortedLessons,
            selectedFilterList: [],
          )),
          expect: () =>
              [LessonsLoaded(selectedDay: testDate, lessons: sortedLessons, nocache: testDate)],
        );
      });
    });

    group(
      "on LoadLessons event",
      () {
        DateTime selectedDay = DateTime(2020, 1, 1);
        List<Lesson> lessons = [Lesson(timeStart: "19:00", timeEnd: "20:00")];
        List<Lesson> newLessons = [Lesson(timeStart: "20:00", timeEnd: "21:00")];

        setUp(() {
          when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.value(fakeUser));
          when(mockDateUtil.getCurrentDateTime()).thenReturn(testDate);
          when(mockDateUtil.getInitialSelectedDayByGym(fakeUser.selectedGymId))
              .thenReturn(testDate);

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
          verify(mockUserRepository.getUser());
          verify(mockDateUtil.getCurrentDateTime());
          verify(mockDateUtil.getInitialSelectedDayByGym(fakeUser.selectedGymId));
          verify(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, testDate));
          verify(mockLessonRepository.getLessonsForDay(fakeUser.selectedGymId, selectedDay, []));
        });

        blocTest("should load new lessons for the selected day",
            build: () => LessonsBloc(
                  userRepository: mockUserRepository,
                  lessonRepository: mockLessonRepository,
                  lessonTemplateRepository: mockLessonTemplateRepository,
                  dateUtil: mockDateUtil,
                ),
            act: (bloc) {
              bloc.add(InitializeLessons());
              bloc.add(LoadLessons(selectedDay: selectedDay));
            },
            expect: () => [
                  LessonsLoaded(
                    selectedDay: testDate,
                    lessons: lessons,
                    nocache: testDate,
                  ),
                  LessonsLoaded(selectedDay: selectedDay, lessons: newLessons, nocache: testDate),
                ]);
      },
    );

    group("on CreateLesson event", () {
      setUp(() {
        when(mockLessonRepository.createLesson(fakeUser.selectedGymId, "2021-01-01"))
            .thenAnswer((realInvocation) => null);
      });

      tearDown(() async {
        await untilCalled(mockLessonRepository.createLesson(fakeUser.selectedGymId, "2021-01-01"));
        verify(mockLessonRepository.createLesson(fakeUser.selectedGymId, "2021-01-01"));
      });

      blocTest(
        "create new lesson",
        build: () {
          var lessonsBloc = LessonsBloc(
            userRepository: mockUserRepository,
            lessonRepository: mockLessonRepository,
            lessonTemplateRepository: mockLessonTemplateRepository,
            dateUtil: mockDateUtil,
          );
          lessonsBloc.gymId = fakeUser.selectedGymId;

          return lessonsBloc;
        },
        act: (bloc) => bloc.add(CreateLesson(selectedDay: DateTime(2021, 1, 1))),
        expect: () => [],
      );
    });

    group("on UpdateCalendar event", () {
      group("when the user chooses to take THIS week as the new calendar", () {
        var today = DateTime(2021, 1, 13);
        setUp(() {
          when(mockDateUtil.getCurrentDateTime()).thenReturn(today);
          when(mockLessonTemplateRepository.applyTemplate(
                  fakeUser.selectedGymId, "2021-01-11", "2021-01-17"))
              .thenAnswer((realInvocation) => null);
        });

        tearDown(() async {
          verify(mockDateUtil.getCurrentDateTime());
          await untilCalled(mockLessonTemplateRepository.applyTemplate(
              fakeUser.selectedGymId, "2021-01-11", "2021-01-17"));
          verify(mockLessonTemplateRepository.applyTemplate(
              fakeUser.selectedGymId, "2021-01-11", "2021-01-17"));
        });

        blocTest(
          "calculates the end date and update the calendar",
          build: () {
            var lessonsBloc = LessonsBloc(
              userRepository: mockUserRepository,
              lessonRepository: mockLessonRepository,
              lessonTemplateRepository: mockLessonTemplateRepository,
              dateUtil: mockDateUtil,
            );
            lessonsBloc.gymId = fakeUser.selectedGymId;

            return lessonsBloc;
          },
          act: (bloc) {
            return bloc.add(UpdateCalendar(fromNextWeek: false));
          },
          expect: () => [],
        );
      });
      group("when the user chooses to take NEXT week as the new calendar", () {
        var today = DateTime(2021, 1, 13);

        setUp(() {
          when(mockDateUtil.getCurrentDateTime()).thenReturn(today);
          when(mockLessonTemplateRepository.applyTemplate(
                  fakeUser.selectedGymId, "2021-01-18", "2021-01-24"))
              .thenAnswer((realInvocation) => null);
        });

        tearDown(() async {
          verify(mockDateUtil.getCurrentDateTime());
          await untilCalled(mockLessonTemplateRepository.applyTemplate(
              fakeUser.selectedGymId, "2021-01-18", "2021-01-24"));
          verify(mockLessonTemplateRepository.applyTemplate(
              fakeUser.selectedGymId, "2021-01-18", "2021-01-24"));
        });

        blocTest(
          "calculates the end date and update the calendar",
          build: () {
            var lessonsBloc = LessonsBloc(
              userRepository: mockUserRepository,
              lessonRepository: mockLessonRepository,
              lessonTemplateRepository: mockLessonTemplateRepository,
              dateUtil: mockDateUtil,
            );
            lessonsBloc.gymId = fakeUser.selectedGymId;

            return lessonsBloc;
          },
          act: (bloc) {
            return bloc.add(UpdateCalendar(fromNextWeek: true));
          },
          expect: () => [],
        );
      });
    });
  });
}

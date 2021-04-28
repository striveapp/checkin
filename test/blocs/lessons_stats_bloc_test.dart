import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helper/mocktail_helper.dart';

class MockStatsBloc extends MockBloc<StatsEvent, StatsState>
    implements StatsBloc {}

class MockLessonRepository extends Mock implements LessonRepository {}

class MockGymRepository extends Mock implements GymRepository {}

class FakeStatsState extends Fake implements StatsState {}

class FakeStatsEvent extends Fake implements StatsEvent {}

void main() {
  setUpAll(() {
    registerFallbackValue<StatsState>(FakeStatsState());
    registerFallbackValue<StatsEvent>(FakeStatsEvent());
  });

  group("LessonsStatsBloc", () {
    MockStatsBloc mockStatsBloc;
    MockLessonRepository mockLessonRepository;
    MockGymRepository mockGymRepository;

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

    Gym fakeGym = Gym(
      id: "fake-id",
      name: "fake-gym",
      paymentAppDomain: "fake-domain",
      stripePublicKey: "fake-key",
      imageUrl: "fake-img",
    );

    List<Lesson> allLessons = [
      Lesson(
          acceptedAttendees: [attendee1, attendee2, attendee3],
          masters: [fakeMaster]),
      Lesson(acceptedAttendees: [attendee1, attendee2], masters: [fakeMaster]),
    ];

    setUp(() {
      mockLessonRepository = MockLessonRepository();
      mockGymRepository = MockGymRepository();
      mockStatsBloc = MockStatsBloc();

      configureThrowOnMissingStub([mockLessonRepository, mockGymRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockLessonRepository, mockGymRepository]);
    });

    group("initial state", () {
      blocTest("is LessonsStatsInitial",
          build: () => LessonsStatsBloc(
              master: fakeMaster,
              lessonsRepository: mockLessonRepository,
              statsBloc: mockStatsBloc,
              gymRepository: mockGymRepository),
          expect: () => [],
          verify: (bloc) {
            expect(bloc.state, LessonsStatsInitial());
          });
    });

    group("on InitializeLessonsStats", () {
      setUp(() {
        when( () => mockGymRepository.getGym())
            .thenAnswer((invocation) => Stream<Gym>.value(fakeGym));

        whenListen(mockStatsBloc,
            Stream.fromIterable([TimespanUpdated(timespan: Timespan.week)]));

        when(() => mockLessonRepository.getLessonsByMasterAndTimespan(
                fakeMaster, Timespan.week, 'fake-id'))
            .thenAnswer((_) => Stream<List<Lesson>>.empty());
      });

      tearDown(() async {
        await untilCalled(() => mockLessonRepository
            .getLessonsByMasterAndTimespan(fakeMaster, Timespan.week, 'fake-id'));
        verify(() => mockLessonRepository.getLessonsByMasterAndTimespan(
            fakeMaster, Timespan.week, 'fake-id'));
        verify( () => mockGymRepository.getGym());
      });

      blocTest(
        "listen on lesson stats",
        build: () => LessonsStatsBloc(
            master: fakeMaster,
            lessonsRepository: mockLessonRepository,
            statsBloc: mockStatsBloc,
            gymRepository: mockGymRepository),
        act: (bloc) => bloc.add(InitializeLessonsStats()),
        expect: () => [],
      );
    });

    group("on UpdateLessonStats event", () {
      group("when StatsBloc emits TimespanUpdated state", () {
        //TODO: this should probably be a different data structure, maybe a map with attendee and counter
        blocTest(
          "emit LessonStatsUpdated",
          build: () => LessonsStatsBloc(
              master: fakeMaster,
              lessonsRepository: mockLessonRepository,
              statsBloc: mockStatsBloc,
              gymRepository: mockGymRepository),
          act: (bloc) => bloc.add(UpdateLessonsStats(lessons: allLessons)),
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

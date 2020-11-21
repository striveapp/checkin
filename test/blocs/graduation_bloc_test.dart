import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/blocs/graduation/graduation_state.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/graduation_system.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/graduation_system_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/util/graduation_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockGraduationSystemRepository extends Mock implements GraduationSystemRepository {}

class MockStatsRepository extends Mock implements StatsRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockGraduationUtils extends Mock implements GraduationUtil {}

void main() {
  group("GraduationBloc", () {
    MockGraduationSystemRepository mockGraduationSystemRepository;
    MockStatsRepository mockStatsRepository;
    MockUserRepository mockUserRepository;
    MockGraduationUtils mockGraduationUtils;

    var fakeUserGrade = Grade.white;
    var fakeGym = "test";
    var fakeUserEmail = 'test@test.com';

    var fakeNewGrade = Grade.blue;

    setUp(() {
      mockGraduationSystemRepository = MockGraduationSystemRepository();
      mockStatsRepository = MockStatsRepository();
      mockUserRepository = MockUserRepository();
      mockGraduationUtils = MockGraduationUtils();

      configureThrowOnMissingStub([
        mockGraduationSystemRepository,
        mockStatsRepository,
        mockUserRepository,
        mockGraduationUtils,
      ]);
    });

    tearDown((){
      logAndVerifyNoMoreInteractions([
        mockGraduationSystemRepository,
        mockStatsRepository,
        mockUserRepository,
        mockGraduationUtils,
      ]);
    });

    group("initial state", () {
      GraduationBloc graduationBloc;

      setUp(() {
        when(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade))
            .thenAnswer((realInvocation) {
          return Stream.empty();
        });

        graduationBloc = GraduationBloc(
            graduationSystemRepository: mockGraduationSystemRepository,
            statsRepository: mockStatsRepository,
            userRepository: mockUserRepository,
            graduationUtils: mockGraduationUtils,
            gymId: fakeGym,
            userGrade: fakeUserGrade,
            userEmail: fakeUserEmail);
      });

      test('is InitialGraduationState', () {
        expect(graduationBloc.state, InitialGraduationState());
        verify(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade));
      });

      tearDown(() {
        graduationBloc?.close();
      });
    });

    group("on GraduationUpdated event", () {
      group("when graduationSystem requires 1 lesson forNextLevel", () {
        setUp(() {
          final GraduationSystem graduationSystemRequiresOneLesson =
              GraduationSystem(grade: fakeUserGrade, forNextLevel: 1.0);

          when(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade))
              .thenAnswer((realInvocation) {
            return Stream.value(graduationSystemRequiresOneLesson);
          });

          when(mockGraduationUtils.calculateNextGrade(fakeUserGrade)).thenReturn(fakeNewGrade);
        });

        group("and user attended 0 lessons", () {
          setUp(() {
            when(mockStatsRepository.getUserStatsByGrade(fakeGym, fakeUserEmail, fakeUserGrade))
                .thenAnswer((realInvocation) => Stream.value(UserHistory(
                      email: fakeUserEmail,
                      attendedLessons: [],
                    )));
          });

          blocTest(
            "should emit NotReadyForGraduation with calculated nextGrade",
            build: () => GraduationBloc(
                graduationSystemRepository: mockGraduationSystemRepository,
                statsRepository: mockStatsRepository,
                userRepository: mockUserRepository,
                graduationUtils: mockGraduationUtils,
                gymId: fakeGym,
                userGrade: fakeUserGrade,
                userEmail: fakeUserEmail),
            expect: [NotReadyForGraduation(nextGrade: fakeNewGrade)],
            verify: (bloc) {
              verify(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade));
              verify(
                  mockStatsRepository.getUserStatsByGrade(fakeGym, fakeUserEmail, fakeUserGrade));
              verify(mockGraduationUtils.calculateNextGrade(fakeUserGrade));
            },
          );
        });

        group("and user attended 1 lesson", () {
          setUp(() {
            when(mockStatsRepository.getUserStatsByGrade(fakeGym, fakeUserEmail, fakeUserGrade))
                .thenAnswer((realInvocation) => Stream.value(UserHistory(
                      email: fakeUserEmail,
                      attendedLessons: [Lesson()],
                    )));
          });

          blocTest(
            "should emit ReadyForGraduation with calculated nextGrade",
            build: () => GraduationBloc(
                graduationSystemRepository: mockGraduationSystemRepository,
                statsRepository: mockStatsRepository,
                userRepository: mockUserRepository,
                graduationUtils: mockGraduationUtils,
                gymId: fakeGym,
                userGrade: fakeUserGrade,
                userEmail: fakeUserEmail),
            expect: [ReadyForGraduation(nextGrade: fakeNewGrade)],
            verify: (bloc) {
              verify(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade));
              verify(
                  mockStatsRepository.getUserStatsByGrade(fakeGym, fakeUserEmail, fakeUserGrade));
              verify(mockGraduationUtils.calculateNextGrade(fakeUserGrade));
            },
          );
        });
      });
    });

    group("on Graduate event", () {
      var fakeAfterGraduationNextGrade = Grade.purple;
      setUp(() {
        when(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade))
            .thenAnswer((realInvocation) {
          return Stream.empty();
        });

        when(mockUserRepository.updateGrade(fakeUserEmail, fakeNewGrade))
            .thenAnswer((realInvocation) {
          return Future.value(null);
        });

        when(mockGraduationUtils.calculateNextGrade(fakeNewGrade))
            .thenReturn(fakeAfterGraduationNextGrade);
      });

      blocTest(
        "should graduate user and prepare for the next graduation",
        build: () => GraduationBloc(
            graduationSystemRepository: mockGraduationSystemRepository,
            statsRepository: mockStatsRepository,
            userRepository: mockUserRepository,
            graduationUtils: mockGraduationUtils,
            gymId: fakeGym,
            userGrade: fakeUserGrade,
            userEmail: fakeUserEmail),
        act: (bloc) => bloc.add(Graduate(newGrade: fakeNewGrade)),
        expect: [
          GraduationLoading(),
          NotReadyForGraduation(nextGrade: fakeAfterGraduationNextGrade),
        ],
        verify: (bloc) {
          verify(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade));
          verify(mockUserRepository.updateGrade(fakeUserEmail, fakeNewGrade));
          verify(mockGraduationUtils.calculateNextGrade(fakeNewGrade));
        },
      );
    });
  });
}

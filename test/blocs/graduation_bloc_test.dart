import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/blocs/graduation/graduation_state.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/graduation_system.dart';
import 'package:checkin/src/models/user.dart';
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

    var fakeUser = User(
      selectedGymId: "test",
      grade: Grade.white,
      email: "test@test.com",
      imageUrl: "sto.ca.png",
    );

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

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockGraduationSystemRepository,
        mockStatsRepository,
        mockUserRepository,
        mockGraduationUtils,
      ]);
    });

    group("initial state", () {
      blocTest(
        "is InitialGraduationState",
        build: () => GraduationBloc(
          graduationSystemRepository: mockGraduationSystemRepository,
          statsRepository: mockStatsRepository,
          userRepository: mockUserRepository,
          graduationUtils: mockGraduationUtils,
          userEmail: fakeUser.email,
        ),
        expect: () => [],
        verify: (bloc) {
          expect(bloc.state, InitialGraduationState());
        },
      );
    });

    group("on InitializeGraduation", () {
      var graduationSystem = GraduationSystem(
        grade: fakeUser.grade,
        forNextLevel: 1.0,
      );

      setUp(() {
        when(mockUserRepository.getUserByEmail(fakeUser.email))
            .thenAnswer((_) => Stream.value(fakeUser));
        when(mockGraduationSystemRepository.getGraduationSystem(
                fakeUser.selectedGymId, fakeUser.grade))
            .thenAnswer((_) => Stream.value(graduationSystem));
        when(mockGraduationUtils.calculateNextGrade(fakeUser.grade)).thenReturn(fakeNewGrade);
        when(mockStatsRepository.getUserStatsByGrade(
                fakeUser.selectedGymId, fakeUser.email, fakeUser.grade))
            .thenAnswer(
          (_) => Stream.value(UserHistory(
            email: fakeUser.email,
            attendedLessons: [],
          )),
        );
        when(mockGraduationUtils.calculateNextGrade(fakeUser.grade)).thenReturn(fakeNewGrade);
      });

      tearDown(() {
        verify(mockUserRepository.getUserByEmail(fakeUser.email));
        verify(mockGraduationSystemRepository.getGraduationSystem(
            fakeUser.selectedGymId, fakeUser.grade));
        verify(mockStatsRepository.getUserStatsByGrade(
            fakeUser.selectedGymId, fakeUser.email, fakeUser.grade));
        verify(mockGraduationUtils.calculateNextGrade(fakeUser.grade));
      });

      blocTest(
        "listen on user and graduation system",
        build: () => GraduationBloc(
          graduationSystemRepository: mockGraduationSystemRepository,
          statsRepository: mockStatsRepository,
          userRepository: mockUserRepository,
          graduationUtils: mockGraduationUtils,
          userEmail: fakeUser.email,
        ),
        expect: () => [
          GraduationLoaded(
            nextGrade: fakeNewGrade,
            forNextLevel: 1.0,
            attendedLessonsForGrade: 0,
          )
        ],
        act: (bloc) => bloc.add(InitializeGraduation()),
      );
    });

    group("on GraduationUpdated event", () {
      var graduationSystem = GraduationSystem(
        grade: fakeUser.grade,
        forNextLevel: 1.0,
      );

      blocTest(
        "emits GraduationLoaded with nextGrade",
        build: () => GraduationBloc(
          graduationSystemRepository: mockGraduationSystemRepository,
          statsRepository: mockStatsRepository,
          userRepository: mockUserRepository,
          graduationUtils: mockGraduationUtils,
          userEmail: fakeUser.email,
        ),
        expect: () => [
          GraduationLoaded(
              nextGrade: fakeNewGrade,
              forNextLevel: graduationSystem.forNextLevel,
              attendedLessonsForGrade: 3)
        ],
        act: (bloc) => bloc.add(GraduationSystemUpdated(
          forNextLevel: graduationSystem.forNextLevel,
          attendedLessonsForGrade: 3,
          nextGrade: fakeNewGrade,
        )),
      );
    });

    group("on Graduate event", () {
      setUp(() {
        when(mockUserRepository.updateGrade(fakeUser.email, fakeNewGrade))
            .thenAnswer((_) => Future.value(null));
      });

      tearDown(() async {
        await untilCalled(mockUserRepository.updateGrade(fakeUser.email, fakeNewGrade));
        verify(mockUserRepository.updateGrade(fakeUser.email, fakeNewGrade));
      });

      blocTest(
        "graduate user and prepare for the next graduation",
        build: () => GraduationBloc(
            graduationSystemRepository: mockGraduationSystemRepository,
            statsRepository: mockStatsRepository,
            userRepository: mockUserRepository,
            graduationUtils: mockGraduationUtils,
            userEmail: fakeUser.email),
        act: (bloc) => bloc.add(Graduate(newGrade: fakeNewGrade)),
        expect: () => [],
      );
    });
  });
}

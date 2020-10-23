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
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGraduationSystemRepository extends Mock implements GraduationSystemRepository {}

class MockStatsRepository extends Mock implements StatsRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockGraduationUtils extends Mock implements GraduationUtil {}

void main() {
  group("GraduationBloc", () {
    GraduationBloc graduationBloc;
    MockGraduationSystemRepository mockGraduationSystemRepository;
    MockStatsRepository mockStatsRepository;
    MockUserRepository mockUserRepository;
    MockGraduationUtils mockGraduationUtils;

    group("initial state", () {
      test("initial state is InitialGraduationState", () {
        mockGraduationSystemRepository = MockGraduationSystemRepository();

        var fakeUserGrade = Grade.white;
        var fakeGym = "test";
        var fakeUserEmail = 'test@test.com';

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

        expect(graduationBloc.initialState, InitialGraduationState());

        verify(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade));
      });
    });

    group("GraduationUpdated", () {
      test("should emit NotReadyForGraduation when attendedLessonsForGrade are less than required",
          () async {
        mockGraduationSystemRepository = MockGraduationSystemRepository();
        mockStatsRepository = MockStatsRepository();
        mockGraduationUtils = MockGraduationUtils();

        var fakeUserGrade = Grade.white;
        var fakeNewGrade = Grade.blue;
        var fakeGym = "test";
        var fakeUserEmail = 'test@test.com';

        final GraduationSystem expectedGraduationSystem =
            GraduationSystem(grade: fakeUserGrade, forNextLevel: 1.0);

        when(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade))
            .thenAnswer((realInvocation) {
          return Stream.value(expectedGraduationSystem);
        });

        when(mockStatsRepository.getUserStatsByGrade(fakeGym, fakeUserEmail, fakeUserGrade))
            .thenAnswer((realInvocation) => Stream.value(UserHistory(
                  email: fakeUserEmail,
                  attendedLessons: [],
                )));

        when(mockGraduationUtils.calculateNextGrade(fakeUserGrade)).thenReturn(fakeNewGrade);

        graduationBloc = GraduationBloc(
          graduationSystemRepository: mockGraduationSystemRepository,
          statsRepository: mockStatsRepository,
          userRepository: mockUserRepository,
          graduationUtils: mockGraduationUtils,
          gymId: fakeGym,
          userGrade: fakeUserGrade,
          userEmail: fakeUserEmail,
        );

        final expectedState = [
          InitialGraduationState(),
          NotReadyForGraduation(nextGrade: fakeNewGrade),
        ];

        await expectLater(
          graduationBloc,
          emitsInOrder(expectedState),
        );

        verify(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade));
        verify(mockStatsRepository.getUserStatsByGrade(fakeGym, fakeUserEmail, fakeUserGrade));
        verify(mockGraduationUtils.calculateNextGrade(fakeUserGrade));
      });
      test(
          "should emit ReadyForGraduation when attendedLessonsForGrade are more or equal to required",
          () async {
        mockGraduationSystemRepository = MockGraduationSystemRepository();
        mockStatsRepository = MockStatsRepository();
        mockGraduationUtils = MockGraduationUtils();

        var fakeUserGrade = Grade.white;
        var fakeNewGrade = Grade.blue;

        var fakeGym = "test";
        var fakeUserEmail = 'test@test.com';

        final GraduationSystem expectedGraduationSystem =
            GraduationSystem(grade: fakeUserGrade, forNextLevel: 1);

        when(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade))
            .thenAnswer((realInvocation) {
          return Stream.value(expectedGraduationSystem);
        });

        when(mockStatsRepository.getUserStatsByGrade(fakeGym, fakeUserEmail, fakeUserGrade))
            .thenAnswer((realInvocation) => Stream.value(UserHistory(
                  email: fakeUserEmail,
                  attendedLessons: [Lesson()],
                )));

        when(mockGraduationUtils.calculateNextGrade(fakeUserGrade)).thenReturn(fakeNewGrade);

        graduationBloc = GraduationBloc(
          graduationSystemRepository: mockGraduationSystemRepository,
          statsRepository: mockStatsRepository,
          userRepository: mockUserRepository,
          graduationUtils: mockGraduationUtils,
          gymId: fakeGym,
          userGrade: fakeUserGrade,
          userEmail: fakeUserEmail,
        );

        final expectedState = [
          InitialGraduationState(),
          ReadyForGraduation(nextGrade: fakeNewGrade),
        ];

        await expectLater(
          graduationBloc,
          emitsInOrder(expectedState),
        );

        verify(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade));
        verify(mockStatsRepository.getUserStatsByGrade(fakeGym, fakeUserEmail, fakeUserGrade));
        verify(mockGraduationUtils.calculateNextGrade(fakeUserGrade));
      });
    });

    group("Graduate", () {
      test("should graduate user", () async {
        mockGraduationSystemRepository = MockGraduationSystemRepository();
        mockUserRepository = MockUserRepository();

        var fakeUserGrade = Grade.white;
        var fakeNewGrade = Grade.blue;
        var fakeGym = "test";
        var fakeUserEmail = 'test@test.com';

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

        graduationBloc.add(Graduate(newGrade: fakeNewGrade));

        final expectedState = [
          InitialGraduationState(),
          GraduationLoading(),
        ];

        await expectLater(
          graduationBloc,
          emitsInOrder(expectedState),
        );

        verify(mockGraduationSystemRepository.getGraduationSystem(fakeGym, fakeUserGrade));
        verify(mockUserRepository.updateGrade(fakeUserEmail, fakeNewGrade));
      });
    });
  });
}

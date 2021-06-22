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

    var fakeUserToGraduate = User(
      selectedGymId: "test",
      grade: Grade.white,
      email: "test@test.com",
      imageUrl: "sto.ca.png",
      isOwner: false,
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

    group("on InitializeGraduation", () {
      var graduationSystem = GraduationSystem(
        grade: fakeUserToGraduate.grade,
        forNextLevel: 1.0,
      );

      group("when user is owner", () {
        var fakeOwner = User(
          selectedGymId: "test",
          grade: Grade.white,
          email: "test@owner.com",
          imageUrl: "sto.ca.zz.png",
          isOwner: true,
        );

        setUp(() {
          when(mockUserRepository.getUser()).thenAnswer((_) => Stream.value(fakeOwner));
        });

        tearDown(() {
          verify(mockUserRepository.getUser());
        });

        group("and is seeing the profile of a student", () {
          setUp(() {
            when(mockUserRepository.getUserByEmail(fakeUserToGraduate.email))
                .thenAnswer((_) => Stream.value(fakeUserToGraduate));
            when(mockGraduationSystemRepository.getGraduationSystem(
                    fakeUserToGraduate.selectedGymId, fakeUserToGraduate.grade))
                .thenAnswer((_) => Stream.value(graduationSystem));
            when(mockGraduationUtils.calculateNextGrade(fakeUserToGraduate.grade))
                .thenReturn(fakeNewGrade);
            when(mockStatsRepository.getUserStatsByGrade(fakeUserToGraduate.selectedGymId,
                    fakeUserToGraduate.email, fakeUserToGraduate.grade))
                .thenAnswer(
              (_) => Stream.value(UserHistory(
                email: fakeUserToGraduate.email,
                attendedLessons: [],
              )),
            );
            when(mockGraduationUtils.calculateNextGrade(fakeUserToGraduate.grade))
                .thenReturn(fakeNewGrade);
          });

          tearDown(() {
            verify(mockUserRepository.getUserByEmail(fakeUserToGraduate.email));
            verify(mockGraduationSystemRepository.getGraduationSystem(
                fakeUserToGraduate.selectedGymId, fakeUserToGraduate.grade));
            verify(mockStatsRepository.getUserStatsByGrade(fakeUserToGraduate.selectedGymId,
                fakeUserToGraduate.email, fakeUserToGraduate.grade));
            verify(mockGraduationUtils.calculateNextGrade(fakeUserToGraduate.grade));
          });

          blocTest(
            "listen on user and graduation system",
            build: () => GraduationBloc(
              graduationSystemRepository: mockGraduationSystemRepository,
              statsRepository: mockStatsRepository,
              userRepository: mockUserRepository,
              graduationUtils: mockGraduationUtils,
              userToGraduateEmail: fakeUserToGraduate.email,
            ),
            expect: () => [
              GraduationLoaded(
                currentGrade: fakeUserToGraduate.grade,
                nextGrade: fakeNewGrade,
                forNextLevel: 1.0,
                attendedLessonsForGrade: 0,
                isVisible: true,
              )
            ],
            act: (bloc) => bloc.add(InitializeGraduation()),
          );
        });

        group("and is looking at is own profile", () {
          setUp(() {
            when(mockUserRepository.getUserByEmail(fakeOwner.email))
                .thenAnswer((_) => Stream.value(fakeOwner));
            when(mockGraduationSystemRepository.getGraduationSystem(
                    fakeOwner.selectedGymId, fakeOwner.grade))
                .thenAnswer((_) => Stream.value(graduationSystem));
            when(mockGraduationUtils.calculateNextGrade(fakeOwner.grade)).thenReturn(fakeNewGrade);
            when(mockStatsRepository.getUserStatsByGrade(
                    fakeOwner.selectedGymId, fakeOwner.email, fakeOwner.grade))
                .thenAnswer(
              (_) => Stream.value(UserHistory(
                email: fakeOwner.email,
                attendedLessons: [],
              )),
            );
            when(mockGraduationUtils.calculateNextGrade(fakeOwner.grade)).thenReturn(fakeNewGrade);
          });

          tearDown(() {
            verify(mockUserRepository.getUserByEmail(fakeOwner.email));
            verify(mockGraduationSystemRepository.getGraduationSystem(
                fakeOwner.selectedGymId, fakeOwner.grade));
            verify(mockStatsRepository.getUserStatsByGrade(
                fakeOwner.selectedGymId, fakeOwner.email, fakeOwner.grade));
            verify(mockGraduationUtils.calculateNextGrade(fakeOwner.grade));
          });

          blocTest(
            "listen on user and graduation system",
            build: () => GraduationBloc(
              graduationSystemRepository: mockGraduationSystemRepository,
              statsRepository: mockStatsRepository,
              userRepository: mockUserRepository,
              graduationUtils: mockGraduationUtils,
              userToGraduateEmail: fakeOwner.email,
            ),
            expect: () => [
              GraduationLoaded(
                currentGrade: fakeOwner.grade,
                nextGrade: fakeNewGrade,
                forNextLevel: 1.0,
                attendedLessonsForGrade: 0,
                isVisible: false,
              )
            ],
            act: (bloc) => bloc.add(InitializeGraduation()),
          );
        });
      });

      group("when user is NOT owner", () {
        var fakeUser = User(
          selectedGymId: "test",
          grade: Grade.white,
          email: "test@test-no-admin.com",
          imageUrl: "sto.ca.zz.png",
          isOwner: false,
        );

        setUp(() {
          when(mockUserRepository.getUser()).thenAnswer((_) => Stream.value(fakeUser));
          when(mockUserRepository.getUserByEmail(fakeUserToGraduate.email))
              .thenAnswer((_) => Stream.value(fakeUserToGraduate));
          when(mockGraduationSystemRepository.getGraduationSystem(
                  fakeUserToGraduate.selectedGymId, fakeUserToGraduate.grade))
              .thenAnswer((_) => Stream.value(graduationSystem));
          when(mockGraduationUtils.calculateNextGrade(fakeUserToGraduate.grade))
              .thenReturn(fakeNewGrade);
          when(mockStatsRepository.getUserStatsByGrade(fakeUserToGraduate.selectedGymId,
                  fakeUserToGraduate.email, fakeUserToGraduate.grade))
              .thenAnswer(
            (_) => Stream.value(UserHistory(
              email: fakeUserToGraduate.email,
              attendedLessons: [],
            )),
          );
          when(mockGraduationUtils.calculateNextGrade(fakeUserToGraduate.grade))
              .thenReturn(fakeNewGrade);
        });

        tearDown(() {
          verify(mockUserRepository.getUser());
          verify(mockUserRepository.getUserByEmail(fakeUserToGraduate.email));
          verify(mockGraduationSystemRepository.getGraduationSystem(
              fakeUserToGraduate.selectedGymId, fakeUserToGraduate.grade));
          verify(mockStatsRepository.getUserStatsByGrade(fakeUserToGraduate.selectedGymId,
              fakeUserToGraduate.email, fakeUserToGraduate.grade));
          verify(mockGraduationUtils.calculateNextGrade(fakeUserToGraduate.grade));
        });

        blocTest(
          "listen on user and graduation system",
          build: () => GraduationBloc(
            graduationSystemRepository: mockGraduationSystemRepository,
            statsRepository: mockStatsRepository,
            userRepository: mockUserRepository,
            graduationUtils: mockGraduationUtils,
            userToGraduateEmail: fakeUserToGraduate.email,
          ),
          expect: () => [
            GraduationLoaded(
              currentGrade: fakeUserToGraduate.grade,
              nextGrade: fakeNewGrade,
              forNextLevel: 1.0,
              attendedLessonsForGrade: 0,
              isVisible: false,
            )
          ],
          act: (bloc) => bloc.add(InitializeGraduation()),
        );
      });
    });

    group("on GraduationUpdated event", () {
      var graduationSystem = GraduationSystem(
        grade: fakeUserToGraduate.grade,
        forNextLevel: 1.0,
      );

      blocTest(
        "emits GraduationLoaded with nextGrade",
        build: () => GraduationBloc(
          graduationSystemRepository: mockGraduationSystemRepository,
          statsRepository: mockStatsRepository,
          userRepository: mockUserRepository,
          graduationUtils: mockGraduationUtils,
          userToGraduateEmail: fakeUserToGraduate.email,
        ),
        expect: () => [
          GraduationLoaded(
            currentGrade: fakeUserToGraduate.grade,
            nextGrade: fakeNewGrade,
            forNextLevel: graduationSystem.forNextLevel,
            attendedLessonsForGrade: 3,
            isVisible: false,
          )
        ],
        act: (bloc) => bloc.add(GraduationSystemUpdated(
          forNextLevel: graduationSystem.forNextLevel,
          attendedLessonsForGrade: 3,
          currentGrade: fakeUserToGraduate.grade,
          nextGrade: fakeNewGrade,
          isVisible: false,
        )),
      );
    });

    group("on Graduate event", () {
      setUp(() {
        when(mockUserRepository.updateGrade(fakeUserToGraduate.email, fakeNewGrade))
            .thenAnswer((_) => Future.value(null));
      });

      tearDown(() async {
        await untilCalled(mockUserRepository.updateGrade(fakeUserToGraduate.email, fakeNewGrade));
        verify(mockUserRepository.updateGrade(fakeUserToGraduate.email, fakeNewGrade));
      });

      blocTest(
        "graduate user and prepare for the next graduation",
        build: () => GraduationBloc(
            graduationSystemRepository: mockGraduationSystemRepository,
            statsRepository: mockStatsRepository,
            userRepository: mockUserRepository,
            graduationUtils: mockGraduationUtils,
            userToGraduateEmail: fakeUserToGraduate.email),
        act: (bloc) => bloc.add(Graduate(newGrade: fakeNewGrade)),
        expect: () => [],
      );
    });
  });
}

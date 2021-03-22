import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lesson_filter/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockLessonConfigRepository extends Mock implements LessonConfigRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("LessonFilterBloc", () {
    MockLessonConfigRepository mockLessonConfigRepository;
    MockUserRepository mockUserRepository;

    String fakeGymId = "cool-gym-bro";

    User fakeUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
      selectedGymId: fakeGymId,
    );

    setUp(() {
      mockLessonConfigRepository = MockLessonConfigRepository();
      mockUserRepository = MockUserRepository();

      configureThrowOnMissingStub([
        mockLessonConfigRepository,
        mockUserRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockLessonConfigRepository,
        mockUserRepository,
      ]);
    });

    group("initial state", () {
      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.empty());
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
      });

      blocTest(
        "is InitialLessonFilterState",
        build: () => LessonFilterBloc(
          lessonConfigRepository: mockLessonConfigRepository,
          userRepository: mockUserRepository,
        ),
        expect: () => [],
        verify: (bloc) {
          expect(bloc.state, InitialLessonFilterState());
        },
      );
    });

    group("on LessonFilterUpdated event", () {
      const Set<String> testFilterTypes = {"cool-type", "cooler-type"};

      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.value(fakeUser));
        when(mockLessonConfigRepository.getAvailableLessonTypes(fakeGymId))
            .thenAnswer((realInvocation) => Stream<Set<String>>.value(testFilterTypes));
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
        verify(mockLessonConfigRepository.getAvailableLessonTypes(fakeGymId));
      });

      blocTest(
        "should emit LessonFilterLoaded with available filters",
        build: () => LessonFilterBloc(
          lessonConfigRepository: mockLessonConfigRepository,
          userRepository: mockUserRepository,
        ),
        expect: () => [LessonFilterLoaded(availableLessonTypes: testFilterTypes.toList())],
      );
    });
  });
}

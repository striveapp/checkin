import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lesson_filter/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockLessonConfigRepository extends Mock implements LessonConfigRepository {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("LessonFilterBloc", () {
    MockLessonConfigRepository mockLessonConfigRepository;
    MockUserBloc mockUserBloc;

    String fakeGymId = "cool-gym-bro";

    User fakeUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
      selectedGymId: fakeGymId,
    );

    setUp(() {
      mockLessonConfigRepository = MockLessonConfigRepository();
      mockUserBloc = MockUserBloc();
      configureThrowOnMissingStub([mockLessonConfigRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockLessonConfigRepository]);
    });

    group("initial state", () {
      LessonFilterBloc lessonFilterBloc;

      setUp(() {
        lessonFilterBloc = LessonFilterBloc(
          lessonConfigRepository: mockLessonConfigRepository,
          userBloc: mockUserBloc,
        );
      });

      test('is InitialLessonFilterState', () {
        expect(lessonFilterBloc.state, InitialLessonFilterState());
      });

      tearDown(() {
        lessonFilterBloc?.close();
      });
    });

    group("on LessonFilterUpdated event", () {
      const Set<String> testFilterTypes = {"cool-type", "cooler-type"};

      setUp(() {
        whenListen(mockUserBloc, Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
        when(mockLessonConfigRepository.getAvailableLessonTypes(fakeGymId))
            .thenAnswer((realInvocation) => Stream<Set<String>>.value(testFilterTypes));
      });

      tearDown(() {
        verify(mockLessonConfigRepository.getAvailableLessonTypes(fakeGymId));
      });

      blocTest(
        "should emit LessonFilterLoaded with available filters",
        build: () => LessonFilterBloc(
          lessonConfigRepository: mockLessonConfigRepository,
          userBloc: mockUserBloc,
        ),
        expect: [LessonFilterLoaded(availableLessonTypes: testFilterTypes.toList())]
      );
    });
  });
}

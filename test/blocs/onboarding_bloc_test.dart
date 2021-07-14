// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/onboarding/onboarding_bloc.dart';
import 'package:checkin/src/blocs/onboarding/onboarding_event.dart';
import 'package:checkin/src/blocs/onboarding/onboarding_state.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("OnboardingBloc", () {
    MockUserRepository mockUserRepository;

    User fakeUser = User(
      name: "Test",
      imageUrl: "imageurl",
      email: "test@fake.com",
    );

    setUp(() {
      mockUserRepository = MockUserRepository();

      configureThrowOnMissingStub([
        mockUserRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockUserRepository,
      ]);
    });

    group("on InitializeOnboarding event", () {
      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((_) {
          return Stream<User>.value(null);
        });
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
      });

      blocTest(
        "should listen on user",
        build: () => OnboardingBloc(
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(InitializeOnboarding()),
        expect: () => [],
      );
    });

    group("on UserUpdated event", () {
      group("when the selected gym is demo", () {
        blocTest(
          "should emit ShowDialog",
          build: () => OnboardingBloc(
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(UserUpdated(user: fakeUser.copyWith(selectedGymId: "demo"))),
          expect: () => [ShowDialog()],
        );
      });

      group("when the selected gym is NOT demo", () {
        blocTest(
          "should emit ShowDialog",
          build: () => OnboardingBloc(
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(UserUpdated(user: fakeUser.copyWith(selectedGymId: "not-demo"))),
          expect: () => [],
        );
      });
    });
  });
}

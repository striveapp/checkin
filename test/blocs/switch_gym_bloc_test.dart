import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/switch_gym/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helper/mocktail_helper.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockGymRepository extends Mock implements GymRepository {}

void main() {
  MockUserRepository mockUserRepository;
  MockGymRepository mockGymRepository;

  User fakeUser = User(
    name: "Logged User",
    email: "test@test.com",
    imageUrl: "someImage",
    selectedGymId: "testGym",
    knownGymIds: [],
  );

  Gym fakeGym = Gym(
    id: "testGym",
    name: "Test Gym",
    imageUrl: "img.src",
    stripePublicKey: "key",
    paymentAppDomain: "domain",
  );

  group("SwitchGymBloc", () {
    setUp(() {
      mockUserRepository = MockUserRepository();
      mockGymRepository = MockGymRepository();

      configureThrowOnMissingStub([
        mockUserRepository,
        mockGymRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockUserRepository,
        mockGymRepository,
      ]);
    });

    group("initial state", () {
      blocTest(
        "is SwitchGymsInitial",
        build: () => SwitchGymBloc(
          userRepository: mockUserRepository,
          gymRepository: mockGymRepository,
        ),
        expect: () => [],
        verify: (bloc) => expect(bloc.state, SwitchGymsInitial()),
      );
    });

    group("on InitializeSwitchGym", () {
      setUp(() {
        when(() => mockUserRepository.getUser())
            .thenAnswer((realInvocation) => Stream.value(fakeUser));
        when(() => mockGymRepository.getGym())
            .thenAnswer((realInvocation) => Stream.value(fakeGym));
      });

      tearDown(() {
        verify(() => mockUserRepository.getUser());
        verify(() => mockGymRepository.getGym());
      });

      blocTest(
        "should retrieve the selected gym and all the known gyms",
        build: () => SwitchGymBloc(
          userRepository: mockUserRepository,
          gymRepository: mockGymRepository,
        ),
        act: (bloc) => bloc.add(SwitchGymsEvent.initializeSwitchGym()),
        expect: () => [
          SwitchGymsState.knownGymsLoaded(
            selectedGym: fakeGym,
            currentUser: fakeUser,
            knowGymsIds: [],
            showDropdown: false,
          )
        ],
      );
    });

    group("on UpdateSwitchGyms", () {
      group("when there are LESS then TWO knownGymsIds", () {
        blocTest(
          "should retrieve the selected gym and all the known gyms but not display the dropdown",
          build: () => SwitchGymBloc(
            userRepository: mockUserRepository,
            gymRepository: mockGymRepository,
          ),
          act: (bloc) => bloc.add(SwitchGymsEvent.switchGymUpdated(
              selectedGym: fakeGym,
              currentUser: fakeUser,
              knowGymsIds: [
                "aGym",
              ])),
          expect: () => [
            SwitchGymsState.knownGymsLoaded(
              selectedGym: fakeGym,
              currentUser: fakeUser,
              knowGymsIds: ["aGym"],
              showDropdown: false,
            )
          ],
        );
      });
      group("when there are MORE then TWO knownGymsIds", () {
        blocTest(
          "should retrieve the selected gym and all the known gyms but not display the dropdown",
          build: () => SwitchGymBloc(
            userRepository: mockUserRepository,
            gymRepository: mockGymRepository,
          ),
          act: (bloc) => bloc.add(SwitchGymsEvent.switchGymUpdated(
              selectedGym: fakeGym,
              currentUser: fakeUser,
              knowGymsIds: [
                "aGym",
                "anotherGym",
              ])),
          expect: () => [
            SwitchGymsState.knownGymsLoaded(
              selectedGym: fakeGym,
              currentUser: fakeUser,
              knowGymsIds: [
                "aGym",
                "anotherGym",
              ],
              showDropdown: true,
            )
          ],
        );
      });
    });
  });
}

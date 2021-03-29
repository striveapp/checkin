import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'gym_bloc_test.mocks.dart';
import 'helper/mock_helper.dart';

@GenerateMocks([GymRepository, DateUtil])
void main() {
  group("GymBloc", () {
    MockGymRepository mockGymRepository;

    Gym fakeGym = Gym(
      id: "a_gym",
      name: "Test gym",
      paymentAppDomain: "pepe",
      stripePublicKey: "pk_pk",
      hasActivePayments: false,
      imageUrl: "cool-gyms-have-cool-images",
    );

    Gym anotherFakeGym = Gym(
      id: "not_the_current_gym",
      name: "Test gym",
      paymentAppDomain: "pepe",
      stripePublicKey: "pk_pk",
      hasActivePayments: false,
      imageUrl: "cool-gyms-have-cool-images",
    );

    setUp(() {
      mockGymRepository = MockGymRepository();

      configureThrowOnMissingStub([
        mockGymRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockGymRepository,
      ]);
    });

    group("on InitializeGym event", () {
      group("when NO gymId has been given", () {
        setUp(() {
          when(mockGymRepository.getGym()).thenAnswer((_) {
            return Stream<Gym>.value(fakeGym);
          });
        });

        tearDown(() {
          verify(mockGymRepository.getGym());
        });

        blocTest(
          "should listen on selected gym",
          build: () => GymBloc(
            gymRepository: mockGymRepository,
          ),
          act: (bloc) => bloc.add(InitializeGym()),
          expect: () => [
            GymLoaded(
              gym: fakeGym,
            )
          ],
        );
      });
      group("when a gymId has been given", () {
        setUp(() {
          when(mockGymRepository.getGymById(anotherFakeGym.id)).thenAnswer((_) {
            return Stream<Gym>.value(anotherFakeGym);
          });
        });

        tearDown(() {
          verify(mockGymRepository.getGymById(anotherFakeGym.id));
        });

        blocTest(
          "should listen on the given gym",
          build: () {
            return GymBloc(gymRepository: mockGymRepository, gymId: anotherFakeGym.id);
          },
          act: (bloc) => bloc.add(InitializeGym()),
          expect: () => [
            GymLoaded(
              gym: anotherFakeGym,
            )
          ],
        );
      });
    });

    group("on GymUpdated event", () {
      blocTest(
        "should emit GymLoaded with the loaded gym",
        build: () => GymBloc(
          gymRepository: mockGymRepository,
        ),
        act: (bloc) => bloc.add(GymUpdated(gym: fakeGym)),
        expect: () => [GymLoaded(gym: fakeGym)],
      );
    });
  });
}

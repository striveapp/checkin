import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockGymRepository extends Mock implements GymRepository {}

class MockDateUtil extends Mock implements DateUtil {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("GymBloc", () {
    MockGymRepository mockGymRepository;
    MockUserBloc mockUserBloc;

    String fakeGymId = "bjj";
    Gym fakeGym = Gym(
      id: fakeGymId,
      name: "Test gym",
      paymentAppDomain: "pepe",
      stripePublicKey: "pk_pk",
      hasActivePayments: false,
    );

    User fakeUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
      selectedGymId: fakeGym.id,
    );

    setUp(() {
      mockGymRepository = MockGymRepository();
      mockUserBloc = MockUserBloc();
      configureThrowOnMissingStub([mockGymRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockGymRepository]);
    });

    group("initial state", () {
      blocTest("is InitialGymState",
          build: () => GymBloc(
                userBloc: mockUserBloc,
                gymRepository: mockGymRepository,
              ),
          expect: [],
          verify: (bloc) {
            expect(bloc.state, InitialGymState());
          });
    });

    //TODO: are this tests redundants?
    group("on InitializeGym event", () {
      setUp(() {
        whenListen(mockUserBloc,
            Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
        when(mockGymRepository.getGym(fakeGymId)).thenAnswer((_) {
          return Stream<Gym>.value(fakeGym);
        });
      });

      tearDown(() {
        verify(mockGymRepository.getGym(fakeGymId));
      });

      blocTest(
        "should listen on selected gym",
        build: () => GymBloc(
          userBloc: mockUserBloc,
          gymRepository: mockGymRepository,
        ),
        act: (bloc) => bloc.add(InitializeGym()),
        expect: [
          GymLoaded(
            gym: fakeGym,
          )
        ],
      );
    });

    group("on GymUpdated event", () {
      blocTest(
        "should emit GymLoaded with the loaded gym",
        build: () => GymBloc(
          userBloc: mockUserBloc,
          gymRepository: mockGymRepository,
        ),
        act: (bloc) => bloc.add(GymUpdated(gym: fakeGym)),
        expect: [GymLoaded(gym: fakeGym)],
      );
    });
  });
}

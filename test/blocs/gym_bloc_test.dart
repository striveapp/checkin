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
      host: "test",
      paymentAppDomain: "pepe",
      stripePublicKey: "pk_pk",
      hasActivePayments: false,
    );

    User fakeUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
      selectedGymId: fakeGymId,
    );

    setUp(() {
      mockGymRepository = MockGymRepository();
      mockUserBloc = MockUserBloc();
      configureThrowOnMissingStub([mockGymRepository]);
    });

    tearDown((){
      logAndVerifyNoMoreInteractions([mockGymRepository]);
    });

    // todo missing initial state test
    group("on GymUpdated event", () {
      setUp(() {
        whenListen(mockUserBloc, Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));

        when(mockGymRepository.getGym(fakeGymId)).thenAnswer((_) {
          return Stream<Gym>.value(fakeGym);
        });
      });

      tearDown((){
        verify(mockGymRepository.getGym(fakeGymId));
      });

      blocTest(
        "should emit GymLoaded with the loaded gym",
        build: () => GymBloc(
          userBloc: mockUserBloc,
          gymRepository: mockGymRepository,
        ),
        expect: [GymLoaded(gym: fakeGym)],
      );
    });
  });
}

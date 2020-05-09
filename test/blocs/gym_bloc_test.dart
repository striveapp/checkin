import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGymRepository extends Mock implements GymRepository {}

class MockDateUtil extends Mock implements DateUtil {}

void main() {
  group("GymBloc", ()
  {
    GymBloc gymBloc;
    MockGymRepository mockGymRepository;
    String fakeGymId = "bjj";
    Gym fakeGym = Gym(
      host: "test",
      domain: "pepe",
      stripePublicKey: "pk_pk",
    );

    setUp(() {
      mockGymRepository = MockGymRepository();
      when(mockGymRepository.getGym(fakeGymId)).thenAnswer((
          _) {
        return Stream<Gym>.value(fakeGym);
      });
      gymBloc = GymBloc(gymRepository: mockGymRepository, gymId: fakeGymId);
    });

    tearDown(() {
      gymBloc?.close();
    });

    group("GymUpdated", () {
      test("should emit GymLoaded with the loaded gym", () {
        final expectedState = [
          InitialGymState(),
          GymLoaded(gym: fakeGym)
        ];

        expectLater(
          gymBloc,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}

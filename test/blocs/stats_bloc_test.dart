import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/resources/stats_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockStatsRepository extends Mock implements StatsRepository {}
class MockUserBloc extends Mock implements UserBloc {}

void main() {
  group("StatsBloc", () {
    StatsBloc statsBloc;
    MockUserBloc mockUserBloc;
    MockStatsRepository mockStatsRepository;

    User loggedUser = User(
      name: "Logged User",
      email: "test@test.com",
      imageUrl: "someImage",
    );

    setUp(() {
      mockStatsRepository = MockStatsRepository();
      mockUserBloc = MockUserBloc();

      whenListen(mockUserBloc, Stream.fromIterable([UserSuccess(currentUser: loggedUser)]));
    });

    tearDown(() {
      statsBloc?.close();
    });

    test('initial state is StatsInitial', () {
      expect(statsBloc.initialState, StatsUninitialized());
    });

    group("StatsUpdated", () {
      test("should emits StatsLoaded when create a stats bloc", () {
        List<Lesson> attendedLessons = [
          Lesson(timeStart: "19:00", timeEnd: "20:00"),
          Lesson(timeStart: "10:00", timeEnd: "11:00"),
          Lesson(timeStart: "07:15", timeEnd: "08:30"),
        ];

        when(mockStatsRepository.getUserStats(loggedUser.email)).thenAnswer((_) {
          return Stream<UserHistory>.value(
              UserHistory(attendedLessons: attendedLessons));
        });

        statsBloc = StatsBloc(
            statsRepository: mockStatsRepository, userBloc: mockUserBloc);

        final expectedState = [
          StatsUninitialized(),
          StatsLoaded(attendedLessons: attendedLessons),
        ];

        expectLater(
          statsBloc,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}

import 'package:checkin/src/blocs/team/bloc.dart';
import 'package:checkin/src/models/team.dart';
import 'package:checkin/src/resources/team_repository.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockTeamRepository extends Mock implements TeamRepository {}

void main() {
    group("TeamBloc", () {
      TeamBloc teamBloc;
      TeamRepository mockTeamRepository;

      setUp(() {
        mockTeamRepository = MockTeamRepository();
        teamBloc = TeamBloc(teamRepository: mockTeamRepository);
      });

      test('initial state is AuthUninitialized', () {
        expect(teamBloc.initialState, TeamUninitialized());
      });

      group("dispatch Fetch", () {
        final teams = [
          Team("A-Team"),
          Team("X-Man"),
          Team("Avengers"),
        ];
        setUp(() {
          teamBloc.dispatch(Fetch());
        });

        group("TeamUninitialized", () {
          test("when state is should retrieve teams and the final state is TeamLoaded", () {
            final extectedState = {
                TeamUninitialized(),
                TeamLoaded(teams: teams, hasReachedMax: false)
              };

              when(mockTeamRepository.getTeamList()).thenAnswer((_) {
                return Future<List<Team>>.value(teams).asStream();
              });

              expectLater(
                teamBloc.state,
                emitsInOrder(extectedState),
              );
          });
        });

        group("TeamLoaded", () {
            test("should retrieve teams again when Fetch is dispatched again", () {
              final extectedState = {
                TeamUninitialized(),
                TeamLoaded(teams: teams, hasReachedMax: false),
                TeamLoaded(teams: teams, hasReachedMax: false),
              };

              when(mockTeamRepository.getTeamList()).thenAnswer((_) {
                return Future<List<Team>>.value(teams).asStream();
              });

              expectLater(
                teamBloc.state,
                emitsInOrder(extectedState),
              );

              teamBloc.dispatch(Fetch());
            });

            test("should not dispatch TeamLoaded if teams are empty", () {
              final emptyTeams = <Team>[];
              final extectedState = {
                TeamUninitialized(),
                TeamLoaded(teams: emptyTeams, hasReachedMax: false)
              };

              when(mockTeamRepository.getTeamList()).thenAnswer((_) {
                return Future<List<Team>>.value(emptyTeams).asStream();
              });

              expectLater(
                teamBloc.state,
                emitsInOrder(extectedState),
              ).then((_) {
              });

            });
        });
      });
    });
}

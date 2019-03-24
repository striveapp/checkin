import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/team/bloc.dart';
import 'package:checkin/src/models/team.dart';
import 'package:checkin/src/resources/team_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final TeamRepository teamRepository;

  TeamBloc({@required this.teamRepository});

  @override
  Stream<TeamEvent> transform(Stream<TeamEvent> events) {
    return (events as Observable<TeamEvent>)
        .debounce(Duration(milliseconds: 500));
  }

  @override
  TeamState get initialState => TeamUninitialized();

  @override
  Stream<TeamState> mapEventToState(currentState, event) async* {
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is TeamUninitialized) {
          final teams = await _fetchTeams(0, 20);
          yield TeamLoaded(teams: teams, hasReachedMax: false);
        }
        if (currentState is TeamLoaded) {
          final teams = await _fetchTeams(currentState.teams.length, 20);
          yield teams.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : TeamLoaded(
//              teams: currentState.teams + teams, hasReachedMax: false);
              teams: teams, hasReachedMax: false);
        }
      } catch (e) {
        yield TeamError();
      }
    }
  }

  bool _hasReachedMax(TeamState state) =>
      state is TeamLoaded && state.hasReachedMax;

  Future<List<Team>> _fetchTeams(int startIndex, int limit) async {
    return await teamRepository.getTeamList().first;
  }
}
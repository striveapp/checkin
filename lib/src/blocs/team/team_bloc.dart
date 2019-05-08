import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/team/bloc.dart';
import 'package:checkin/src/models/team.dart';
import 'package:checkin/src/resources/team_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

//@TODO: we should remove this code
class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final TeamRepository teamRepository;

  TeamBloc({@required this.teamRepository});

/*  @override
  Stream<TeamEvent> transform(Stream<TeamEvent> events) {
    return (events as Observable<TeamEvent>)
        .debounce(Duration(milliseconds: 500));
  }*/

  @override
  TeamState get initialState => TeamUninitialized();

  @override
  Stream<TeamState> mapEventToState(event) async* {
    debugPrint('Processing event [$event], currentState [$currentState]');

    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is TeamUninitialized) {
          debugPrint('Fetching 20 teams');

          final teams = await _fetchTeams(0, 20);
          yield TeamLoaded(teams: teams, hasReachedMax: false);
        }
        if (currentState is TeamLoaded) {
          yield TeamLoaded(teams: null, hasReachedMax: false);
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
import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/user_event.dart';
import 'package:checkin/src/blocs/user/user_state.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({
    @required this.userRepository
  });

  @override
  UserState get initialState => UserUninitialized();

  @override
  Stream<UserState> mapEventToState(UserState currentState,
      UserEvent event) async* {
    if (event is Create) {
      yield* _mapCreateToState(currentState, event);
    } else if (event is Update) {
      yield* _mapUpdateToState(currentState, event);
    } else if (event is Delete) {
      yield* _mapDeleteTodoToState(currentState, event);
    }
  }

  Stream<UserState> _mapCreateToState(UserState currentState,
      Create event) async* {
    try {
      debugPrint('Create user [' + event.user.toString() + ']');
      await this.userRepository.createUser(event.user.name, event.user.email, event.user.rank, event.user.isOwner);
      yield UserSuccess();
    } catch(e) {
      print('Error during user creation: ' + e.toString());
      yield UserError();
    }

  }

  Stream<UserState> _mapUpdateToState(UserState currentState,
      Update event) async* {
      //@TODO: Implement me!
  }

  Stream<UserState> _mapDeleteTodoToState(UserState currentState,
      Delete event) async* {
      //@TODO: Implement me!
  }

}
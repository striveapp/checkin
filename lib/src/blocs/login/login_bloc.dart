
import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/login/login_event.dart';
import 'package:checkin/src/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc();

  @override
  LoginState get initialState => LoginUninitialized();

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async* {
    // TODO: implement mapEventToState
    yield LoginError();
  }
}
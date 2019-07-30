import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  @override
  NotificationState get initialState => NotificationUninitialized();

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is ShowDialog) {
      yield NotificationMessage(message: event.message);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

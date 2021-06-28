// @dart=2.9

import 'package:bloc/bloc.dart';
import 'package:checkin/src/logging/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  //TODO: we should have a custom logger for bloc events & transitions that is not as verbose

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger.log.e("Error in bloc [$bloc]", error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

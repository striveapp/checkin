import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bloc.dart';

class EditLessonBloc extends Bloc<EditLessonEvent, EditLessonState> {
  EditLessonBloc() : super(EditLessonUninitialized());

  @override
  Stream<EditLessonState> mapEventToState(
    EditLessonEvent event,
  ) async* {
    // TODO:
    // 1. reimplement all the update methods for the lesson here + tests
    // 2. implement retrieve masters event and MastersLoaded state + tests
    // 3. handle errors from the repository
    // 4. replace in the UI the update methods using the ones from this bloc instead
    // 5. use in the UI the new method to retrieve masters
  }
}

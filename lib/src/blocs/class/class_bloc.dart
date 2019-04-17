import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/resources/class_repository.dart';
import 'package:meta/meta.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {

  final ClassRepository classRepository;
  StreamSubscription<List<String>> attendeesSub;

  ClassBloc({
    @required this.classRepository,
  }) {
    attendeesSub = this.classRepository.getClassAttendees().listen((attendees) {
      dispatch(AttendeesUpdated(attendees: attendees));
    });
  }

  @override
  ClassState get initialState => ClassUninitialized();

  @override
  Stream<ClassState> mapEventToState(ClassState currentState, ClassEvent event) async* {
    if (event is AttendeesUpdated) {
      try {
        yield ClassLoaded(attendees: event.attendees);
      } catch(e) {
        print(e);
      }
    }

    if (event is Clear) {
      try {
        await this.classRepository.clearClass();
      } catch(e) {
        print(e);
      }
    }

    if (event is Attend) {
      try {
        await this.classRepository.attendClass(event.name);
      } catch(e) {
        print(e);
      }
    }
  }

  @override
  void dispose() {
    attendeesSub.cancel();
    super.dispose();
  }
}
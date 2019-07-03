import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/class_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:meta/meta.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {

  final ClassRepository classRepository;
  final UserRepository userRepository;
  StreamSubscription<List<User>> attendeesSub;

  ClassBloc({
    @required this.classRepository,
    @required this.userRepository,
  }) {
    attendeesSub = this.classRepository.getClassAttendees().listen((attendees) {
      dispatch(AttendeesUpdated(attendees: attendees));
    });
  }

  @override
  ClassState get initialState => ClassUninitialized();

  @override
  Stream<ClassState> mapEventToState(ClassEvent event) async* {
    if (event is AttendeesUpdated) {
      try {
        yield ClassLoaded(attendees: event.attendees);
      } catch(e) {
        print(e);
      }
    }

    if (event is Confirm) {
      try {
        event.attendees.forEach((attendee) {
         this.userRepository.incrementUserCounter(attendee);
        });
        await this.classRepository.clearClass();
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
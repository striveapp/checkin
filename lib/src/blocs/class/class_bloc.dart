import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/resources/class_repository.dart';
import 'package:meta/meta.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {

  final ClassRepository classRepository;

  ClassBloc({
    @required this.classRepository,
  });

  @override
  ClassState get initialState => ClassUninitialized();

  @override
  Stream<ClassState> mapEventToState(ClassState currentState, ClassEvent event) async* {
    if (event is Fetch) {
      try {
        var attendees = await this.classRepository.getClassAttendees();
        yield ClassLoaded(attendees: attendees);
      } catch(e) {
        print(e);
      }
    }

    if (event is Clear) {
      try {
        await this.classRepository.clearClass();
        yield ClassLoaded(attendees: []);
      } catch(e) {
        print(e);
      }
    }

    if (event is Attend) {
      try {
        await this.classRepository.attenClass(event.name);
        var attendees = await this.classRepository.getClassAttendees();
        yield ClassLoaded(attendees: attendees);
      } catch(e) {
        print(e);
      }
    }
  }
}
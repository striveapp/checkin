import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockLessonRepository extends Mock implements LessonRepository {}

void main() {
  group("RegistryBloc", () {
    RegistryBloc registryBloc;
    MockUserRepository mockUserRepository;
    MockLessonRepository mockLessonRepository;

    String fakeLessonId = "some lessonId";
    Lesson fakeLesson = Lesson(
        id: fakeLessonId,
        name: "A lesson",
        timeStart: "10:00",
        timeEnd: "11:00",
        weekDay: "Monday",
        attendees: [
          Attendee(
              name: "Test1", email: "test1@test.com", imageUrl: "some image", rank: "White"),
          Attendee(
              name: "Test2", email: "test2@test.com", imageUrl: "some image", rank: "White"),
          Attendee(
              name: "Test3", email: "test3@test.com", imageUrl: "some image", rank: "White"),
        ]);

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockLessonRepository = MockLessonRepository();
      registryBloc = RegistryBloc(
          userRepository: mockUserRepository,
          lessonRepository: mockLessonRepository);
    });

    test("initial state is RegistryUninitialized", () {
      expect(registryBloc.initialState, RegistryUninitialized());
    });

    group("when LoadLesson is dispatched", () {
      test(
          "should subscribe to the lesson and dispatch change the state to RegistryLoaded",
          () {
        when(mockLessonRepository.getLesson(fakeLessonId)).thenAnswer((_) {
          return Stream<Lesson>.value(fakeLesson);
        });

        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(lesson: fakeLesson),
        ];

        registryBloc.dispatch(LoadLesson(lessonId: fakeLessonId));

        expectLater(
          registryBloc.state,
          emitsInOrder(expectedState),
        );
      });
    });

    group("when LessonUpdated is dispatched", () {
      test("should change the state to RegistryLoaded", () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoaded(lesson: fakeLesson),
        ];

        registryBloc.dispatch(LessonUpdated(lesson: fakeLesson));

        await expectLater(
          registryBloc.state,
          emitsInOrder(expectedState),
        );
      });
    });

    group("when ConfirmAttendees is dispatched", () {
      test(
          "should increment the user counter for each attendee"
          "and clear the lesson", () async {
        final expectedState = [
          RegistryUninitialized(),
          RegistryLoading()
        ];

        registryBloc.dispatch(ConfirmAttendees(
            lesson: fakeLesson));

        await expectLater(
          registryBloc.state,
          emitsInOrder(expectedState),
        );

        verify(mockLessonRepository.acceptAll(fakeLesson));
      });
    });

    group("when Register is dispatched", () {
      test("should register the user to the lesson", () async {
        final expectedState = [
          RegistryUninitialized(),
        ];

        Attendee fakeAttendee = Attendee(
            name: "Peppe", imageUrl: "that image", email: "pepe@yoyo.com", rank: "White");

        registryBloc
            .dispatch(Register(lessonId: fakeLessonId, attendee: fakeAttendee));

        await expectLater(
            registryBloc.state,
            emitsInOrder(expectedState),
        );

        verify(mockLessonRepository.register(
        fakeLessonId,
        fakeAttendee
        ));
      });
    });

    group("when Unregister is dispatched", () {
      test("should register the user to the lesson", () async {
        final expectedState = [
          RegistryUninitialized(),
        ];

        Attendee fakeAttendee = Attendee(
            name: "Peppe", imageUrl: "that image", email: "pepe@yoyo.com", rank: "White");

        registryBloc
            .dispatch(Unregister(lessonId: fakeLessonId, attendee: fakeAttendee));

        await expectLater(
          registryBloc.state,
          emitsInOrder(expectedState),
        );

        verify(mockLessonRepository.unregister(
            fakeLessonId,
            fakeAttendee
        ));
      });
    });
  });
}

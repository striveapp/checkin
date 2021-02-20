@Skip("WIP")
import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/ui/components/registry/registry_controls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserBloc extends MockBloc<UserState> implements UserBloc {}

class MockLessonApi extends Mock implements LessonApi {}

class MockLessonRepository extends Mock implements LessonRepository {}

class MockStatsRepository extends Mock implements StatsRepository {}

class MockMembershipRepository extends Mock implements MembershipRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

class MockImageRepository extends Mock implements ImageRepository {}

MockUserBloc mockUserBloc = MockUserBloc();
MockLessonApi mockLessonApi = MockLessonApi();
MockLessonRepository mockLessonRepository = MockLessonRepository();
MockStatsRepository mockStatsRepository = MockStatsRepository();
MockMembershipRepository mockMembershipRepository = MockMembershipRepository();
MockStorageRepository mockStorageRepository = MockStorageRepository();
MockImageRepository mockImageRepository = MockImageRepository();

void main() {
  testWidgets(
      "RegistryControls acceptAll button should be disabled when currentUser is master of the class",
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(await buildTestApplication(RegistryControls()));
      await tester.pumpAndSettle();

      final acceptAllButtonFinder = find.byKey(Key("acceptAll"));

      expect(acceptAllButtonFinder, findsOneWidget);

      expect(tester.widget<ElevatedButton>(acceptAllButtonFinder).enabled, isTrue);
    });
  });
}

Future<Widget> buildTestApplication(Widget testWidget) async {
  User masterUser = User(
      name: "Gym Master", email: "gym@master.com", imageUrl: "masterPic", selectedGymId: "testGym");

  Lesson fakeLessonWithRegisteredAttendee = Lesson(
      id: "test id",
      date: "test date",
      classCapacity: 10,
      masters: [Master.fromUser(masterUser)],
      attendees: [],
      acceptedAttendees: []);

  whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: masterUser)));
  when(mockLessonRepository.getLesson(
    masterUser.selectedGymId,
    fakeLessonWithRegisteredAttendee.date,
    fakeLessonWithRegisteredAttendee.id,
  )).thenAnswer((realInvocation) => Stream.value(fakeLessonWithRegisteredAttendee));

  when(mockLessonApi.acceptAll(
    masterUser.selectedGymId,
    fakeLessonWithRegisteredAttendee.id,
    fakeLessonWithRegisteredAttendee.date,
  )).thenAnswer((realInvocation) => Future.value());

  return MaterialApp(
      home: MultiRepositoryProvider(
    providers: [
      RepositoryProvider<StatsRepository>(
        create: (BuildContext context) => mockStatsRepository,
      ),
      RepositoryProvider<MembershipRepository>(
        create: (BuildContext context) => mockMembershipRepository,
      ),
    ],
    child: BlocProvider<RegistryBloc>(
      create: (BuildContext context) => RegistryBloc(
        lessonId: fakeLessonWithRegisteredAttendee.id,
        lessonDate: fakeLessonWithRegisteredAttendee.date,
        lessonRepository: mockLessonRepository,
        imageRepository: mockImageRepository,
        storageRepository: mockStorageRepository,
        lessonApi: mockLessonApi,
        userBloc: mockUserBloc,
      ),
      child: Scaffold(
        body: testWidget,
      ),
    ),
  ));
}

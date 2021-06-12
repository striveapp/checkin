import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/editable_lesson_image.dart';
import 'package:checkin/src/ui/components/registry/lesson_infos.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';

class MockRegistryBloc extends MockBloc<RegistryEvent, RegistryState> implements RegistryBloc {}

class FakeRegistryEvent extends Fake implements RegistryEvent {}

class FakeRegistryState extends Fake implements RegistryState {}

void main() {
  group("LessonInfos", () {
    RegistryBloc registryBloc;

    setUp(() {
      registryBloc = MockRegistryBloc();
    });

    setUpAll(() {
      registerFallbackValue<RegistryEvent>(FakeRegistryEvent());
      registerFallbackValue<RegistryState>(FakeRegistryState());
    });

    tearDown(() {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });

    group("when registry is NOT loaded", () {
      testWidgets("Renders PlaceholderLessonInfos", (tester) async {
        when(() => registryBloc.state).thenReturn(RegistryUninitialized());

        await tester.pumpAppWithScaffold(BlocProvider.value(
          value: registryBloc,
          child: LessonInfos(),
        ));

        expect(find.byType(PlaceholderLessonInfos), findsOneWidget);
      });
    });

    group("when registry is loaded", () {
      Lesson fakeLessonWithoutMasters = Lesson(
        id: "test id",
        date: "test date",
        timeStart: "09:00",
        timeEnd: "10:00",
        name: "Some lesson",
        classCapacity: 10,
        masters: [],
        attendees: [],
        acceptedAttendees: [],
      );

      var fakeUser = User(
        name: "tobuto",
        imageUrl: "test.png",
        email: "tobuto@nellano.it",
        isOwner: false,
      );

      testWidgets("Displays a lesson", (tester) async {
        when(() => registryBloc.state).thenReturn(RegistryLoaded(
          currentLesson: fakeLessonWithoutMasters,
          currentUser: fakeUser,
        ));

        await tester.pumpAppWithScaffold(
          BlocProvider.value(
            value: registryBloc,
            child: LessonInfos(),
          ),
          locale: Locale("en", ""),
        );

        expect(find.text("Some lesson"), findsOneWidget);
        expect(find.text("09:00 - 10:00"), findsOneWidget);
        expect(find.byType(EditableLessonImage), findsNothing);
        expect(find.byType(RoundedImage), findsOneWidget);
      });

      group("and the current user is owner", () {
        var fakeMaster = User(
          name: "tobuto",
          imageUrl: "test.png",
          email: "tobuto@nellano.it",
          isOwner: true,
        );

        testWidgets("Renders EditableLessonImage", (tester) async {
          when(() => registryBloc.state).thenReturn(RegistryLoaded(
            currentLesson: fakeLessonWithoutMasters,
            currentUser: fakeMaster,
          ));

          await tester.pumpAppWithScaffold(BlocProvider.value(
            value: registryBloc,
            child: LessonInfos(),
          ));

          expect(find.byType(EditableLessonImage), findsOneWidget);
        });
      });

      group("when the lessons has masters", () {
        Lesson fakeLessonWithMasters = Lesson(
          id: "test id",
          date: "test date",
          timeStart: "09:00",
          timeEnd: "10:00",
          name: "Some lesson",
          classCapacity: 10,
          masters: [
            Master(
              name: "Tha master",
              email: "test@maste.com",
            )
          ],
          attendees: [],
          acceptedAttendees: [],
        );
        testWidgets("Displays the master", (tester) async {
          when(() => registryBloc.state).thenReturn(RegistryLoaded(
            currentLesson: fakeLessonWithMasters,
            currentUser: fakeUser,
          ));

          await tester.pumpAppWithScaffold(BlocProvider.value(
            value: registryBloc,
            child: LessonInfos(),
          ));

          expect(find.text("Tha master"), findsOneWidget);
        });
      });

      group("when the lessons has NO timeEnd", () {
        Lesson fakeLessonWithoutTimeEnd = Lesson(
          id: "test id",
          date: "test date",
          timeStart: "09:00",
          name: "Some lesson",
          classCapacity: 10,
          masters: [
            Master(
              name: "Tha master",
              email: "test@maste.com",
            )
          ],
          attendees: [],
          acceptedAttendees: [],
        );
        testWidgets("Displays the timeStart", (tester) async {
          when(() => registryBloc.state).thenReturn(RegistryLoaded(
            currentLesson: fakeLessonWithoutTimeEnd,
            currentUser: fakeUser,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(
              value: registryBloc,
              child: LessonInfos(),
            ),
            locale: Locale("en", ""),
          );

          expect(find.text("Starting at 09:00"), findsOneWidget);
        });
      });
    });
  });
}

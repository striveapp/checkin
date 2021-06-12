import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/registry/close_lesson_button.dart';
import 'package:checkin/src/ui/components/registry/delete_lesson/delete_lesson_button.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_button.dart';
import 'package:checkin/src/ui/components/registry/lesson_actions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';

class MockRegistryBloc extends MockBloc<RegistryEvent, RegistryState> implements RegistryBloc {}

class FakeRegistryEvent extends Fake implements RegistryEvent {}

class FakeRegistryState extends Fake implements RegistryState {}

void main() {
  group("LessonActions", () {
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
      testWidgets("Renders EmptyWidget", (tester) async {
        when(() => registryBloc.state).thenReturn(RegistryUninitialized());

        await tester.pumpAppWithScaffold(BlocProvider.value(
          value: registryBloc,
          child: LessonActions(),
        ));

        expect(find.byType(EmptyWidget), findsOneWidget);
      });
    });

    group("when registry is loaded", () {
      Lesson baseLesson = Lesson(
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

      var baseUser = User(
        name: "tobuto",
        imageUrl: "test.png",
        email: "tobuto@nellano.it",
        isOwner: false,
      );

      group("and the class isClosed", () {
        testWidgets("only renders DeleteLessonButton", (tester) async {
          when(() => registryBloc.state).thenReturn(RegistryLoaded(
            currentLesson: baseLesson.copyWith(isClosed: true),
            currentUser: baseUser,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(
              value: registryBloc,
              child: LessonActions(),
            ),
          );

          expect(find.byType(EditLessonButton), findsNothing);
          expect(find.byType(CloseLessonButton), findsNothing);
          expect(find.byType(DeleteLessonButton), findsOneWidget);
        });
      });

      group("and the class NOT isClosed", () {
        group("and the user is owner", () {
          testWidgets("only renders EditLessonButton and CloseLessonButton", (tester) async {
            when(() => registryBloc.state).thenReturn(RegistryLoaded(
              currentLesson: baseLesson.copyWith(isClosed: false),
              currentUser: baseUser.copyWith(isOwner: true),
            ));

            await tester.pumpAppWithScaffold(
              BlocProvider.value(
                value: registryBloc,
                child: LessonActions(),
              ),
            );

            expect(find.byType(EditLessonButton), findsOneWidget);
            expect(find.byType(CloseLessonButton), findsOneWidget);
            expect(find.byType(DeleteLessonButton), findsNothing);
          });
        });
        group("and the user is NOT owner", () {
          testWidgets("renders nothing", (tester) async {
            when(() => registryBloc.state).thenReturn(RegistryLoaded(
              currentLesson: baseLesson.copyWith(isClosed: false),
              currentUser: baseUser.copyWith(isOwner: false),
            ));

            await tester.pumpAppWithScaffold(
              BlocProvider.value(
                value: registryBloc,
                child: LessonActions(),
              ),
            );

            expect(find.byType(EditLessonButton), findsNothing);
            expect(find.byType(CloseLessonButton), findsNothing);
            expect(find.byType(DeleteLessonButton), findsNothing);
          });
        });
      });
    });
  });
}

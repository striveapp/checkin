import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/stats/graduate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../pump_app.dart';

class MockGraduationBloc extends MockBloc<GraduationEvent, GraduationState>
    implements GraduationBloc {}

class FakeGraduationEvent extends Fake implements GraduationEvent {}

class FakeGraduationState extends Fake implements GraduationState {}

void main() {
  group("GraduateDialog", () {
    GraduationBloc graduationBloc;

    setUp(() {
      graduationBloc = MockGraduationBloc();
    });

    setUpAll(() {
      registerFallbackValue<GraduationEvent>(FakeGraduationEvent());
      registerFallbackValue<GraduationState>(FakeGraduationState());
    });

    tearDown(() {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });

    group("when graduation is NOT loaded", () {
      testWidgets("Renders LoadingIndicator", (tester) async {
        when(() => graduationBloc.state).thenReturn(InitialGraduationState());

        await tester.pumpAppWithScaffold(
          BlocProvider.value(value: graduationBloc, child: GraduateDialog()),
        );

        expect(find.byType(LoadingIndicator), findsOneWidget);
      });
    });

    group("when graduation is loaded", () {
      testWidgets("Renders AlertDialog", (tester) async {
        when(() => graduationBloc.state).thenReturn(GraduationLoaded(
          currentGrade: Grade.brown,
          nextGrade: Grade.black,
          attendedLessonsForGrade: 0,
          forNextLevel: 3,
          isVisible: true,
        ));

        await tester.pumpAppWithScaffold(
          BlocProvider.value(value: graduationBloc, child: GraduateDialog()),
          locale: Locale("en", ""),
        );

        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('The student attended 0 of 3 classes required for graduation'),
            findsOneWidget);
      });

      testWidgets('when graduateButton is tapped dispatch Graduate event', (tester) async {
        when(() => graduationBloc.state).thenReturn(GraduationLoaded(
          currentGrade: Grade.brown,
          nextGrade: Grade.black,
          attendedLessonsForGrade: 0,
          forNextLevel: 3,
          isVisible: true,
        ));

        await tester.pumpAppWithScaffold(
            BlocProvider.value(value: graduationBloc, child: GraduateDialog()));

        await tester.tap(find.byKey(Key("graduateButton")));
        await tester.pumpAndSettle();

        verify(() => graduationBloc.add(Graduate(newGrade: Grade.black))).called(1);
      });
    });
  });
}

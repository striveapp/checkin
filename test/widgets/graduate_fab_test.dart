// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/stats/graduate_dialog.dart';
import 'package:checkin/src/ui/components/stats/graduate_fab.dart';
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
  group("GraduateFab", () {
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

    group("when state is InitialGraduationState", () {
      testWidgets("Renders EmptyWidget", (tester) async {
        when(() => graduationBloc.state).thenReturn(InitialGraduationState());

        await tester.pumpAppWithScaffold(
          BlocProvider.value(value: graduationBloc, child: GraduateFab()),
        );

        expect(find.byType(EmptyWidget), findsOneWidget);
      });
    });

    group("when state is GraduationLoaded", () {
      group("when GraduateFab is NOT visible", () {
        testWidgets("Renders EmptyWidget", (tester) async {
          when(() => graduationBloc.state).thenReturn(GraduationLoaded(
            currentGrade: Grade.blue,
            nextGrade: Grade.purple,
            attendedLessonsForGrade: 0,
            forNextLevel: 10,
            isVisible: false,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: graduationBloc, child: GraduateFab()),
          );

          expect(find.byType(EmptyWidget), findsOneWidget);
        });
      });

      group("when GraduateFab is visible", () {
        setUp(() {
          when(() => graduationBloc.state).thenReturn(GraduationLoaded(
            currentGrade: Grade.blue,
            nextGrade: Grade.purple,
            attendedLessonsForGrade: 0,
            forNextLevel: 10,
            isVisible: true,
          ));
        });

        testWidgets("Renders GraduateFabView", (tester) async {
          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: graduationBloc, child: GraduateFab()),
          );

          expect(find.byType(GraduateFabView), findsOneWidget);
        });

        testWidgets("opens GraduateDialog when tap on fab", (tester) async {
          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: graduationBloc, child: GraduateFab()),
          );
          await tester.tap(find.byKey(Key("graduateFab")));
          await tester.pumpAndSettle();

          expect(find.byType(GraduateDialog), findsOneWidget);
        });
      });
    });
  });
}

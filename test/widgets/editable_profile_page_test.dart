// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/editable_date_time_field.dart';
import 'package:checkin/src/ui/components/editable_image.dart';
import 'package:checkin/src/ui/components/editable_text_field.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/pages/editable_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../pump_app.dart';

class MockProfileBloc extends MockBloc<ProfileEvent, ProfileState> implements ProfileBloc {}

class FakeProfileEvent extends Fake implements ProfileEvent {}

class FakeProfileState extends Fake implements ProfileState {}

void main() {
  group("EditableProfilePage", () {
    ProfileBloc profileBloc;

    setUp(() {
      profileBloc = MockProfileBloc();
    });

    setUpAll(() {
      registerFallbackValue<ProfileEvent>(FakeProfileEvent());
      registerFallbackValue<ProfileState>(FakeProfileState());
    });

    tearDown(() {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });

    group("when profile is NOT loaded", () {
      testWidgets("Renders EmptyWidget", (tester) async {
        when(() => profileBloc.state).thenReturn(InitialProfileState());

        await tester.pumpAppWithScaffold(
          BlocProvider.value(value: profileBloc, child: EditableProfilePage()),
        );

        expect(find.byType(EmptyWidget), findsOneWidget);
      });
    });

    group("when profile is loaded", () {
      User fakeUser = User(
          email: "requiredEmail", imageUrl: "requiredImage", grade: Grade.blue, name: "tobuto");
      testWidgets("Renders Editable Widgets", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeUser,
          isCurrentUser: true,
        ));

        await tester.pumpAppWithScaffold(
          BlocProvider.value(value: profileBloc, child: EditableProfilePage()),
          locale: Locale("en", ""),
        );

        expect(find.byType(EditableImage), findsOneWidget);
        expect(find.byType(EditableTextField), findsNWidgets(2));
        expect(find.byType(EditableDateTimeField), findsOneWidget);
        expect(find.text('tobuto'), findsOneWidget);
        expect(find.text('Blue belt'), findsOneWidget);
      });

      // testWidgets('when graduateButton is tapped dispatch Graduate event', (tester) async {
      //   when(() => profileBloc.state).thenReturn(GraduationLoaded(
      //     currentGrade: Grade.brown,
      //     nextGrade: Grade.black,
      //     attendedLessonsForGrade: 0,
      //     forNextLevel: 3,
      //     isVisible: true,
      //   ));
      //
      //   await tester.pumpAppWithScaffold(
      //       BlocProvider.value(value: profileBloc, child: GraduateDialog()));
      //
      //   await tester.tap(find.byKey(Key("graduateButton")));
      //   await tester.pumpAndSettle();
      //
      //   verify(() => profileBloc.add(Graduate(newGrade: Grade.black))).called(1);
      // });
    });
  });
}

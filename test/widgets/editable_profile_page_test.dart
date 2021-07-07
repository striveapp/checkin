// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/basic_text_field.dart';
import 'package:checkin/src/ui/components/date_time_field.dart';
import 'package:checkin/src/ui/components/editable_image.dart';
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
      testWidgets("Renders PlaceholderProfile", (tester) async {
        when(() => profileBloc.state).thenReturn(InitialProfileState());

        await tester.pumpAppWithScaffold(
          BlocProvider.value(value: profileBloc, child: EditableProfilePage()),
        );

        expect(find.byType(PlaceholderProfile), findsOneWidget);
      });
    });

    group("when profile is loaded", () {
      User fakeUser = User(
        email: "requiredEmail",
        imageUrl: "requiredImage",
        grade: Grade.blue,
        name: "tobuto",
      );

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
        expect(find.byType(BasicTextField), findsNWidgets(2));
        expect(find.byType(DateTimeField), findsOneWidget);
        expect(find.text('tobuto'), findsOneWidget);
        expect(find.text('Blue belt'), findsOneWidget);
      });

      testWidgets("saves a new name", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeUser,
          isCurrentUser: true,
        ));

        await tester.pumpAppWithScaffold(
          BlocProvider.value(value: profileBloc, child: EditableProfilePage()),
          locale: Locale("en", ""),
        );

        expect(find.text('tobuto'), findsOneWidget);

        var nameTextField = find.byKey(Key("editName"));
        await tester.enterText(nameTextField, 'nellano');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(find.text('nellano'), findsOneWidget);
      });

      group("when inserting a new name", () {
        testWidgets("and the name is valid", (tester) async {
          when(() => profileBloc.state).thenReturn(ProfileLoaded(
            profileUser: fakeUser,
            isCurrentUser: true,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: profileBloc, child: EditableProfilePage()),
            locale: Locale("en", ""),
          );

          expect(find.text('tobuto'), findsOneWidget);

          var nameTextField = find.byKey(Key("editName"));
          await tester.enterText(nameTextField, 'nellano');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          expect(find.text('nellano'), findsOneWidget);
        });

        testWidgets("and the name is NOT valid", (tester) async {
          when(() => profileBloc.state).thenReturn(ProfileLoaded(
            profileUser: fakeUser,
            isCurrentUser: true,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: profileBloc, child: EditableProfilePage()),
            locale: Locale("en", ""),
          );

          expect(find.text('tobuto'), findsOneWidget);

          var nameTextField = find.byKey(Key("editName"));
          await tester.enterText(nameTextField, "");
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          expect(find.text('This does not look like a valid name'), findsOneWidget);
        });
      });

      group("when inserting a weight", () {
        testWidgets("and the weight is NOT valid", (tester) async {
          when(() => profileBloc.state).thenReturn(ProfileLoaded(
            profileUser: fakeUser,
            isCurrentUser: true,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: profileBloc, child: EditableProfilePage()),
            locale: Locale("en", ""),
          );

          var nameTextField = find.byKey(Key("editWeight"));
          await tester.enterText(nameTextField, '00');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          expect(find.text('This does not look like a valid weight'), findsOneWidget);
        });

        // testWidgets("and the weight is valid", (tester) async {
        //   when(() => profileBloc.state).thenReturn(ProfileLoaded(
        //     profileUser: fakeUser,
        //     isCurrentUser: true,
        //   ));
        //
        //   await tester.pumpAppWithScaffold(
        //     BlocProvider.value(value: profileBloc, child: EditableProfilePage()),
        //     locale: Locale("en", ""),
        //   );
        //
        //   expect(find.text('tobuto'), findsOneWidget);
        //
        //   var nameTextField = find.byKey(Key("editName"));
        //   await tester.enterText(nameTextField, 'nellano');
        //   await tester.testTextInput.receiveAction(TextInputAction.done);
        //   await tester.pump();
        //
        //   expect(find.text('nellano'), findsOneWidget);
        // });
      });
    });
  });
}

// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/basic_text_field.dart';
import 'package:checkin/src/ui/components/date_time_field.dart';
import 'package:checkin/src/ui/components/editable_image.dart';
import 'package:checkin/src/ui/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';

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
          BlocProvider.value(value: profileBloc, child: ProfilePage()),
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
          BlocProvider.value(value: profileBloc, child: ProfilePage()),
          locale: Locale("en", ""),
        );

        expect(find.byType(EditableImage), findsOneWidget);
        expect(find.byType(BasicTextField), findsNWidgets(2));
        expect(find.byType(DateTimeField), findsOneWidget);
        expect(find.text('tobuto'), findsOneWidget);
        expect(find.text('Blue belt'), findsOneWidget);
      });

      group("when inserting a new name", () {
        testWidgets("and the name is valid", (tester) async {
          when(() => profileBloc.state).thenReturn(ProfileLoaded(
            profileUser: fakeUser,
            isCurrentUser: true,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: profileBloc, child: ProfilePage()),
            locale: Locale("en", ""),
          );

          expect(find.text('tobuto'), findsOneWidget);

          var nameTextField = find.byKey(Key("editName"));
          await tester.enterText(nameTextField, 'nellano');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          expect(find.text('nellano'), findsOneWidget);
          verify(() => profileBloc.add(UpdateName(userEmail: fakeUser.email, newName: "nellano")))
              .called(1);
        });

        testWidgets("and the name is NOT valid", (tester) async {
          when(() => profileBloc.state).thenReturn(ProfileLoaded(
            profileUser: fakeUser,
            isCurrentUser: true,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: profileBloc, child: ProfilePage()),
            locale: Locale("en", ""),
          );

          expect(find.text('tobuto'), findsOneWidget);

          var nameTextField = find.byKey(Key("editName"));
          await tester.enterText(nameTextField, "");
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          expect(find.text('This does not look like a valid name'), findsOneWidget);
          verifyNever(() => profileBloc.add(UpdateName(userEmail: fakeUser.email, newName: "")));
        });
      });

      group("when inserting a weight", () {
        group("and the weight is NOT valid", () {
          testWidgets("and when is NOT a number", (tester) async {
            when(() => profileBloc.state).thenReturn(ProfileLoaded(
              profileUser: fakeUser,
              isCurrentUser: true,
            ));

            await tester.pumpAppWithScaffold(
              BlocProvider.value(value: profileBloc, child: ProfilePage()),
              locale: Locale("en", ""),
            );

            var nameTextField = find.byKey(Key("editWeight"));
            await tester.enterText(nameTextField, 'not_a_number');
            await tester.testTextInput.receiveAction(TextInputAction.done);
            await tester.pump();

            expect(find.text('This does not look like a valid weight'), findsOneWidget);
          });

          testWidgets("and when is lower then zero", (tester) async {
            when(() => profileBloc.state).thenReturn(ProfileLoaded(
              profileUser: fakeUser,
              isCurrentUser: true,
            ));

            await tester.pumpAppWithScaffold(
              BlocProvider.value(value: profileBloc, child: ProfilePage()),
              locale: Locale("en", ""),
            );

            var nameTextField = find.byKey(Key("editWeight"));
            await tester.enterText(nameTextField, '-1');
            await tester.testTextInput.receiveAction(TextInputAction.done);
            await tester.pump();

            expect(find.text('This does not look like a valid weight'), findsOneWidget);
          });

          testWidgets("and when is more than 499", (tester) async {
            when(() => profileBloc.state).thenReturn(ProfileLoaded(
              profileUser: fakeUser,
              isCurrentUser: true,
            ));

            await tester.pumpAppWithScaffold(
              BlocProvider.value(value: profileBloc, child: ProfilePage()),
              locale: Locale("en", ""),
            );

            var nameTextField = find.byKey(Key("editWeight"));
            await tester.enterText(nameTextField, '500');
            await tester.testTextInput.receiveAction(TextInputAction.done);
            await tester.pump();

            expect(find.text('This does not look like a valid weight'), findsOneWidget);
          });
        });

        testWidgets("and the weight is valid", (tester) async {
          when(() => profileBloc.state).thenReturn(ProfileLoaded(
            profileUser: fakeUser,
            isCurrentUser: true,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: profileBloc, child: ProfilePage()),
            locale: Locale("en", ""),
          );

          var nameTextField = find.byKey(Key("editWeight"));
          await tester.enterText(nameTextField, '80.5');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          expect(find.text('80.5'), findsOneWidget);
          verify(() => profileBloc.add(UpdateWeight(userEmail: fakeUser.email, newWeight: 80.5)))
              .called(1);
        });
      });

      group("when inserting the birthday", () {
        group("and the birthday is NOT valid", () {
          testWidgets("because is NOT a valid date", (tester) async {});
        });

        testWidgets("and the date is valid", (tester) async {
          when(() => profileBloc.state).thenReturn(ProfileLoaded(
            profileUser: fakeUser,
            isCurrentUser: true,
          ));

          await tester.pumpAppWithScaffold(
            BlocProvider.value(value: profileBloc, child: ProfilePage()),
            locale: Locale("en", ""),
          );

          var dateField = find.byKey(Key("editBirthday"));
          await tester.tap(dateField);
          await tester.pumpAndSettle();
          await tester.tap(find.text("OK"));
          await tester.pump();

          DateTime now = new DateTime.now();
          DateTime date = new DateTime(now.year, now.month, now.day);

          verify(() =>
                  profileBloc.add(UpdateBirthday(userEmail: fakeUser.email, newBirthday: date)))
              .called(1);
        });
      });
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/newslist/modal/header.dart';
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
  group("Header", () {
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

        await tester.pumpAppWithScaffold(BlocProvider.value(
            value: profileBloc,
            child: Header(
              content: "test",
              isPublishable: true,
            )));

        expect(find.byType(EmptyWidget), findsOneWidget);
      });
    });

    group("when profile is loaded", () {
      var fakeUser = User(
        name: "tobuto",
        imageUrl: "test.png",
        email: "tobuto@nellano.it",
        isOwner: false,
      );

      group("and the news is NOT publishable", () {
        testWidgets("Renders ElevatedButton disabled", (tester) async {
          when(() => profileBloc.state).thenReturn(ProfileLoaded(
            profileUser: fakeUser,
            isCurrentUser: true,
          ));

          await tester.pumpAppWithScaffold(BlocProvider.value(
              value: profileBloc,
              child: Header(
                content: "test",
                isPublishable: false,
              )));

          expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, isFalse);
        });
      });
      group("and the news is publishable", () {
        testWidgets("Renders ElevatedButton enabled", (tester) async {
          when(() => profileBloc.state).thenReturn(ProfileLoaded(
            profileUser: fakeUser,
            isCurrentUser: true,
          ));

          await tester.pumpAppWithScaffold(BlocProvider.value(
              value: profileBloc,
              child: Header(
                content: "test",
                isPublishable: true,
              )));

          expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, isTrue);
        });
      });
    });
  });
}

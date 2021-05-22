import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/news/news_state.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/newslist/news_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';

class MockProfileBloc extends MockBloc<ProfileEvent, ProfileState> implements ProfileBloc {}

class FakeProfileEvent extends Fake implements ProfileEvent {}

class FakeProfileState extends Fake implements ProfileState {}

class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

class FakeNewsEvent extends Fake implements NewsEvent {}

class FakeNewsState extends Fake implements NewsState {}

void main() {
  setUpAll(() {
    registerFallbackValue<ProfileEvent>(FakeProfileEvent());
    registerFallbackValue<ProfileState>(FakeProfileState());
    registerFallbackValue<NewsEvent>(FakeNewsEvent());
    registerFallbackValue<NewsState>(FakeNewsState());
  });

  group("NewsActionMenu", () {
    ProfileBloc profileBloc;

    setUp(() {
      profileBloc = MockProfileBloc();
    });

    tearDown(() {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });

    testWidgets("Renders EmptyWidget when the profile is not loaded yet", (tester) async {
      when(() => profileBloc.state).thenReturn(InitialProfileState());

      await tester.pumpApp(BlocProvider.value(value: profileBloc, child: NewsActionMenu()));

      expect(find.byType(EmptyWidget), findsWidgets);
    });

    group("when is NOT owner", () {
      var fakeUser = User(
        name: "tobuto",
        imageUrl: "test.png",
        email: "tobuto@nellano.it",
        isOwner: false,
      );

      testWidgets("Renders EmptyWidget", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeUser,
          isCurrentUser: true,
        ));

        await tester.pumpAppWithScaffold(BlocProvider.value(value: profileBloc, child: NewsActionMenu()));

        expect(find.byType(EmptyWidget), findsOneWidget);
      });
    });

    group("when is owner", () {
      var fakeOwner = User(
        name: "damaster",
        imageUrl: "test.png",
        email: "damaster@nellano.it",
        isOwner: true,
      );

      testWidgets("Renders IconButton", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeOwner,
          isCurrentUser: true,
        ));

        await tester.pumpAppWithScaffold(BlocProvider.value(value: profileBloc, child: NewsActionMenu()));

        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets("open NewsActionModal when tap on NewsActionMenu", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeOwner,
          isCurrentUser: true,
        ));

        await tester.pumpAppWithScaffold(BlocProvider.value(value: profileBloc, child: NewsActionMenu()));

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(find.byKey(Key("newsActionModal")), findsOneWidget);
      });
    });
  });
}

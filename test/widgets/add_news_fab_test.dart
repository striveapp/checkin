import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/news/news_state.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/newslist/add_news_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../pump_app.dart';

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

  group("AddNewsFab", () {
    ProfileBloc profileBloc;
    NewsBloc newsBloc;

    setUp(() {
      profileBloc = MockProfileBloc();
      newsBloc = MockNewsBloc();
    });

    tearDown(() {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });

    testWidgets("Renders EmptyWidget when the profile is not loaded yet", (tester) async {
      when(() => profileBloc.state).thenReturn(InitialProfileState());

      await tester.pumpApp(BlocProvider.value(value: profileBloc, child: AddNewsFab()));

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

        await tester.pumpApp(BlocProvider.value(value: profileBloc, child: AddNewsFab()));

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

      testWidgets("Renders EmptyWidget", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeOwner,
          isCurrentUser: true,
        ));

        await tester.pumpApp(BlocProvider.value(value: profileBloc, child: AddNewsFab()));

        expect(find.byKey(Key("addNewsFab")), findsOneWidget);
      });

      testWidgets("open AddNewsModal when tap on AddNewsFab", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeOwner,
          isCurrentUser: true,
        ));

        await tester.pumpApp(MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: profileBloc,
            ),
            BlocProvider.value(
              value: newsBloc,
            ),
          ],
          child: AddNewsFab(),
        ));

        await tester.tap(find.byKey(Key("addNewsFab")));
        await tester.pumpAndSettle();

        expect(find.byKey(Key("addNewsModal")), findsOneWidget);
      });
    });
  });
}

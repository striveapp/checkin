import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/news/news_state.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/news.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/newslist/empty_news_list.dart';
import 'package:checkin/src/ui/components/newslist/news_list.dart';
import 'package:checkin/src/ui/components/newslist/news_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';

class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

class FakeNewsEvent extends Fake implements NewsEvent {}

class FakeNewsState extends Fake implements NewsState {}

class MockProfileBloc extends MockBloc<ProfileEvent, ProfileState> implements ProfileBloc {}

class FakeProfileEvent extends Fake implements ProfileEvent {}

class FakeProfileState extends Fake implements ProfileState {}

// examples: https://github.com/felangel/fluttersaurus/blob/master/test/search/view/search_form_test.dart

void main() {
  setUpAll(() {
    registerFallbackValue<NewsEvent>(FakeNewsEvent());
    registerFallbackValue<NewsState>(FakeNewsState());
    registerFallbackValue<ProfileEvent>(FakeProfileEvent());
    registerFallbackValue<ProfileState>(FakeProfileState());
  });

  group("NewsList", () {
    NewsBloc newsBloc;
    ProfileBloc profileBloc;

    var fakeUser = User(
      name: "tobuto",
      imageUrl: "test.png",
      email: "tobuto@nellano.it",
      isOwner: false,
    );

    setUp(() {
      newsBloc = MockNewsBloc();
      profileBloc = MockProfileBloc();
    });

    tearDown(() {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });

    testWidgets("Renders PlaceholderNews when news state is NewsInitial", (tester) async {
      when(() => newsBloc.state).thenReturn(NewsInitial());

      await tester.pumpApp(BlocProvider.value(value: newsBloc, child: NewsList()));

      expect(find.byType(PlaceholderNews), findsWidgets);
    });

    group("when there are no news", () {
      testWidgets("Renders EmptyNewsList", (tester) async {
        when(() => newsBloc.state).thenReturn(NewsLoaded(newsList: [], hasPinnedNews: false));

        await tester.pumpApp(BlocProvider.value(value: newsBloc, child: NewsList()));

        expect(find.byType(EmptyNewsList), findsOneWidget);
        expect(find.byType(NewsView), findsNothing);
      });
    });

    group("when Author has grade", () {
      testWidgets("Renders NewsView with grade", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeUser,
          isCurrentUser: true,
        ));

        when(() => newsBloc.state).thenReturn(NewsLoaded(
          newsList: [
            News(
              id: "fake-id",
              content: "fake-news",
              author: Author(imageUrl: "fake-img", name: "fake-name", grade: Grade.black),
              timestamp: 123,
              isPinned: false,
            )
          ],
          hasPinnedNews: false,
        ));

        await tester.pumpApp(
          MultiBlocProvider(providers: [
            BlocProvider.value(value: newsBloc),
            BlocProvider.value(value: profileBloc),
          ], child: NewsList()),
        );

        expect(find.byType(NewsView), findsWidgets);
        expect(find.byKey(Key("authorGrade")), findsOneWidget);
      });
    });

    group("when there is a Pinned News", () {
      testWidgets("Renders NewsView with PinnedBadge", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeUser,
          isCurrentUser: true,
        ));

        when(() => newsBloc.state).thenReturn(NewsLoaded(newsList: [
          News(
            id: "fake-id",
            content: "fake-news",
            author: Author(imageUrl: "fake-img", name: "fake-name", grade: Grade.black),
            timestamp: 123,
            isPinned: true,
          )
        ], hasPinnedNews: true));

        await tester.pumpApp(
          MultiBlocProvider(providers: [
            BlocProvider.value(value: newsBloc),
            BlocProvider.value(value: profileBloc),
          ], child: NewsList()),
        );

        expect(find.byType(NewsView), findsWidgets);
        expect(find.byType(PinnedBadge), findsOneWidget);
      });
    });

    group("when Author has NO grade", () {
      testWidgets("Renders NewsView without grade", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeUser,
          isCurrentUser: true,
        ));
        when(() => newsBloc.state).thenReturn(NewsLoaded(
          newsList: [
            News(
              id: "fake-id",
              content: "fake-news",
              author: Author(imageUrl: "fake-img", name: "fake-name"),
              timestamp: 123,
              isPinned: false,
            )
          ],
          hasPinnedNews: false,
        ));

        await tester.pumpApp(MultiBlocProvider(providers: [
          BlocProvider.value(value: newsBloc),
          BlocProvider.value(value: profileBloc),
        ], child: NewsList()));

        expect(find.byType(NewsView), findsWidgets);
        expect(find.byKey(Key("authorGrade")), findsNothing);
      });
    });
  });
}

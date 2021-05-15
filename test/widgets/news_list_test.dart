import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/news/news_state.dart';
import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/news.dart';
import 'package:checkin/src/ui/components/newslist/empty_news_list.dart';
import 'package:checkin/src/ui/components/newslist/news_list.dart';
import 'package:checkin/src/ui/components/newslist/news_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../pump_app.dart';

class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

class FakeNewsEvent extends Fake implements NewsEvent {}

class FakeNewsState extends Fake implements NewsState {}

// examples: https://github.com/felangel/fluttersaurus/blob/master/test/search/view/search_form_test.dart

void main() {
  setUpAll(() {
    registerFallbackValue<NewsEvent>(FakeNewsEvent());
    registerFallbackValue<NewsState>(FakeNewsState());
  });

  group("NewsList", () {
    NewsBloc newsBloc;

    setUp(() {
      newsBloc = MockNewsBloc();
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
        when(() => newsBloc.state).thenReturn(NewsLoaded(newsList: []));

        await tester.pumpApp(BlocProvider.value(value: newsBloc, child: NewsList()));

        expect(find.byType(EmptyNewsList), findsOneWidget);
        expect(find.byType(NewsView), findsNothing);
      });
    });

    group("when Author has grade", () {
      testWidgets("Renders NewsView with grade", (tester) async {
        when(() => newsBloc.state).thenReturn(NewsLoaded(newsList: [
          News(
            id: "fake-id",
            content: "fake-news",
            author: Author(imageUrl: "fake-img", name: "fake-name", grade: Grade.black),
            timestamp: 123,
            isPinned: false,
          )
        ]));

        await tester.pumpApp(BlocProvider.value(value: newsBloc, child: NewsList()));

        expect(find.byType(NewsView), findsWidgets);
        expect(find.byKey(Key("authorGrade")), findsOneWidget);
      });
    });

    group("when Author has NO grade", () {
      testWidgets("Renders NewsView without grade", (tester) async {
        when(() => newsBloc.state).thenReturn(NewsLoaded(newsList: [
          News(
            id: "fake-id",
            content: "fake-news",
            author: Author(imageUrl: "fake-img", name: "fake-name"),
            timestamp: 123,
            isPinned: false,
          )
        ]));

        await tester.pumpApp(BlocProvider.value(value: newsBloc, child: NewsList()));

        expect(find.byType(NewsView), findsWidgets);
        expect(find.byKey(Key("authorGrade")), findsNothing);
      });
    });
  });
}

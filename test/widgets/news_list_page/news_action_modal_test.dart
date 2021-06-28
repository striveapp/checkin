// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/news/news_state.dart';
import 'package:checkin/src/ui/components/newslist/action_modal/news_action_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';

class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

class FakeNewsEvent extends Fake implements NewsEvent {}

class FakeNewsState extends Fake implements NewsState {}

void main() {
  setUpAll(() {
    registerFallbackValue<NewsEvent>(FakeNewsEvent());
    registerFallbackValue<NewsState>(FakeNewsState());
  });

  group("NewsActionModal", () {
    NewsBloc newsBloc;

    setUp(() {
      newsBloc = MockNewsBloc();
    });

    tearDown(() {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });

    testWidgets("Adds DeleteNews when the delete action is tapped", (tester) async {
      await tester.pumpAppWithScaffold(BlocProvider.value(
          value: newsBloc,
          child: NewsActionModal(
            newsId: 'fake-news',
            isPinned: false,
            hasPinnedNews: false,
          )));

      await tester.tap(find.byKey(Key("deleteNewsAction")));
      await tester.pumpAndSettle();

      verify(() => newsBloc.add(NewsEvent.deleteNews(id: 'fake-news'))).called(1);
    });

    testWidgets("Adds PinNews when the pin action is tapped", (tester) async {
      await tester.pumpAppWithScaffold(BlocProvider.value(
          value: newsBloc,
          child: NewsActionModal(
            newsId: 'fake-news',
            isPinned: false,
            hasPinnedNews: false,
          )));

      await tester.tap(find.byKey(Key("pinNewsAction")));
      await tester.pumpAndSettle();

      verify(() => newsBloc.add(NewsEvent.pinNews(id: 'fake-news'))).called(1);
    });

    testWidgets("Adds UnpinNews when the unpin action is tapped", (tester) async {
      await tester.pumpAppWithScaffold(BlocProvider.value(
          value: newsBloc,
          child: NewsActionModal(
            newsId: 'fake-news',
            isPinned: true,
            hasPinnedNews: false,
          )));

      await tester.tap(find.byKey(Key("unpinNewsAction")));
      await tester.pumpAndSettle();

      verify(() => newsBloc.add(NewsEvent.unpinNews(id: 'fake-news'))).called(1);
    });

    testWidgets(
        "Adds ReplacePinnedNews when the pin news action is tapped and another news is pinned",
        (tester) async {
      await tester.pumpAppWithScaffold(BlocProvider.value(
          value: newsBloc,
          child: NewsActionModal(
            newsId: 'fake-news',
            isPinned: false,
            hasPinnedNews: true,
          )));

      await tester.tap(find.byKey(Key("pinNewsAction")));
      await tester.pumpAndSettle();

      verify(() => newsBloc.add(NewsEvent.replacePinnedNews(id: 'fake-news'))).called(1);
    });
  });
}

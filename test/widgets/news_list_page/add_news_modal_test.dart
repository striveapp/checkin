import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/news/news_state.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/newslist/modal/add_news_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';

class MockProfileBloc extends MockBloc<ProfileEvent, ProfileState> implements ProfileBloc {}
class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

class FakeProfileEvent extends Fake implements ProfileEvent {}
class FakeProfileState extends Fake implements ProfileState {}

class FakeNewsEvent extends Fake implements NewsEvent {}
class FakeNewsState extends Fake implements NewsState {}

void main() {
  setUpAll(() {
    registerFallbackValue<ProfileEvent>(FakeProfileEvent());
    registerFallbackValue<ProfileState>(FakeProfileState());
    registerFallbackValue<NewsEvent>(FakeNewsEvent());
    registerFallbackValue<NewsState>(FakeNewsState());
  });

  group("AddNewsModal", () {
    ProfileBloc profileBloc;
    NewsBloc newsBloc;

    setUp(() {
      profileBloc = MockProfileBloc();
      newsBloc = MockNewsBloc();
    });


    Widget generateNewsModal() {
      return MultiBlocProvider(providers: [
        BlocProvider.value(value: profileBloc),
        BlocProvider.value(value: newsBloc),
      ], child: AddNewsModal());
    }

    tearDown(() {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });

    group("when content is shorter then max length", () {
      var fakeUser = User(
        name: "tobuto",
        imageUrl: "test.png",
        email: "tobuto@nellano.it",
        isOwner: false,
      );

      testWidgets("then publish button is enabled and adds AddNews when is tapped", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeUser,
          isCurrentUser: true,
        ));

        await tester
            .pumpAppWithScaffold(generateNewsModal());
        var shortText = """
        It was a dog. It was a big dog.
        """;

        await tester.enterText(find.byType(TextField), shortText);
        await tester.pumpAndSettle();

        expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, isTrue);
        expect(find.byKey(Key("remainingChars")), findsNothing);

        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();

        verify(() => newsBloc.add(NewsEvent.addNews(content: shortText, author: Author.fromUser(fakeUser)))).called(1);
      });
    });

    group("when content is longer then max length", () {
      var fakeUser = User(
        name: "tobuto",
        imageUrl: "test.png",
        email: "tobuto@nellano.it",
        isOwner: false,
      );

      testWidgets("then publish button is disabled", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeUser,
          isCurrentUser: true,
        ));

        await tester
            .pumpAppWithScaffold(generateNewsModal());
        var moreThan280Chars = """
        It was a dog. It was a big dog. 
        I will go back to Gotham and I will fight men Iike this but I will not become an executioner. 
        This isn't a car.
        Well, you see... I'm buying this hotel and setting some new rules about the pool area.
        Too much
        """;

        print(moreThan280Chars.length);
        await tester.enterText(find.byType(TextField), moreThan280Chars);
        await tester.pumpAndSettle();

        expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, isFalse);
        expect(tester.widget<Text>(find.byKey(Key("remainingChars"))).data, equals("-10"));
      });
    });

    group("when content is shorter then max length but close to the end", () {
      var fakeUser = User(
        name: "tobuto",
        imageUrl: "test.png",
        email: "tobuto@nellano.it",
        isOwner: false,
      );

      testWidgets(
          "then publish button is enabled and the max length counter shows the remaining chars",
          (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: fakeUser,
          isCurrentUser: true,
        ));

        await tester
            .pumpAppWithScaffold(generateNewsModal());
        var exactly273Chars = """
        It was a dog. It was a big dog. 
        I will go back to Gotham and I will fight men Iike this but I will not become an executioner. 
        This isn't a car.
        Well, you see... I'm buying this hotel and setting some new rules about the pool area.
        """;

        await tester.enterText(find.byType(TextField), exactly273Chars);
        await tester.pumpAndSettle();

        expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, isTrue);
        expect(tester.widget<Text>(find.byKey(Key("remainingChars"))).data, equals("7"));
      });

    });
  });
}
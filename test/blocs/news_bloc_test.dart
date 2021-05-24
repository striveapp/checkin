import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/news/news_state.dart';
import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/news.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/news_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

class MockGymRepository extends Mock implements GymRepository {}

void main() {
  group("NewsBloc", () {
    var fakeGym = Gym(
      id: "fake-gym",
      name: "Test gym",
      paymentAppDomain: "test-domain",
      stripePublicKey: "test-key",
      hasActivePayments: false,
      imageUrl: "cool-gyms-have-cooler-images",
    );

    var fakeAuthor = Author(
      imageUrl: 'https://biutiful',
      name: 'Peppe',
    );

    MockNewsRepository mockNewsRepository;
    MockGymRepository mockGymRepository;

    setUp(() {
      mockNewsRepository = MockNewsRepository();
      mockGymRepository = MockGymRepository();

      configureThrowOnMissingStub([
        mockNewsRepository,
        mockGymRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockNewsRepository,
        mockGymRepository,
      ]);
    });

    group("on InitializeNews event", () {
      setUp(() {
        when(mockGymRepository.getGym()).thenAnswer((realInvocation) => Stream.value(fakeGym));
        when(mockNewsRepository.getAllNews("fake-gym"))
            .thenAnswer((realInvocation) => Stream.empty());
      });

      tearDown(() {
        verify(mockGymRepository.getGym());
        verify(mockNewsRepository.getAllNews("fake-gym"));
      });

      blocTest(
        "subscribe to gym and news",
        build: () => NewsBloc(
          newsRepository: mockNewsRepository,
          gymRepository: mockGymRepository,
        ),
        act: (bloc) => bloc.add(InitializeNews()),
        expect: () => [],
      );
    });

    group("on NewsUpdated", () {
      var fakeNews = News(
        id: "fakeId",
        content: "5G is killing you",
        author: fakeAuthor,
        timestamp: 1111111169,
        isPinned: false,
      );

      var anotherFakeNews = News(
        id: "fakeId",
        content: "5G is killing you",
        author: fakeAuthor,
        timestamp: 1111111170,
        isPinned: false,
      );

      var yetAnotherFakeNews = News(
        id: "fakeId",
        content: "5G is killing you",
        author: fakeAuthor,
        timestamp: 1111111171,
        isPinned: false,
      );


      group("when there is a pinned news", () {
        var pinnedNews =  News(
          id: "fakeId",
          content: "5G is killing you",
          author: fakeAuthor,
          timestamp: 1111111168,
          isPinned: true,
        );

        var unsortedList = [anotherFakeNews, fakeNews, yetAnotherFakeNews, pinnedNews];

        blocTest(
          "fetch all news and sort them by timestamp DESC and return the pinned news on top",
          build: () => NewsBloc(
            newsRepository: mockNewsRepository,
            gymRepository: mockGymRepository,
          ),
          act: (bloc) {
            return bloc.add(NewsUpdated(newsList: unsortedList));
          },
          expect: () => [
            NewsLoaded(newsList: [
              pinnedNews,
              yetAnotherFakeNews,
              anotherFakeNews,
              fakeNews,
            ])
          ],
        );
      });

      group("when there is NOT a pinned news", () {
        var unsortedList = [anotherFakeNews, fakeNews, yetAnotherFakeNews];

        blocTest(
          "fetch all news and sort them by timestamp DESC",
          build: () => NewsBloc(
            newsRepository: mockNewsRepository,
            gymRepository: mockGymRepository,
          ),
          act: (bloc) {
            return bloc.add(NewsUpdated(newsList: unsortedList));
          },
          expect: () => [
            NewsLoaded(newsList: [
              yetAnotherFakeNews,
              anotherFakeNews,
              fakeNews,
            ])
          ],
        );
      });
    });

    group("on AddNews", () {
      setUp(() {
        when(mockGymRepository.getGym()).thenAnswer((realInvocation) => Stream.value(fakeGym));
        when(mockNewsRepository.publishNews("fake-gym", "a news", fakeAuthor))
            .thenAnswer((realInvocation) => Future.value());
      });

      tearDown(() {
        verify(mockGymRepository.getGym());
        verify(mockNewsRepository.publishNews("fake-gym", "a news", fakeAuthor));
      });

      blocTest(
        "add a news",
        build: () => NewsBloc(
          newsRepository: mockNewsRepository,
          gymRepository: mockGymRepository,
        ),
        act: (bloc) {
          return bloc.add(AddNews(content: "a news", author: fakeAuthor));
        },
        expect: () => [],
      );
    });

    group("on PinNews", () {
      setUp(() {
        when(mockGymRepository.getGym()).thenAnswer((realInvocation) => Stream.value(fakeGym));
        when(mockNewsRepository.pinNews("fake-gym", "fake-news-id"))
            .thenAnswer((realInvocation) => Future.value());
      });

      tearDown(() {
        verify(mockGymRepository.getGym());
        verify(mockNewsRepository.pinNews("fake-gym", "fake-news-id"));
      });

      blocTest(
        "pin a news",
        build: () => NewsBloc(
          newsRepository: mockNewsRepository,
          gymRepository: mockGymRepository,
        ),
        act: (bloc) {
          return bloc.add(PinNews(id: 'fake-news-id'));
        },
        expect: () => [],
      );
    });

    group("on UnpinNews", () {
      setUp(() {
        when(mockGymRepository.getGym()).thenAnswer((realInvocation) => Stream.value(fakeGym));
        when(mockNewsRepository.unpinNews("fake-gym", "fake-news-id"))
            .thenAnswer((realInvocation) => Future.value());
      });

      tearDown(() {
        verify(mockGymRepository.getGym());
        verify(mockNewsRepository.unpinNews("fake-gym", "fake-news-id"));
      });

      blocTest(
        "unpin a news",
        build: () => NewsBloc(
          newsRepository: mockNewsRepository,
          gymRepository: mockGymRepository,
        ),
        act: (bloc) {
          return bloc.add(UnpinNews(id: 'fake-news-id'));
        },
        expect: () => [],
      );
    });

    group("on DeleteNews", () {
      setUp(() {
        when(mockGymRepository.getGym()).thenAnswer((realInvocation) => Stream.value(fakeGym));
        when(mockNewsRepository.deleteNews("fake-gym", "fake-news-id"))
            .thenAnswer((realInvocation) => Future.value());
      });

      tearDown(() {
        verify(mockGymRepository.getGym());
        verify(mockNewsRepository.deleteNews("fake-gym", "fake-news-id"));
      });

      blocTest(
        "delete a news",
        build: () => NewsBloc(
          newsRepository: mockNewsRepository,
          gymRepository: mockGymRepository,
        ),
        act: (bloc) {
          return bloc.add(DeleteNews(id: 'fake-news-id'));
        },
        expect: () => [],
      );
    });

  });
}

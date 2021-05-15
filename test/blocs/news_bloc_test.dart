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
    var fakeNews = News(
      id: "fakeId",
      content: "5G is killing you",
      author: fakeAuthor,
      timestamp: 12334567,
      isPinned: false,
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
      blocTest(
        "fetch all news",
        build: () => NewsBloc(
          newsRepository: mockNewsRepository,
          gymRepository: mockGymRepository,
        ),
        act: (bloc) => bloc.add(NewsUpdated(newsList: [fakeNews, fakeNews])),
        expect: () => [
          NewsLoaded(newsList: [
            fakeNews,
            fakeNews,
          ])
        ],
      );
    });
  });
}

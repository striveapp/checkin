// @dart=2.9

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/news/news_state.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/news.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/news_repository.dart';
import 'package:flutter/foundation.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  final GymRepository gymRepository;

  StreamSubscription<Gym> gymSub;
  StreamSubscription<List<News>> newsListSub;

  NewsBloc({
    @required this.gymRepository,
    @required this.newsRepository,
  }) : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is InitializeNews) {
      _fetchGym((gym) {
        newsListSub?.cancel();
        newsListSub = newsRepository.getAllNews(gym.id).listen((newsList) {
          add(NewsUpdated(newsList: newsList, gymId: gym.id));
        });
      });
    }

    if (event is NewsUpdated) {
      var pinnedNews = event.newsList.firstWhere((news) => news.isPinned, orElse: () => null);
      yield NewsLoaded(
        newsList: _newsListWithPinOnTop(pinnedNews, _sortByTimestamp(event.newsList)),
        hasPinnedNews: pinnedNews != null,
        gymId: event.gymId,
      );
    }

    final currentState = state;
    if (currentState is NewsLoaded) {
      if (event is AddNews) {
        await newsRepository.publishNews(currentState.gymId, event.content, event.author);
      }

      if (event is PinNews) {
        await newsRepository.pinNews(currentState.gymId, event.id);
      }

      if (event is ReplacePinnedNews) {
        await newsRepository.replacePinnedNews(currentState.gymId, event.id);
      }

      if (event is UnpinNews) {
        await newsRepository.unpinNews(currentState.gymId, event.id);
      }

      if (event is DeleteNews) {
        await newsRepository.deleteNews(currentState.gymId, event.id);
      }
    }
  }

  List<News> _newsListWithPinOnTop(News pinnedNews, List<News> newsList) {
    if (pinnedNews == null) {
      return newsList;
    }
    newsList.remove(pinnedNews);
    return [pinnedNews, ...newsList];
  }

  void _fetchGym(Function(Gym) onGymUpdated) {
    gymSub?.cancel();
    gymSub = gymRepository.getGym().listen(onGymUpdated);
  }

  List<News> _sortByTimestamp(List<News> newsList) =>
      newsList..sort((News a, News b) => b.compareTo(a));

  @override
  Future<void> close() {
    gymSub?.cancel();
    newsListSub?.cancel();
    return super.close();
  }
}

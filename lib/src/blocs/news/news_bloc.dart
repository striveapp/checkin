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

  Gym _gym;

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
        _gym = gym;
        newsListSub?.cancel();
        newsListSub = newsRepository.getAllNews(gym.id).listen((newsList) {
          add(NewsUpdated(newsList: newsList));
        });
      });
    }

    if (event is NewsUpdated) {
      yield NewsLoaded(newsList: _sortByTimestamp(event.newsList));
    }

    if (event is AddNews) {
      if (_gym != null) {
        await newsRepository.publishNews(_gym.id, event.content, event.author);
      } else {
        _fetchGym((gym) async {
          _gym = gym;
          await newsRepository.publishNews(_gym.id, event.content, event.author);
        });
      }
    }
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

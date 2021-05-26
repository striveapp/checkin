import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/newslist/add_news_fab.dart';
import 'package:checkin/src/ui/components/newslist/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListPage extends StatelessWidget {
  static const String news = "News";

  final String newsId;

  const NewsListPage({Key key, this.newsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBloc(
            gymRepository: context.read(),
            newsRepository: context.read(),
          )..add(InitializeNews()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            imageRepository: context.read(),
            storageRepository: context.read(),
            userRepository: context.read(),
          )..add(InitializeProfile()),
        ),
      ],
      child: Scaffold(
        appBar: BaseAppBar(
          title: news.i18n,
          showUserImage: false,
        ),
        floatingActionButton: AddNewsFab(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: NewsList(highlightNewsId: newsId),
          ),
        ),
      ),
    );
  }
}

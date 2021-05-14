import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/newslist/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListPage extends StatelessWidget {
  static const String news = "News";

  const NewsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        gymRepository: context.read(),
        newsRepository: context.read(),
      )..add(InitializeNews()),
      child: Scaffold(
        appBar: BaseAppBar(
          title: news.i18n,
          showUserImage: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: NewsList(),
          ),
        ),
      ),
    );
  }
}

import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_state.dart';
import 'package:checkin/src/ui/components/placeholder_image.dart';
import 'package:checkin/src/ui/components/placeholder_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return state.map(
            newsInitial: (NewsInitial state) => ListView(
                children: List.filled(
                    10,
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: PlaceholderNews(),
                        ),
                        Divider(),
                      ],
                    ))),
            newsLoaded: (NewsLoaded state) => Container(
                  child: Text("Implement me!"),
                ));
      },
    );
  }
}

class PlaceholderNews extends StatelessWidget {
  const PlaceholderNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PlaceholderImage(width: 70, height: 70),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceholderText(fontHeight: 14, width: 80),
            SizedBox(
              height: 10,
            ),
            PlaceholderText(
              fontHeight: 18,
              width: 200,
            )
          ],
        ),
      ],
    );
  }
}

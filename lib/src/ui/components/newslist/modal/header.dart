import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  static const String publish = "Publish";

  final String content;
  final bool isPublishable;

  const Header({
    Key key,
    @required this.content,
    @required this.isPublishable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.map(
                initialProfileState: (_) => EmptyWidget(),
                profileLoaded: (ProfileLoaded state) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                        ),
                        minimumSize: Size(30, 30),
                        primary: Theme.of(context).accentColor,
                      ),
                      child: Text(
                        Header.publish.i18n,
                        style: Theme.of(context).textTheme.button.apply(fontSizeFactor: 0.8),
                      ),
                      onPressed: isPublishable
                          ? () {
                              context.read<NewsBloc>().add(AddNews(
                                    content: content,
                                    author: Author.fromUser(state.profileUser),
                                  ));
                              Navigator.of(context).pop();
                            }
                          : DISABLED_BUTTON,
                    ));
          },
        ),
      ],
    );
  }
}

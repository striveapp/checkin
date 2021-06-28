// @dart=2.9

import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/newslist/modal/add_news_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewsFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.map(
            initialProfileState: (InitialProfileState state) => EmptyWidget(),
            profileLoaded: (ProfileLoaded state) => state.profileUser.isOwner
                ? FloatingActionButton(
                    key: Key("addNewsFab"),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        ),
                        builder: (_) => MultiBlocProvider(
                          providers: [
                            BlocProvider.value(
                              value: context.read<NewsBloc>(),
                            ),
                            BlocProvider.value(
                              value: context.read<ProfileBloc>(),
                            ),
                          ],
                          child: AddNewsModal(),
                        ),
                      );
                    },
                    child: Icon(Icons.edit_outlined),
                  )
                : EmptyWidget());
      },
    );
  }
}

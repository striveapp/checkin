// @dart=2.9

import 'package:checkin/src/blocs/lesson_filter/bloc.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/localization/localization.dart';

import 'filter_choice_chip.dart';

class FilterListWidget extends StatefulWidget {
  static const String noFiltersAvailable = "There are no filters available";
  final List<String> selectedFilterList;

  FilterListWidget({
    Key key,
    this.selectedFilterList,
  }) : super(key: key);

  @override
  _FilterListWidgetState createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  List<String> _selectedFilterList;
  ScrollController _scrollController;

  @override
  void initState() {
    _selectedFilterList = [];
    _selectedFilterList = List.from(widget.selectedFilterList);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        constraints: BoxConstraints(
          maxHeight: 200,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: BlocBuilder<LessonFilterBloc, LessonFilterState>(
            builder: (BuildContext context, LessonFilterState state) => state.map(
              initialLessonFilterState: (_) => LoadingIndicator(),
              lessonFilterLoaded: (LessonFilterLoaded state) =>
                  state.availableLessonTypes.length > 1
                      ? Scrollbar(
                          isAlwaysShown: true,
                          controller: _scrollController,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _buildChoiceList(state.availableLessonTypes),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          child: Center(
                              child: Text(
                            FilterListWidget.noFiltersAvailable.i18n,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          )),
                        ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChoiceList(List<String> list) {
    List<Widget> choices = [];
    list.forEach(
      (item) {
        var selectedText = _selectedFilterList.contains(item);
        choices.add(
          FilterChoiceChip(
            onSelected: (value) {
              setState(
                () {
                  selectedText ? _selectedFilterList.remove(item) : _selectedFilterList.add(item);
                },
              );

              _onSelectedFiltersUpdate(_selectedFilterList);
            },
            selected: selectedText,
            text: item,
          ),
        );
      },
    );
    return choices;
  }

  void _onSelectedFiltersUpdate(List<String> selectedFilterList) {
    var lessonsBloc = context.read<LessonsBloc>();

    lessonsBloc.state.maybeMap(lessonsLoaded: (LessonsLoaded lessonsState) {
      lessonsBloc.add(LessonsEvent.loadLessons(
          selectedDay: lessonsState.selectedDay, selectedFilterList: _selectedFilterList));
    }, orElse: () {
      // ignore
    });
  }
}

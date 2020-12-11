import 'package:checkin/src/blocs/lesson_filter/bloc.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/user_bloc.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'choice_chip_widget.dart';

class FilterListWidget extends StatefulWidget {
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
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          radius: Radius.circular(10),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: BlocBuilder<LessonFilterBloc, LessonFilterState>(
                cubit: LessonFilterBloc(
                    lessonConfigRepository: context.watch<LessonConfigRepository>(),
                    userBloc: context.watch<UserBloc>()),
                builder: (BuildContext context, LessonFilterState state) => state.map(
                    initialLessonFilterState: (_) => LoadingIndicator(),
                    lessonFilterLoaded: (LessonFilterLoaded state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildChoiceList(state.availableLessonTypes),
                    ),
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChoiceList(List<String> list) {
    List<Widget> choices = List();
    list.forEach(
      (item) {
        var selectedText = _selectedFilterList.contains(item);
        choices.add(
          ChoiceChipWidget(
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
    }, lessonsLoadedEmpty: (LessonsLoadedEmpty lessonsState) {
      lessonsBloc.add(LessonsEvent.loadLessons(
          selectedDay: lessonsState.selectedDay, selectedFilterList: _selectedFilterList));
    }, orElse: () {
      // ignore
    });
  }
}

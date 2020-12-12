import 'package:flutter/material.dart';

import 'choice_chip_widget.dart';

class FilterListWidget extends StatefulWidget {
  final List<String> selectedFilterList;
  final List<String> filterList;

  FilterListWidget({
    Key key,
    this.selectedFilterList,
    this.filterList,
  }) : super(key: key);

  @override
  _FilterListWidgetState createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  List<String> _selectedTextList = List();
  List<String> _allTextList;

  @override
  void initState() {
    _allTextList =
    widget.filterList == null ? [] : List.from(widget.filterList);
    _selectedTextList = widget.selectedFilterList != null
        ? List.from(widget.selectedFilterList)
        : [];
    super.initState();
  }

  Widget _body() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      constraints: BoxConstraints(
        maxHeight: 200,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildChoiceList(_allTextList),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChoiceList(List<String> list) {
    List<Widget> choices = List();
    list.forEach(
          (item) {
        var selectedText = _selectedTextList.contains(item);
        choices.add(
          ChoiceChipWidget(
            onSelected: (value) {
              //TODO lessonConfig: this should invoke the callback to update the filters
              setState(
                    () {
                  selectedText
                      ? _selectedTextList.remove(item)
                      : _selectedTextList.add(item);
                },
              );
            },
            selected: selectedText,
            text: item,
          ),
        );
      },
    );
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Container(
        child: _body(),
      ),
    );
  }
}

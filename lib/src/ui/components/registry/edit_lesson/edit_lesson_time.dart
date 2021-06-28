// @dart=2.9

import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class EditLessonTime extends StatefulWidget {
  static const String ok = "Ok";
  static const String selectTime = "Select time %s";
  static const String cancel = "Cancel";

  final String text;
  final String time;
  final Function(String) onTimePicked;

  EditLessonTime({
    Key key,
    @required this.text,
    @required this.time,
    @required this.onTimePicked,
  }) : super(key: key);

  @override
  _EditLessonTimeState createState() => _EditLessonTimeState();
}

class _EditLessonTimeState extends State<EditLessonTime> {
  String currentTime;

  @override
  void initState() {
    super.initState();
    currentTime = widget.time;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var timePicked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: _getHour(currentTime), minute: _getMinute(currentTime)),
          confirmText: EditLessonTime.ok.i18n.toUpperCase(),
          helpText: EditLessonTime.selectTime.fill([widget.text]).toUpperCase(),
          cancelText: EditLessonTime.cancel.i18n.toUpperCase(),
        );
        if (timePicked != null) {
          var formattedTimePicked = timePicked.format(context);
          widget.onTimePicked(formattedTimePicked);
          setState(() {
            currentTime = formattedTimePicked;
          });
        }
      },
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.text, style: Theme.of(context).textTheme.headline3),
          Row(
            children: [
              Text(currentTime,
                  style: Theme.of(context).textTheme.headline2.apply(
                        fontSizeDelta: 3,
                      )),
              Icon(
                Icons.unfold_more,
              ),
            ],
          )
        ],
      ),
    );
  }

  int _getHour(String time) {
    return int.parse(time.split(":")[0]);
  }

  int _getMinute(String time) {
    return int.parse(time.split(":")[1]);
  }
}

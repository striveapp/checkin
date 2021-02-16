import 'package:flutter/material.dart';

class EditLessonModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Icon(
            Icons.remove_rounded,
            size: 50,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Column(
              children: [
                EditLessonTime(text: "Start", time: "17:00"),
                SizedBox(
                  height: 20,
                ),
                EditLessonTime(text: "End", time: "18:00"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditLessonTime extends StatelessWidget {
  final String text;
  final String time;

  const EditLessonTime({
    Key key,
    @required this.text,
    @required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: 17, minute: 30),
        );
      },
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: Theme.of(context).textTheme.headline3),
            Row(
              children: [
                Text(time,
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
      ),
    );
  }
}

// @dart=2.9

import 'package:checkin/src/ui/components/newslist/modal/content_editor.dart';
import 'package:checkin/src/ui/components/newslist/modal/header.dart';
import 'package:checkin/src/ui/components/newslist/modal/max_length_counter.dart';
import 'package:flutter/material.dart';

class AddNewsModal extends StatefulWidget {
  @override
  _AddNewsModalState createState() => _AddNewsModalState();
}

class _AddNewsModalState extends State<AddNewsModal> {
  final _controller = TextEditingController();
  int currentLength = 0;
  String content;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        currentLength = _controller.text.length;
        content = _controller.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var maxLength = 280;
    var remainingChars = maxLength - currentLength;

    return FractionallySizedBox(
      key: Key("addNewsModal"),
      heightFactor: 0.8,
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 50),
        curve: Curves.decelerate,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 10),
              child: Header(
                content: content,
                isPublishable: remainingChars >= 0,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                    bottom: 20,
                  ),
                  child: ContentEditor(
                    parentController: _controller,
                    maxLength: maxLength,
                  ),
                ),
              ),
            ),
            Divider(height: 1),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: MaxLengthCounter(
                  remainingChars: remainingChars,
                  completionPercentage: currentLength / maxLength,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

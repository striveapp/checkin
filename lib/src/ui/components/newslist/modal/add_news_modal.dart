import 'package:checkin/src/ui/components/newslist/modal/content_editor.dart';
import 'package:checkin/src/ui/components/newslist/modal/header.dart';
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
                  parentController: _controller,
                  maxLength: 280,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MaxLengthCounter extends StatefulWidget {
  final TextEditingController parentController;
  final int maxLength;

  const MaxLengthCounter({
    Key key,
    @required this.parentController,
    @required this.maxLength,
  }) : super(key: key);

  @override
  _MaxLengthCounterState createState() => _MaxLengthCounterState();
}

class _MaxLengthCounterState extends State<MaxLengthCounter> {
  int currentLength = 0;

  @override
  void initState() {
    widget.parentController.addListener(() {
      setState(() {
        currentLength = widget.parentController.text.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var remainingChars = widget.maxLength - currentLength;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (remainingChars <= 20)
          Positioned(
            top: 20 / 4,
            child: Text("${remainingChars}",
                key: Key("remainingChars"), style: Theme.of(context).textTheme.bodyText1),
          ),
        SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Theme.of(context).backgroundColor.withAlpha(70),
            value: currentLength / widget.maxLength,
            valueColor: new AlwaysStoppedAnimation<Color>(
              Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}

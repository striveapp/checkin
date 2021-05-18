import 'package:checkin/src/ui/components/newslist/modal/header.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    var remainingChars = 280 - currentLength;

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
                    maxLength: 280,
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

class ContentEditor extends StatefulWidget {
  final TextEditingController parentController;
  final int maxLength;

  ContentEditor({
    Key key,
    @required this.parentController,
    @required this.maxLength,
  }) : super(key: key);

  @override
  _ContentEditorState createState() => _ContentEditorState();
}

class _ContentEditorState extends State<ContentEditor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserImage(
          width: 50,
          height: 50,
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              TextField(
                autofocus: true,
                controller: widget.parentController,
                keyboardType: TextInputType.multiline,
                cursorColor: Theme.of(context).accentColor,
                minLines: 1,
                maxLines: 100,
                maxLength: widget.maxLength + 99,
                style: Theme.of(context).textTheme.headline3,
                buildCounter: (
                  BuildContext context, {
                  int currentLength,
                  int maxLength,
                  bool isFocused,
                }) =>
                    null,
                decoration: InputDecoration(
                  hintText: "What's happening?",
                  hintStyle: Theme.of(context).textTheme.headline3.apply(
                        color: Theme.of(context).textTheme.headline3.color.withAlpha(100),
                      ),
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorMaxLines: 1,
                  errorStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .apply(color: Theme.of(context).errorColor),
                ),
              ),
            ],
          ),
        ),
      ],
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

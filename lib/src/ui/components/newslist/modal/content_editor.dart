// @dart=2.9

import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class ContentEditor extends StatefulWidget {
  static const String whatsHappening = "What's happening?";

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
                cursorColor: Theme.of(context).colorScheme.secondary,
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
                  hintText: ContentEditor.whatsHappening.i18n,
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
                      .apply(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

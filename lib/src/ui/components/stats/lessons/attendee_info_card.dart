import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class AttendeeInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: UserImage(
                        userImage:
                            'https://pbs.twimg.com/media/DLfVkiVVAAApK0D.jpg',
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Spanish Student Names",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .apply(color: Colors.black87, fontWeightDelta: 2),
                        ),
                        Text("belt color",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .apply(color: Colors.black87)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '10',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .apply(color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

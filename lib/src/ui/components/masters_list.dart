import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/master.dart';
import 'package:flutter/material.dart';

class MastersList extends StatelessWidget {
  final List<Master> masters;

  const MastersList({Key key, @required this.masters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(Localization.of(context).teacher,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600))),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(masters
                        .map((master) => master.name)
                        .join(", ")),
                  ),
                ],
              )

            ],
        ),
      ),
    );
  }
}

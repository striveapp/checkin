import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class GymSelectionTile extends StatelessWidget {
  final String gymImageUrl;
  final String gymName;
  final String gymId;

  GymSelectionTile({@required this.gymImageUrl,
    @required this.gymName,
    @required this.gymId,});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){/* just display ink well animation */},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              UserImage(
                userImage: gymImageUrl,),
              SizedBox(width: 10,),
              Text(
                gymName,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
            ],
          ),
          Radio(value: gymId, groupValue: "imacat", onChanged: (value){}, activeColor: Theme.of(context).accentColor,),
        ],),
    );
  }
}

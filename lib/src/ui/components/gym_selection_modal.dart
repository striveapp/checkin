import 'package:checkin/src/ui/components/gym_selection_tile.dart';
import 'package:flutter/material.dart';

class GymSelectionModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 200,
      ),
      child: Column(
        children: [
          Icon(Icons.remove_rounded, size: 50, color: Colors.grey,),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0 ),
            child: GymSelectionTile(
              gymImageUrl: "https://scontent.fmxp6-1.fna.fbcdn.net/v/t1.0-1/p148x148/99296134_2822034917926161_7519751466232315904_o.png?_nc_cat=105&ccb=2&_nc_sid=1eb0c7&_nc_ohc=QKVSeXj1j_gAX9722n1&_nc_ht=scontent.fmxp6-1.fna&_nc_tp=30&oh=659c8ad4867a017425147dd0bf3f381b&oe=6034D7E6",
              gymName: "Gullo bjj",
              gymId: "aaa fuckoff",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,),
            child: GymSelectionTile(
              gymImageUrl: "https://bjjasia.com/wp-content/uploads/2017/04/Aranha-BJJ-Guangzhou-300x300.jpg",
              gymName: "Aranha bjj",
              gymId: "imacat",
            ),
          )
        ],
      ),
    );
  }
}

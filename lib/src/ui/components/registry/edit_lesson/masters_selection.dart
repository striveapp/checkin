import 'package:checkin/src/blocs/edit_lesson/bloc.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MastersSelection extends StatefulWidget {
  final List<Master> masters;

  const MastersSelection({
    Key key,
    @required this.masters,
  }) : super(key: key);

  @override
  _MastersSelectionState createState() => _MastersSelectionState();
}

class _MastersSelectionState extends State<MastersSelection> {
  List<Master> currentMasters;

  @override
  void initState() {
    super.initState();
    currentMasters = widget.masters;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Teachers",
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<EditLessonBloc, EditLessonState>(
            builder: (BuildContext context, EditLessonState state) {
          return state.maybeWhen(
            mastersLoaded: (List<Master> availableMasters) {
              return Column(
                children: availableMasters
                    .map(
                      (master) => Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: RoundedImage(
                                url: master.imageUrl,
                                width: 30,
                                height: 30,
                              ),
                              title: Text(master.name),
                              trailing: _isMasterOfTheClass(master)
                                  ? Icon(Icons.check_circle)
                                  : Icon(Icons.add_circle_outline),
                              onTap: () {
                                if (_isMasterOfTheClass(master)) {
                                  currentMasters.remove(master);
                                } else {
                                  currentMasters.add(master);
                                }
                                context
                                    .read<EditLessonBloc>()
                                    .add(EditLessonEvent.updateMasters(newMasters: currentMasters));
                                setState(() {
                                  currentMasters = currentMasters;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              );
            },
            orElse: () => EmptyWidget(),
          );
        }),
      ],
    );
  }

  bool _isMasterOfTheClass(Master availableMaster) =>
      currentMasters.where((master) => master.email == availableMaster.email).length != 0;
}

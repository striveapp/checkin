import 'package:checkin/src/blocs/edit_lesson/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MastersSelection extends StatefulWidget {
  static const String teachers = "Teachers";
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
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    currentMasters = widget.masters;
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MastersSelection.teachers.i18n,
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<EditLessonBloc, EditLessonState>(
            builder: (BuildContext context, EditLessonState state) {
          return state.maybeWhen(
            mastersLoaded: (List<Master> availableMasters) {
              return Container(
                constraints: BoxConstraints(maxHeight: 120),
                child: Scrollbar(
                  isAlwaysShown: true,
                  controller: _scrollController,
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: availableMasters.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: RoundedImage(
                            url: availableMasters[index].imageUrl,
                            width: 30,
                            height: 30,
                          ),
                          title: Text(availableMasters[index].name),
                          trailing: _isMasterOfTheClass(availableMasters[index])
                              ? Icon(Icons.check_circle)
                              : Icon(Icons.add_circle_outline),
                          onTap: () {
                            if (_isMasterOfTheClass(availableMasters[index])) {
                              currentMasters.removeWhere((currentMaster) =>
                                  availableMasters[index].email == currentMaster.email);
                            } else {
                              currentMasters.add(availableMasters[index]);
                            }
                            context
                                .read<EditLessonBloc>()
                                .add(EditLessonEvent.updateMasters(newMasters: currentMasters));
                            setState(() {
                              currentMasters = currentMasters;
                            });
                          },
                        );
                      }),
                ),
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

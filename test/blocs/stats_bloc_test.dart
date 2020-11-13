import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("StatsBloc", () {
    // todo missing initial state test

    group("on TimespanUpdate event", () {
      var fakeTimespan = "week";

      blocTest(
        "should emit TimespanUpdated",
        build: () => StatsBloc(),
        act: (bloc) => bloc.add(TimespanUpdate(timespan: fakeTimespan)),
        expect: [TimespanUpdated(timespan: fakeTimespan)],
      );
    });
  });
}

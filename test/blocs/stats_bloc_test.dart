import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("StatsBloc", () {
    StatsBloc statsBloc;
    setUp(() {
      statsBloc = StatsBloc();
    });

    group("when add TimespanUpdate", () {
      var fakeTimespan = "week";
      setUp(() {
        statsBloc.add(TimespanUpdate(timespan: fakeTimespan));
      });

      test("should emits TimespanUpdated", () {
        final expectedState = [
          InitialStatsState(),
          TimespanUpdated(timespan: fakeTimespan),
        ];
        
        expectLater(
          statsBloc,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}
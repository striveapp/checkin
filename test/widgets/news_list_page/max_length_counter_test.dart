import 'package:checkin/src/ui/components/newslist/modal/max_length_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../pump_app.dart';

void main() {
  group("MaxLengthCounter", () {
    group("when remaining chars is less or equal then 20", () {
      testWidgets("shows the number of remaining chars", (tester) async {
        await tester
            .pumpAppWithScaffold(MaxLengthCounter(remainingChars: 19, completionPercentage: 0.8));

        expect(find.text("19"), findsOneWidget);
      });
    });
    group("when remaining chars is more then 20", () {
      testWidgets("shows nothing", (tester) async {
        await tester
            .pumpAppWithScaffold(MaxLengthCounter(remainingChars: 21, completionPercentage: 0.8));

        expect(find.byType(Text), findsNothing);
      });
    });
  });
}

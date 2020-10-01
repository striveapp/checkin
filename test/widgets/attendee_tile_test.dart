import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/registry/attendee_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../image_test_utils.dart';

void main() {
  testWidgets("AttendeeTile should navigate to attendee's profile when tapped",
      (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(buildTestApplication(AttendeeTile(
        attendee: Attendee(
            name: "testAttendee",
            grade: Grade.white,
            imageUrl: "testImage",
            email: "testMail",
            selectedGymId: "testGym"),
      )));
      final tile = find.byKey(Key("tile-testMail"));

      expect(tile, findsOneWidget);

      await tester.tap(tile);
      await tester.pumpAndSettle();

      expect(find.text("Navigated!"), findsOneWidget);
    });
  });
}

MaterialApp buildTestApplication(Widget testWidget) {
  return MaterialApp(
      routes: {
        'stats/testMail': (context) {
          return Scaffold(
            body: Text("Navigated!"),
          );
        }
      },
      home: Scaffold(
        body: testWidget,
      ));
}

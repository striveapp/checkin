import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/ui/components/attendee_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets("AttendeeTile should navigate to attendee's profile when tapped",
      (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(buildTestApplication(AttendeeTile(
        attendee: Attendee(
            name: "testAttendee",
            rank: "testRank",
            imageUrl: "testImage",
            email: "testMail"),
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
        'profile/testMail': (context) {
          return Scaffold(
            body: Text("Navigated!"),
          );
        }
      },
      home: Scaffold(
        body: testWidget,
      ));
}

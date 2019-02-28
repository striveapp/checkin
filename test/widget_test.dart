// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:checkin/src/app.dart';

void main() {
  testWidgets('It should check that login button is present', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('It should check that Team button is present', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    expect(find.text('Teams'), findsOneWidget);
  });
}

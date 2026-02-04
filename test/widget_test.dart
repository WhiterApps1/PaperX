// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:paper_x_flutter/main.dart';

void main() {
  testWidgets('PaperX app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PaperXApp());

    // Verify that the splash screen is displayed with logo
    expect(find.byType(Image), findsAtLeastNWidgets(1));

    // Complete all pending timers to allow navigation
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // After navigation, verify onboarding screen is displayed
    expect(find.text('Invest Smarter, Grow Faster'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:rpn_calculator/main.dart';

void main() {

  testWidgets('Calculator Button Press Test with addition', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyCalculator());

    // Helper function to tap a button and wait for the UI to update
    Future<void> tapButton(String buttonText) async {
      await tester.tap(find.widgetWithText(ElevatedButton, buttonText));
      await tester.pump();
    }

    // Tap buttons and verify the displayed input and stack
    await tapButton("1");
    expect(find.text("1"), findsAtLeast(2));

    await tapButton("2");
    expect(find.text("12"), findsOneWidget);

    await tapButton("ENTER");
    await tapButton("1");
    await tapButton("2");
    await tapButton("ENTER");

    await tapButton("+");
    expect(find.text("12"), findsNothing); // De 2 12-taller fjernes fra stacken
    expect(find.text("24"), findsOneWidget); //Resultatet skulle gerne give 24

  });

  testWidgets('Calculator Button Press Test with subtraction', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyCalculator());

    // Helper function to tap a button and wait for the UI to update
    Future<void> tapButton(String buttonText) async {
      await tester.tap(find.widgetWithText(ElevatedButton, buttonText));
      await tester.pump();
    }

    // Tap buttons and verify the displayed input and stack
    await tapButton("1");
    expect(find.text("1"), findsExactly(2));

    await tapButton("2");
    expect(find.text("12"), findsOneWidget);

    await tapButton("ENTER");
    await tapButton("1");
    await tapButton("2");
    await tapButton("ENTER");

    await tapButton("-");
    expect(find.text("12"), findsNothing); // De 2 12-taller fjernes fra stacken
    expect(find.text("0"), findsExactly(2)); //Resultatet skulle gerne give 0

  });

  testWidgets('Snackbar checker', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyCalculator());

    // Helper function to tap a button and wait for the UI to update
    Future<void> tapButton(String buttonText) async {
      await tester.tap(find.widgetWithText(ElevatedButton, buttonText));
      await tester.pump();
    }

    // Tap buttons and verify the displayed input and stack
    await tapButton("1");
    expect(find.text("1"), findsExactly(2));

    await tapButton("2");
    expect(find.text("12"), findsOneWidget);

    await tapButton("ENTER");

    await tapButton("x");
    expect(find.text("Not enough items in the stack"), findsOneWidget);

  });
}

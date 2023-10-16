import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/widget_test/counter_app/counter_app.dart';

// Counter - Widget Test
// Testing in isolation

void main() {
  // Increment FAB button widget test
  testWidgets(
    'Given: Counter is zero. When: Increment button is clicked. Then: Counter should be one.',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CounterAppWidgetTest(
            title: "This is a mock widget test.",
          ),
        ),
      ); // Pump wiget - Renders the UI

      // Scans the entire UI to find for the given text/ String
      var count = find.text('0');
      // Runs test and tries to find one instance of the giv en text/ String
      expect(count, findsOneWidget);

      count = find.text("1");
      expect(count, findsNothing);

      // Now lets find the FAB and connect it
      // final fab = find.byType(FloatingActionButton); // Works when we only have one FAB in MyHomePage

      // When we have two of the same widgets then in that case we need to use KEYS to distinguish them
      final incFab = find.byKey(
        const Key("Increment"),
      ); // Searches for widget with the similar key

      // final decFab = find.byKey(
      //   const Key("Decrement"),
      // ); // Searches for widget with the similar key

      // tester helps us to simulate user interactions
      // user interactions are always async...
      await tester.tap(incFab);

      await tester.pump(); // Calling pump refreshes the widget.

      // Counter value should be one now
      count = find.text("1");
      expect(count, findsOneWidget);
    },
  );

  // Decrement FAB button widget test
  testWidgets(
    'Given: Counter is zero. When: Decrement button is clicked. Then: Counter should be minus one.',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CounterAppWidgetTest(
            title: "This is a mock widget test.",
          ),
        ),
      ); // Pump wiget - Renders the UI

      // Scans the entire UI to find for the given text/ String
      var count = find.text('0');
      // Runs test and tries to find one instance of the giv en text/ String
      expect(count, findsOneWidget);

      count = find.text("-1");
      expect(count, findsNothing);

      // Now lets find the FAB and connect it // Searches for widget with the similar key
      final decFab = find.byKey(
        const Key("Decrement"),
      ); // Searches for widget with the similar key

      // tester helps us to simulate user interactions
      // user interactions are always async...
      await tester.tap(decFab);

      await tester.pump(); // Calling pump refreshes the widget.

      // Counter value should be -one now
      count = find.text("-1");
      expect(count, findsOneWidget);
    },
  );
}

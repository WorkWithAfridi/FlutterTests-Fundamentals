import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/widget_test/user_list_app/model/user_model.dart';
import 'package:flutter_tests/widget_test/user_list_app/user_list_app.dart';

void main() {
  final users = [
    User(id: 1, name: 'Rivaan', email: 'rivaan@gmail.com'),
    User(id: 2, name: 'Naman', email: 'naman@gmail.com'),
  ];

  Future<List<User>> mockFetchUsers() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => users,
    );
  }

  testWidgets(
    'Given: Renders UI. When: Before loading list. Then: We see a loading indicator.',
    (tester) async {
      // Pump widget to render the UI
      await tester.pumpWidget(
        MaterialApp(
          home: UserListAppWidgetTest(
            // futureUsers: UserRepository().fetchUsers(),
            // // WE cannot make network calls while writing test cases, best use mocked data!
            futureUsers: mockFetchUsers(), // Gets mocked used list data
          ),
        ),
      );

      // Now lets check if we have the loader loading
      final loader = find.byType(CircularProgressIndicator);

      // We expect to see a loading indicator
      expect(loader, findsOneWidget);

      await tester.pumpAndSettle(); // We need to wait until all the future has been resolved before disposing.
    },
  );

  testWidgets(
    'Given: List of user is rendered. When: After loading list. Then: We see a list of users.',
    (tester) async {
      // Pump widget to render the UI
      await tester.pumpWidget(
        MaterialApp(
          home: UserListAppWidgetTest(
            // futureUsers: UserRepository().fetchUsers(),
            // // WE cannot make network calls while writing test cases, best use mocked data!
            futureUsers: mockFetchUsers(), // Gets mocked used list data
          ),
        ),
      );

      // Now lets check if we have the loader loading
      final loader = find.byType(CircularProgressIndicator);
      // We expect to see a loading indicator
      expect(loader, findsOneWidget);

      // Refreshes UI once
      // await tester.pump();
      // Refreshing the UI only once while making network calls wont work since we are using async/await

      await tester.pumpAndSettle(); // Keeps on refreshing the ui until all the future has been resolved.

      // Test to see if the UI has been rendered or not.
      expect(find.byType(ListView), findsOneWidget);

      expect(
        find.byType(ListTile),
        findsNWidgets(users.length),
      ); // Finds and confirms N = users.length of widgets are being rendered.

      // Now lets check if the UI rendered all the data correctly or not
      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}

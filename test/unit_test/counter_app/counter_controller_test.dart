import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/unit_test/counter_app/counter_controller.dart';

//  Unit Test
//  Unit testing in Flutter focuses on testing individual functions or methods in isolation.
//  These tests verify the correctness of your app's core logic and algorithms.

// Running from the main runs all the test cases.
void main() {
  // Pre test functions - These are ran before the first test is ran
  setUp(() => null); // Called before every test cases. Runs N times.
  setUpAll(() => null); // Called once before all the test case in the current main function. Runs 1 time.

  // Post test functions - These are ran after all the test cases in this main function has been completed.
  tearDown(() => null); // Called after every test cases. Runs N times.
  tearDownAll(() => null); // Called once after all the test case in the current main function. Runs 1 time.

  // Purpose: These methods help you set up and tear down resources needed for your tests.
  // setUp is executed before each test, while tearDown is executed after each test.

  // Running single functions just runs and tests that specific funtion.
  test(
    "Given: A counter controller, When: when instantiated, Then: value of count should be zero.",
    () {
      final CounterController counterController = CounterController();
      final countValue = counterController.count;

      expect(countValue, 0); // Check if value of counter is zero or now, when the counter controller has been instantiated.
    },
  );

  // To categorize tests together, use the group function.
  // That way tests of the same category will run together.
  group(
    "Testing the functions of the CounterController",
    () {
      final CounterController counterController = CounterController(); // One instance of counter class is created for the whole group test

      test(
        "Given: A counter controller, When: when incremented, Then: value of count should be 1.",
        () {
          var countValue = counterController.count;

          expect(countValue, 0); // Check if value of counter is zero or not, when the counter controller has been instantiated.

          counterController.incrementCounter(); // increments count value by one

          countValue = counterController.count;
          expect(countValue, 1); // Check if value of counter is 1 or not, after the counter controller ran the increment function.
        },
      );

      test(
        "Given: A counter controller, When: when decemented, Then: value of count should be 1.",
        () {
          var countValue = counterController.count; // Counter is now 1 from previous test

          expect(countValue, 1); // Check if value of counter is zero or not, when the counter controller has been instantiated.

          counterController.decrementCounter(); // decrement count value by one : Count is 0

          countValue = counterController.count;
          expect(countValue, 0); // Check if value of counter is 0 or not, after the counter controller ran the decrement function.

          counterController.decrementCounter(); // decrement count value by one : Count is 1

          countValue = counterController.count;
          expect(countValue, -1); // Check if value of counter is 1 or not, after the counter controller ran the decrement function.
        },
      );
    },
  );
}

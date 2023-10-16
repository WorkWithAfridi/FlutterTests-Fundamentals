import 'package:flutter/material.dart';
import 'package:flutter_tests/unit_test/counter_app/counter_controller.dart';

// For Counter - Widget Test

class CounterAppUnitTest extends StatefulWidget {
  const CounterAppUnitTest({super.key});

  @override
  State<CounterAppUnitTest> createState() => _CounterAppUnitTestState();
}

class _CounterAppUnitTestState extends State<CounterAppUnitTest> {
  final CounterController counterController = CounterController();

  void _incrementCounter() {
    setState(() {
      counterController.incrementCounter();
    });
  }

  void _decrementCounter() {
    setState(() {
      counterController.decrementCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Unit Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterController.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key("Increment"),
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 12,
          ),
          FloatingActionButton(
            key: const Key("Decrement"),
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(
              Icons.delete,
            ),
          )
        ],
      ),
    );
  }
}

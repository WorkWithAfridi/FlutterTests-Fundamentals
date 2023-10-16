import 'package:flutter/material.dart';

// For Counter - Widget Test

class CounterAppWidgetTest extends StatefulWidget {
  const CounterAppWidgetTest({super.key, required this.title});

  final String title;

  @override
  State<CounterAppWidgetTest> createState() => _CounterAppWidgetTestState();
}

class _CounterAppWidgetTestState extends State<CounterAppWidgetTest> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
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

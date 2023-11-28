import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required int counter,
    required this.increment,
    required this.decrement,
  }) : _counter = counter;

  final int _counter;
  final void Function() increment;
  final void Function() decrement;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(onPressed: increment, child: const Text("+")),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(onPressed: decrement, child: const Text("-"))
                  ],
                )
              ],
            )));
  }
}

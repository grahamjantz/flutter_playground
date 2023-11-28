import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/todo_widget.dart';
import './widgets/counter_widget.dart';
import './widgets/greeting_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 40, 145, 243)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Playground'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> todos = [];

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

  void _enterName(name) {
    setState(() {});
  }

  void _addTodo(String todo) {
    setState(() {
      todos.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Counter(
                          counter: _counter,
                          increment: _incrementCounter,
                          decrement: _decrementCounter,
                        ),
                        const SizedBox(height: 16.0),
                        Greeting(
                          onNameSubmitted: (name) {
                            _enterName(name);
                          },
                        ),
                        Card(
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: todos.map((todo) {
                                    return Text(todo);
                                  }).toList(),
                                ))),
                        Todo(
                          onTodoAdded: _addTodo,
                        ),
                        // This trailing comma makes auto-formatting nicer for build methods.
                      ],
                    )))));
  }
}

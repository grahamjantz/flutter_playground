import 'package:flutter/material.dart';

class Greeting extends StatefulWidget {
  const Greeting({
    Key? key,
    required this.onNameSubmitted,
    // required this.name,
    // required this.onNameChanged,
  }) : super(key: key);

  // final String name;
  // final void Function(String) onNameChanged;
  final void Function(String) onNameSubmitted;

  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  late String _name;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text('Hello: $_name'),
                    TextField(
                      controller: _nameController,
                      decoration:
                          const InputDecoration(labelText: 'Enter a Name'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _name = _nameController.text;
                          widget.onNameSubmitted(_name);
                          _nameController.text = '';
                        });
                      },
                      child: const Text('Submit'),
                    )
                  ],
                ))));
  }
}

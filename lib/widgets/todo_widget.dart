import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final void Function(String) onTodoAdded;

  const Todo({required this.onTodoAdded});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: "Enter Todo"),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () {
                  String enteredText = _textController.text;
                  onTodoAdded(enteredText);
                  _textController.clear();
                },
                child: const Text('Add Todo'))
          ],
        ));
  }
}

// class Todo extends StatefulWidget {
//   const Todo({super.key});

//   @override
//   _TodoState createState() => _TodoState();
// }

// class _TodoState extends State<Todo> {
//   final TextEditingController _textController = TextEditingController();
//   String _text = '';

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

//   void _updateText(String value) {
//     setState(() {
//       _text = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           TextField(
//             controller: _textController,
//             decoration: const InputDecoration(labelText: 'Enter text'),
//             onChanged: _updateText,
//           ),
//           const SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               String enteredText = _textController.text;
//               print('Entered Text: $_text');
//             },
//             child: const Text('Submit'),
//           )
//         ]));
//   }
// }

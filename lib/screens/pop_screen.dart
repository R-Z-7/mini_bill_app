import 'package:flutter/material.dart';

class Pop extends StatelessWidget {
  const Pop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

///////////////////////////////
class MyHomePage extends StatefulWidget {
  List<Widget> cards = [];

  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? label = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Items"),
      ),
      body: Center(child: Text(label ?? "")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var resultLabel = await _showTextInputDialog(context);
          if (resultLabel != null) {
            setState(() {
              label = resultLabel;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  final _textFieldController = TextEditingController();

  Future<String?> _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('TODO'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Please Add Items"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () =>
                    Navigator.pop(context, _textFieldController.text),
              ),
            ],
          );
        });
  }
}

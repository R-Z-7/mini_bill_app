import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mini_bill_app/screens/pop_screen.dart';

class Bills extends StatefulWidget {
  const Bills({super.key});

  @override
  State<Bills> createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  // List<String> goroceries = ['Apples', 'Oranges', 'Bananas'];
  // List<String> prices = ['1.03', '2.03', '1.73'];

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _qtyController = TextEditingController();
  final _personFormKey = GlobalKey<FormState>();

  late final Box box;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('Box1');
  }

  String? label = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text("goroceries[index]"),
                trailing: Text("Test"),
              ),
            );
          }),
      persistentFooterButtons: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                var resultLabel = await _showTextInputDialog(context);
                if (resultLabel != null) {
                  setState(() {
                    label = resultLabel;
                  });
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(FontAwesomeIcons.plus),
                  new Text('ADD'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  final _textFieldController = TextEditingController();

  Future<String?> _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Items'),
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

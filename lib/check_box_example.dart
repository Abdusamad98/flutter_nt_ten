import 'package:flutter/material.dart';

class CheckBoxExample extends StatefulWidget {
  const CheckBoxExample({super.key});

  @override
  State<CheckBoxExample> createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  bool checkBoxState = false;

  List<bool> selectionStates = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Box"),
      ),
      body: Column(
        children: [
          ...List.generate(
            selectionStates.length,
            (index) => ListTile(
              onTap: () {
                setState(() {
                  selectionStates[index] = !selectionStates[index];
                });
              },
              title: const Text("IS TEENAGER"),
              trailing: Checkbox(
                value: selectionStates[index],
                onChanged: (v) {
                  setState(() {
                    selectionStates[index] = !selectionStates[index];
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

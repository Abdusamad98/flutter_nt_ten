import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButtonExample extends StatefulWidget {
  const SwitchButtonExample({super.key});

  @override
  State<SwitchButtonExample> createState() => _SwitchButtonExampleState();
}

class _SwitchButtonExampleState extends State<SwitchButtonExample> {
  bool switchState = false;
  bool switchState2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Button"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Change Theme"),
            trailing: Platform.isAndroid
                ? Switch(
                    activeColor: Colors.red,
                    inactiveTrackColor: Colors.green,
                    value: switchState,
                    onChanged: (v) {
                      switchState = !switchState;
                      setState(() {});
                    },
                  )
                : CupertinoSwitch(
                    value: switchState,
                    onChanged: (v) {
                      switchState = !switchState;
                      setState(() {});
                    },
                  ),
          ),
          ListTile(
            title: const Text("Change Theme"),
            trailing: CupertinoSwitch(
              value: switchState2,
              onChanged: (v) {
                switchState2 = !switchState2;
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}

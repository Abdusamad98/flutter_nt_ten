
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.function});

  final Function(int a) function;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SECOND SCREEN"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              setState(() {});
              widget.function.call(100);
            },
            child: Text(
              "SEND NUMBER",
              style: AppTextStyle.interSemiBold.copyWith(fontSize: 35),
            ),
          )
        ],
      ),
    );
  }
}

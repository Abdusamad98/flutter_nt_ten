import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    super.key,
    required this.number,
  });

  final int number;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: Text(
          widget.number.toString(),
          style: AppTextStyle.interSemiBold.copyWith(fontSize: 50),
        ),
      ),
    );
  }
}

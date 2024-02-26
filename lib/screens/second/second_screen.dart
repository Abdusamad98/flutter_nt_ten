import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
    required this.numberOne,
    required this.numberTwo,
    required this.name,
  });

  final int numberOne;
  final int numberTwo;
  final String name;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Column(
        children: [
          Text(
            widget.numberOne.toString(),
            style: AppTextStyle.interSemiBold.copyWith(fontSize: 50),
          ),
          Text(
            widget.numberTwo.toString(),
            style: AppTextStyle.interSemiBold.copyWith(fontSize: 50),
          ),
          Text(
            widget.name,
            style: AppTextStyle.interSemiBold.copyWith(fontSize: 50),
          )
        ],
      ),
    );
  }
}

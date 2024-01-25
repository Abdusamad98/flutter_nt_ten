import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COUNTER SCREEN"),
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: AppTextStyle.interMedium.copyWith(fontSize: 50),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              counter++;
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              counter--;
              setState(() {});
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

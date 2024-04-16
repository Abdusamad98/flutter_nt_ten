import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/counter/counter_controller.dart';
import 'package:flutter_nt_ten/screens/other/other_screen.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:get/get.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.oldCounter});

  final int oldCounter;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("COUNTER GETX EXAMPLE"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return OtherScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.other_houses),
          )
        ],
      ),
      body: Center(
        child: Obx(
          () => Text(
            controller.counter.toString(),
            style: AppTextStyle.interSemiBold.copyWith(fontSize: 32),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                controller.increment();
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 12),
            FloatingActionButton(
              onPressed: () {
                controller.decrement();
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

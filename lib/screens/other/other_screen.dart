import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/counter/counter_controller.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:get/get.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({super.key});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("COUNTER GETX EXAMPLE OTHER SCREEN"),
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

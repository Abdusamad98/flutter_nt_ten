import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_nt_ten/view_models/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterDecrementScreen extends StatelessWidget {
  const CounterDecrementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Decrement"),
      ),
      body: Column(
        children: [
          Image.network(
            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
          ),
          Text(
            context.watch<CounterViewModel>().getCounter.toString(),
            style: AppTextStyle.interSemiBold.copyWith(fontSize: 42),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterViewModel>().decrement();
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}

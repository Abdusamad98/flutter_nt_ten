import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/counter/counter_decrement_screen.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_nt_ten/view_models/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: const Text("Increment"),
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
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CounterDecrementScreen();
                    },
                  ),
                );
              },
              child: const Icon(Icons.arrow_forward),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterViewModel>().increment();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}

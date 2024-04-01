import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/screens/counter/cubit/counter_cubit.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Counter Screen")),
            body: Center(
              child: Text(
                state.toString(),
                //context.watch<CounterCubit>().state.toString(),
                style: AppTextStyle.interSemiBold.copyWith(fontSize: 24),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 12),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

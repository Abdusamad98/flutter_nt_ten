import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/calculator/calculator_cubit.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController numberAController = TextEditingController();
  final TextEditingController numberBController = TextEditingController();

  @override
  void dispose() {
    numberAController.dispose();
    numberBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculator Screen"),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: numberAController,
                decoration: const InputDecoration(labelText: "Enter A:"),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d+$'))
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d+$'))
                ],
                keyboardType: TextInputType.number,
                controller: numberBController,
                decoration: const InputDecoration(labelText: "Enter B:"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      double? num1 = double.tryParse(numberAController.text);
                      double? num2 = double.tryParse(numberBController.text);

                      if (num1 != null && num2 != null) {
                        context.read<CalculatorCubit>().addition(num1, num2);
                      }
                    },
                    child: Text(
                      "+",
                      style: AppTextStyle.interSemiBold.copyWith(fontSize: 42),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      double? num1 = double.tryParse(numberAController.text);
                      double? num2 = double.tryParse(numberBController.text);

                      if (num1 != null && num2 != null) {
                        context.read<CalculatorCubit>().subtruction(num1, num2);
                      }
                    },
                    child: Text(
                      "-",
                      style: AppTextStyle.interSemiBold.copyWith(fontSize: 42),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      double? num1 = double.tryParse(numberAController.text);
                      double? num2 = double.tryParse(numberBController.text);

                      if (num1 != null && num2 != null) {
                        context
                            .read<CalculatorCubit>()
                            .multiplication(num1, num2);
                      }
                    },
                    child: Text(
                      "*",
                      style: AppTextStyle.interSemiBold.copyWith(fontSize: 42),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      double? num1 = double.tryParse(numberAController.text);
                      double? num2 = double.tryParse(numberBController.text);

                      if (num1 != null && num2 != null) {
                        context.read<CalculatorCubit>().division(num1, num2);
                      }
                    },
                    child: Text(
                      "/",
                      style: AppTextStyle.interSemiBold.copyWith(fontSize: 42),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<CalculatorCubit, CalculatorState>(
                builder: (context, state) {
                  debugPrint("STATE:${state.runtimeType.toString()}");

                  // if (state is CalculatorInputErrorState) {
                  //   Future.microtask(
                  //     () => ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text(state.errorCause),
                  //       ),
                  //     ),
                  //   );
                  // }
                  //
                  // if (state is CalculatorCalculatingState) {
                  //   return const Center(
                  //     child: Text("CALCULATING!..."),
                  //   );
                  // }
                  //
                  // if (state is CalculatorResultState) {
                  //   return Center(
                  //     child: Text(
                  //       state.result,
                  //       style:
                  //           AppTextStyle.interSemiBold.copyWith(fontSize: 24),
                  //     ),
                  //   );
                  // }

                  switch (state.runtimeType) {
                    case CalculatorInputErrorState:
                      {
                        state as CalculatorInputErrorState;
                        Future.microtask(
                          () => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorCause),
                            ),
                          ),
                        );
                      }
                    case CalculatorCalculatingState:
                      return const Center(
                        child: Text("CALCULATING!..."),
                      );
                    case CalculatorResultState:
                      {
                        state as CalculatorResultState;
                        return Center(
                          child: Text(
                            state.result,
                            style: AppTextStyle.interSemiBold
                                .copyWith(fontSize: 24),
                          ),
                        );
                      }
                  }

                  return const Center(
                    child: Text("Default, Initial state"),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

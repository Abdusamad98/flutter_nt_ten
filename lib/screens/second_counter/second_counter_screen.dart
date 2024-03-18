import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_nt_ten/view_models/second_counter_view_model.dart';
import 'package:provider/provider.dart';

class SecondCounterScreen extends StatelessWidget {
  const SecondCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    debugPrint("SECOND COUNTER SCREEN");

    return Scaffold(
      body: Center(
        child: Text(
          "Second:${context.watch<SecondCounterViewModel>().second}",
          style: AppTextStyle.interSemiBold.copyWith(
            fontSize: 32,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

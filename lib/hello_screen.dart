import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/global_widgets/custom_button.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text("Deafult"),
      ),
      body: Column(
        children: [
          const CustomButton(
            height: 100,
            child: Center(child: Text("Hello")),
          ),
          TextButton(onPressed: () {}, child: Text("Hello"))
        ],
      ),
    );
  }
}

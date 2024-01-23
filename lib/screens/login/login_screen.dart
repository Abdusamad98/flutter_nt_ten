import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/register/register_screen.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterScreen();
                  },
                ),
              );
            },
            child: Text(
              "REGISTER",
              style: AppTextStyle.interBold.copyWith(fontSize: 32),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "LOGIN USER",
              style: AppTextStyle.interBold.copyWith(fontSize: 32),
            ),
          )
        ],
      ),
    );
  }
}

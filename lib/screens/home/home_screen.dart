import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/user_model.dart';
import 'package:flutter_nt_ten/screens/routes.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Default"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return FirstScreen(
              //         number: 100,
              //       );
              //     },
              //   ),
              // );
              Navigator.pushNamed(context, RouteNames.firstScreen,
                  arguments: 123);
            },
            child: Text(
              "First Screen ",
              style: AppTextStyle.interSemiBold.copyWith(fontSize: 50),
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return SecondScreen();
              //     },
              //   ),
              // );
              Navigator.pushNamed(
                context,
                RouteNames.secondScreen,
                arguments: {
                  "number_1": 3456,
                  "number_2": 2000,
                  "name": "Abdulloh",
                },
              );
            },
            child: Text(
              "Second Screen ",
              style: AppTextStyle.interSemiBold.copyWith(fontSize: 50),
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return ThirdScreen();
              //     },
              //   ),
              // );
              // TODO Step 4
              Navigator.pushReplacementNamed(
                context,
                RouteNames.thirdScreen,
                arguments: UserModel(
                  lastName: "lastName",
                  age: 30,
                  userName: "userName",
                ),
              );
            },
            child: Text(
              "Third Screen ",
              style: AppTextStyle.interSemiBold.copyWith(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}

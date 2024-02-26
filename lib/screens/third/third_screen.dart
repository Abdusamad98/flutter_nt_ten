import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/user_model.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: Column(
        children: [
          Text(
            widget.userModel.userName,
            style: AppTextStyle.interSemiBold.copyWith(fontSize: 50),
          )
        ],
      ),
    );
  }
}

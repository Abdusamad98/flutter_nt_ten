import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class RichTextScreen extends StatelessWidget {
  const RichTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Deafult"),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: "HELLO",
            style: AppTextStyle.interSemiBold.copyWith(
              fontSize: 32,
            ),
            children: [
              TextSpan(
                  text: "WORLD",
                  style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.c_1A72DD,
                  ),
                  children: [
                    TextSpan(
                      text: "BLACK",
                      style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.black,
                        fontSize: 24,
                      ),
                    )
                  ]),
              TextSpan(
                text: "HERE",
                style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_F4261A,
                  fontSize: 24,
                ),
              ),
              TextSpan(
                text: "HERE",
                style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.black,
                  fontSize: 24,
                ),
              ),
              TextSpan(
                text: "HERE",
                style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_F4261A,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

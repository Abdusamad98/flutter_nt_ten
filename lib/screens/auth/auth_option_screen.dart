import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/auth/widgets/auth_button.dart';
import 'package:flutter_nt_ten/screens/widgets/simple_global_button.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class AuthOptionScreen extends StatefulWidget {
  const AuthOptionScreen({super.key});

  @override
  State<AuthOptionScreen> createState() => _AuthOptionScreenState();
}

class _AuthOptionScreenState extends State<AuthOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.getW()),
              child: Image.asset(AppImages.authOptionImage)),
          SizedBox(height: 50.getH()),
          Text(
            "Welcome to Medtech",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppTextStyle.interBold.copyWith(
              fontSize: 24,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.getH()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.getW()),
            child: Text(
              "Do you want some help with your health to get better life?",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: AppTextStyle.interRegular.copyWith(
                fontSize: 16,
                color: AppColors.c_090F47.withOpacity(0.45),
              ),
            ),
          ),
          SizedBox(height: 34.getH()),
          SimpleGlobalButton(
            horizontalPadding: 32.getW(),
            onTap: () {},
            title: "SIGN UP WITH EMAIL",
          ),
          SizedBox(height: 4.getH()),
          AuthButton(
            iconPath: AppImages.facebook,
            onTap: () {},
            title: "Continue with facebook",
          ),
          AuthButton(
            iconPath: AppImages.google,
            onTap: () {},
            title: "Continue with GMAIL",
          ),
          SizedBox(height: 4.getH()),
          TextButton(
            onPressed: () {

            },
            child: Text(
              "LOGIN",
              style: AppTextStyle.interRegular.copyWith(
                  fontSize: 14, color: AppColors.c_090F47.withOpacity(0.45)),
            ),
          ),
        ],
      ),
    );
  }
}

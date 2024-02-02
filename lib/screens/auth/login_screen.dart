import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/auth/widgets/password_text_input.dart';
import 'package:flutter_nt_ten/screens/auth/widgets/universal_text_input.dart';
import 'package:flutter_nt_ten/screens/widgets/empty_global_appbar.dart';
import 'package:flutter_nt_ten/screens/widgets/simple_global_button.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const EmptyGlobalAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back!",
                        style: AppTextStyle.interBold.copyWith(
                          color: AppColors.c_090F47,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 24.getH()),
                      UniversalTextField(
                        regExp: RegExp("[a-zA-Z]"),
                        controller: usernameController,
                        iconPath: AppImages.person,
                        hintText: "Username",
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 16.getH()),
                      PasswordTextField(
                        controller: passwordController,
                        iconPath: AppImages.lock,
                        isVisible: false,
                        suffix: GestureDetector(
                          onTap: () {},
                          child: const Text("Forgot"),
                        ),
                      ),
                      SizedBox(height: 24.getH()),
                      SimpleGlobalButton(
                        onTap: () {
                          bool validated = formKey.currentState!.validate();
                          print(validated);
                          if (validated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("SUCCESS!")));
                          }
                        },
                        title: "LOGIN",
                        horizontalPadding: 0,
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 12,
                      color: AppColors.c_090F47.withOpacity(0.45),
                    ),
                    SizedBox(width: 8.getW()),
                    Text(
                      "Don’t have an account? Sign Up",
                      style: AppTextStyle.interRegular.copyWith(
                        fontSize: 14,
                        color: AppColors.c_090F47.withOpacity(0.45),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

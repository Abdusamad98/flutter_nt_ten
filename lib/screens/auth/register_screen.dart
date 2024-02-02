import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/auth/widgets/password_text_input.dart';
import 'package:flutter_nt_ten/screens/auth/widgets/universal_text_input.dart';
import 'package:flutter_nt_ten/screens/widgets/empty_global_appbar.dart';
import 'package:flutter_nt_ten/screens/widgets/simple_global_button.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = false;

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
                        "Create your account!",
                        style: AppTextStyle.interBold.copyWith(
                          color: AppColors.c_090F47,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 24.getH()),
                      UniversalTextField(
                        labelText: "Your name",
                        errorText: "Ismni to'g'ri  kiriting!",
                        regExp: RegExp("[a-zA-Z]"),
                        controller: usernameController,
                        iconPath: "",
                        hintText: "Your Name",
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 8.getH()),
                      UniversalTextField(
                        labelText: "Mobile number",
                        errorText: "Telefon raqamni to'g'ri  kiriting!",
                        regExp: RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)'),
                        controller: phoneController,
                        iconPath: "",
                        hintText: "Mobile Number",
                        type: TextInputType.phone,
                      ),
                      SizedBox(height: 8.getH()),
                      UniversalTextField(
                        errorText: "Emailni to'g'ri  kiriting!",
                        regExp: RegExp(
                            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'),
                        controller: emailController,
                        iconPath: "",
                        hintText: "Email",
                        type: TextInputType.emailAddress,
                      ),
                      PasswordTextField(
                        controller: passwordController,
                        iconPath: "",
                        isVisible: passwordVisibility,
                        suffix: IconButton(
                          onPressed: () {
                            passwordVisibility = !passwordVisibility;
                            setState(() {});
                          },
                          icon: Icon(
                            passwordVisibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
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
                        title: "REGISTER",
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

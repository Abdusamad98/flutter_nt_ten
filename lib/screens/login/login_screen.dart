import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nt_ten/screens/register/register_screen.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.arrowBack),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              "Welcome back",
              style: AppTextStyle.interSemiBold.copyWith(
                fontSize: 32,
                color: AppColors.c_1E535F,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Enter your credential to continue",
              style: AppTextStyle.interRegular.copyWith(
                fontSize: 16,
                color: AppColors.c_F4261A,
              ),
            ),
            const SizedBox(height: 36),
            TextField(
              textInputAction: TextInputAction.next,
              readOnly: false,
              enabled: true,
              maxLines: 1,
              onChanged: (value) {
                String name = value;
                print("Current: $name");
              },
              onSubmitted: (value) {
                print("NAME:$value");
              },
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(AppImages.person),
                ),
                // prefix: const Icon(Icons.add),
                // suffixIcon: Padding(
                //   padding: const EdgeInsets.all(12),
                //   child: SvgPicture.asset(AppImages.viewEye),
                // ),
                // suffix:const Padding(
                //   padding:  EdgeInsets.all(12),
                //   child:  Icon(Icons.clear),
                // ),
                hintText: "Email or username",
                hintStyle: AppTextStyle.interMedium,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              obscureText: true,
              textInputAction: TextInputAction.done,
              readOnly: false,
              enabled: true,
              maxLines: 1,
              onChanged: (value) {
                String name = value;
                print("Current: $name");
              },
              onSubmitted: (value) {
                print("NAME:$value");
              },
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(AppImages.lock),
                ),
                // prefix: const Icon(Icons.add),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(AppImages.viewEye),
                ),
                // suffix:const Padding(
                //   padding:  EdgeInsets.all(12),
                //   child:  Icon(Icons.clear),
                // ),
                hintText: "Password",
                hintStyle: AppTextStyle.interMedium,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
                child: Text("REGISTER"))
          ],
        ),
      ),
    );
  }

  _getMyTextField(
    String hintText,
    String suffixIconPath,
  ) {
    return TextField();
  }
}

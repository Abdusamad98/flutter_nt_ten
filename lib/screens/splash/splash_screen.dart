import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nt_ten/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OnBoardingScreen();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppImages.back,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
            Container(
              width: width,
              height: height,
              color: AppColors.c_4157FF.withOpacity(0.9),
            ),
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.c_4157FF.withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 15,
                          )
                        ],
                      ),
                      child: SvgPicture.asset(AppImages.logo),
                    ),
                    Text(
                      "Medtech",
                      style: AppTextStyle.interSemiBold.copyWith(
                        fontSize: 28,
                        color: AppColors.white,
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

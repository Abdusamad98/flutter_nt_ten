import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.c_1A72DD,
              ),
              child: Center(child: SvgPicture.asset(AppImages.delete)),
            ),
            const SizedBox(width: 8),
            Text(
              "MokPOS",
              style: AppTextStyle.interMedium.copyWith(
                fontSize: 24,
                color: AppColors.c_1A72DD,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 105,
          ),
          Image.asset(AppImages.boy),
          const SizedBox(height: 40),

          const Text(
            "Easy Management for your Store.",
            style: AppTextStyle.interSemiBold,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getDivider(AppColors.c_1A72DD),
              const SizedBox(width: 8),
              getDivider(AppColors.c_C4C4C4),
              const SizedBox(width: 8),
              getDivider(AppColors.c_C4C4C4),
            ],
          ),
        ],
      ),
    );
  }

  Container getDivider(Color color) {
    return Container(
      height: 5,
      width: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: color,
      ),
    );
  }
}

// Light: 100,200,300
// Regular: 400
// Medium: 500
// SemiBold: 600
// Bold: 700
// Black: 800-900

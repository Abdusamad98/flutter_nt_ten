import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.iconPath,
  });

  final VoidCallback onTap;
  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.getH()),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: width,
      child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 13),
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(100))),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath),
              SizedBox(width: 21.getW()),
              Text(
                title.toUpperCase(),
                style: AppTextStyle.interBold.copyWith(
                  fontSize: 16,
                  color: AppColors.c_090F47.withOpacity(0.75),
                ),
              ),
            ],
          )),
    );
  }
}

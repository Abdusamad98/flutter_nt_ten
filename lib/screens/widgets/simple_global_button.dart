import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class SimpleGlobalButton extends StatelessWidget {
  const SimpleGlobalButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.horizontalPadding,
  });

  final VoidCallback onTap;
  final String title;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 13),
            backgroundColor: AppColors.c_4157FF,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        onPressed: () {},
        child: Text(
          title,
          style: AppTextStyle.interBold.copyWith(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

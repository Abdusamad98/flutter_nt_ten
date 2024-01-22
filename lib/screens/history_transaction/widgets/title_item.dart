import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class TitleItem extends StatelessWidget {
  const TitleItem({super.key, required this.title, required this.priceText});

  final String title;
  final String priceText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.interMedium.copyWith(
              fontSize: 12,
              color: AppColors.c_2A3256,
            ),
          ),
          Text(
            priceText,
            style: AppTextStyle.interSemiBold.copyWith(
              fontSize: 12,
              color: AppColors.c_2A3256,
            ),
          )
        ],
      ),
    );
  }
}

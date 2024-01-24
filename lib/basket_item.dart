import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketIcon extends StatelessWidget {
  const BasketIcon({super.key, required this.count});

  final String count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(30),
          child: SvgPicture.asset(
            AppImages.basket,
            width: 78,
            height: 60,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: count.length > 2 ? 100 : 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.white,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(50),
              color: AppColors.black,
            ),
            child: Center(
              child: Text(
                count,
                style: AppTextStyle.interMedium
                    .copyWith(color: AppColors.white, fontSize: 32),
              ),
            ),
          ),
        )
      ],
    );
  }
}

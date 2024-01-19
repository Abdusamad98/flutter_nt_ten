import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
    required this.title,
    required this.subTitle,
    this.buttonText,
  });

  final String title;
  final String subTitle;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
              spreadRadius: 10,
              blurRadius: 8,
              color: Colors.grey.shade200,
              offset: const Offset(2, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.interRegular.copyWith(
              fontSize: 14,
              color: AppColors.c_3B3B3B,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 33,
                width: 33,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.c_F8D52B,
                ),
                child: Center(
                  child: SvgPicture.asset(AppImages.location),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subTitle,
                      style: AppTextStyle.interSemiBold,
                      //overflow: TextOverflow.ellipsis,
                    ),
                    if (buttonText != null) const SizedBox(height: 20),
                    if (buttonText != null)
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          buttonText!,
                          style: AppTextStyle.bodoniRegular.copyWith(
                              //foreground: Paint()..shader = (AppColors.linearGradient as LinearGradient),
                              ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

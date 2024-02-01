import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/page_data_model.dart';
import 'package:flutter_nt_ten/screens/auth/auth_option_screen.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class BoardingBottomView extends StatelessWidget {
  const BoardingBottomView(
      {super.key,
      required this.pagesData,
      required this.activeIndex,
      required this.onTap});

  final List<PageDataModel> pagesData;
  final int activeIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.getW()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AuthOptionScreen();
                  },
                ),
              );
            },
            child: Text(
              "SKIP",
              style: AppTextStyle.interRegular.copyWith(
                  fontSize: 14, color: AppColors.c_090F47.withOpacity(0.45)),
            ),
          ),
          Row(
            children: [
              ...List.generate(
                  pagesData.length,
                  (index) => Container(
                        margin: const EdgeInsets.all(4),
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == activeIndex
                              ? AppColors.c_4157FF
                              : Colors.grey,
                        ),
                      ))
            ],
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              "NEXT",
              style: AppTextStyle.interBold.copyWith(
                fontSize: 14,
                color: AppColors.c_4157FF,
              ),
            ),
          )
        ],
      ),
    );
  }
}

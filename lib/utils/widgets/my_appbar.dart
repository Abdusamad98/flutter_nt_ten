import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 6,
        ),
        child: SvgPicture.asset(
          AppImages.news,
          width: 20,
        ),
      ),
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      elevation: 0,
      backgroundColor: AppColors.c_F6F6F6,
      title: Row(
        children: [
          const Text(
            "All News",
            style: AppTextStyle.interMedium,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.expand_more,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: SvgPicture.asset(
            AppImages.search,
            width: 20,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: SvgPicture.asset(
            AppImages.menu,
            width: 20,
          ),
        ),
        SizedBox(width: 5)
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

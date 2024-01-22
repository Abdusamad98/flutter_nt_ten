import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  const GlobalAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: IconButton(
          icon: SvgPicture.asset(AppImages.arrowBackIos),
          onPressed: () {},
        ),
      ),
      centerTitle: true,
      title: Text(
      title,
        style: AppTextStyle.interSemiBold.copyWith(
          fontSize: 22,
          color: AppColors.c_1A72DD,
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

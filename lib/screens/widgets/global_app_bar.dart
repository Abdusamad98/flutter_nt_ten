import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  const GlobalAppBar({
    super.key,
    required this.onSearchTap,
    required this.onMoreTap,
    required this.backIsVisible,
  });

  final VoidCallback onSearchTap;
  final VoidCallback onMoreTap;
  final bool backIsVisible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: backIsVisible,
      leading: backIsVisible
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
              ),
            )
          : null,
      title: Text(
        "Contacts",
        style: AppTextStyle.interSemiBold.copyWith(
          fontSize: 20,
          color: AppColors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onSearchTap,
          icon: const Icon(
            Icons.search,
            color: AppColors.black,
          ),
        ),
        IconButton(
          onPressed: onMoreTap,
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(
        double.infinity,
        56,
      );
}

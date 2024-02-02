import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/constants/app_constants.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.iconPath,
    required this.isVisible,
    required this.suffix,
  });

  final TextEditingController controller;
  final String iconPath;
  final bool isVisible;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {

    // kamida 8 ta simvol
    // Kamida bitta Katta harf
    // Kamida nitta son
    // Kmaida bitta kichik harfdagi simvol

    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      style: AppTextStyle.interSemiBold.copyWith(
        fontSize: 15,
        color: AppColors.c_090F47,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty || !AppConstants.passwordRegExp
            .hasMatch(value)) {
          return "To'gri parol kiriting!";
        } else {
          return null;
        }
      },
      //autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        errorStyle: AppTextStyle.interRegular.copyWith(color: Colors.red),
        contentPadding: EdgeInsets.symmetric(
          vertical: iconPath.isNotEmpty ? 16.getH() : 8.getH(),
          horizontal: 1.getW(),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.c_090F47.withOpacity(0.3),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.c_090F47.withOpacity(0.3),
          ),
        ),
        prefixIcon: iconPath.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: SvgPicture.asset(iconPath),
              )
            : null,
        suffix: suffix,
        hintText: "Password",
        hintStyle: AppTextStyle.interSemiBold.copyWith(
          fontSize: 15,
          color: AppColors.c_090F47.withOpacity(0.45),
        ),
      ),
    );
  }
}

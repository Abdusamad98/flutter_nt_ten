import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UniversalTextField extends StatelessWidget {
  const UniversalTextField({
    super.key,
    required this.controller,
    required this.iconPath,
    required this.hintText,
    required this.type,
    required this.regExp,
    required this.errorText,
    this.labelText,
  });

  final TextEditingController controller;
  final String iconPath;
  final String hintText;
  final String errorText;
  final TextInputType type;
  final RegExp regExp;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      style: AppTextStyle.interSemiBold.copyWith(
        fontSize: 15,
        color: AppColors.c_090F47,
      ),
      validator: (String? value) {
        if (value == null ||
            value.isEmpty ||
            !regExp.hasMatch(value) ||
            value.length < 3) {
          return errorText;
        } else {
          return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.getH(),
          horizontal: 1.getW(),
        ),
        errorStyle: AppTextStyle.interRegular.copyWith(color: Colors.red),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
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
                child: SvgPicture.asset(
                  iconPath,
                  // colorFilter: const ColorFilter.mode(
                  //   AppColors.c_C4C4C4,
                  //   BlendMode.srcIn,
                  // ),
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: AppTextStyle.interSemiBold.copyWith(
          fontSize: 15,
          color: AppColors.c_090F47.withOpacity(0.45),
        ),
      ),
    );
  }
}

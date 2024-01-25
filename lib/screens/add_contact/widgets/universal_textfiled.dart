import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/extensions/project_extensions.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class UniversalTextField extends StatelessWidget {
  const UniversalTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.onChanged,
    required this.onSubmit,
    this.keyboardType,
  });

  final String title;
  final String hintText;
  final Function(String v) onChanged;
  final Function(String v) onSubmit;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.interMedium,
        ),
        5.getH(),
        TextField(
          style: AppTextStyle.interMedium,
          inputFormatters: [
            if (keyboardType == TextInputType.phone)
              FilteringTextInputFormatter.digitsOnly
          ],
          keyboardType: keyboardType,
          onChanged: onChanged,
          onSubmitted: onSubmit,
          maxLength: keyboardType == TextInputType.phone ? 9 : null,
          decoration: InputDecoration(
            prefixIcon: keyboardType == TextInputType.phone
                ? SizedBox(
                    width: 70.w(),
                    child: const Center(
                      child: Text(
                        "+998",
                        style: AppTextStyle.interMedium,
                      ),
                    ),
                  )
                : null,
            fillColor: AppColors.c_D9D9D9,
            filled: true,
            hintText: hintText,
            hintStyle:
                AppTextStyle.interMedium.copyWith(color: AppColors.c_9E9E9E),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        )
      ],
    );
  }
}

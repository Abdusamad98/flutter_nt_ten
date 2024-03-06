import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Deafult"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr("user_name"),
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                  Text(
                    "Ali",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr("user_lastname"),
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                  Text(
                    "Falonchiyev",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "user_age".tr(),
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                  Text(
                    "Falonchiyev",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "product_detail_screen.product_name".tr(),
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                  Text(
                    "Kartoshka",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "product_detail_screen.product_price".tr(),
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                  Text(
                    "5000 ${tr("som")}",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                context.setLocale(const Locale("uz", "UZ"));
              },
              child: Row(
                children: [
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag_of_Uzbekistan.svg/1000px-Flag_of_Uzbekistan.svg.png",
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "O'zbekcha",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                context.setLocale(const Locale("ru", "RU"));
              },
              child: Row(
                children: [
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/d/d4/Flag_of_Russia.png",
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Русский",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              tr("count_of_people", args: ["120"]),
              style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

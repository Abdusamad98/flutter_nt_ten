import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class BackgroundImageScreen extends StatelessWidget {
  const BackgroundImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        body: Stack(
          children: [
            Image.network(
              "https://e1.pxfuel.com/desktop-wallpaper/885/242/desktop-wallpaper-nature-portrait-thumbnail.jpg",
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
            Container(
              width: width,
              height: height,
              //  color: AppColors.black.withOpacity(0.56),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.white.withOpacity(0.3),
                    AppColors.black.withOpacity(0.9),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(50),
              height: 200,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(18)),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Welcom To The App",
                textAlign: TextAlign.center,
                style: AppTextStyle.interMedium.copyWith(
                  fontSize: 45,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

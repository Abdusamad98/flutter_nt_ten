import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/all_news_screen.dart';
import 'package:flutter_nt_ten/models/news_model.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.8)),
          //  margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 0.55 * height,
          width: width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Material(
            color: AppColors.transparent,
            child: Container(
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImages.bookmark,
                      width: 20,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImages.share,
                      width: 20,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              newsModel.title,
              style: AppTextStyle.interMedium.copyWith(color: AppColors.white),
            ),
          ),
        ),
        Positioned(
            left: 24,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.white),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.fire,
                        width: 20,
                      ),
                      SizedBox(width: 4),
                      Text("Top 10"),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  newsModel.subtitle,
                  style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  newsModel.time,
                  style: AppTextStyle.interMedium
                      .copyWith(color: AppColors.white, fontSize: 14),
                )
              ],
            ))
      ],
    );
  }
}

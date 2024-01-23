import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class NewsItem extends StatelessWidget {
  const NewsItem(
      {super.key, required this.gradientColors, required this.title});

  final List<Color> gradientColors;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: (80 / 812) * MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: gradientColors),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.interMedium.copyWith(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/homework/news_item.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class HomeworkExample extends StatelessWidget {
  const HomeworkExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Deafult"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: const Row(
          children: [
            NewsItem(
              gradientColors: [
                AppColors.c_2A3256,
                AppColors.c_1A72DD,
              ],
              title: "Short news will be here",
            ),
            SizedBox(width: 10),
            NewsItem(
              gradientColors: [
                AppColors.c_1A72DD,
                AppColors.c_C4C4C4,
              ],
              title:
                  "Short news will be here here here here will be here here here here",
            ),
          ],
        ),
      ),
    );
  }
}

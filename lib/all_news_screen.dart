import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/repository.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_nt_ten/utils/widgets/my_appbar.dart';
import 'package:flutter_nt_ten/utils/widgets/news_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

double width = 0;
double height = 0;

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.c_F6F6F6,
      appBar: MyAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 16),
          CarouselSlider(
            items: List.generate(
              news.length,
              (index) {
                return NewsItem(newsModel: news[index]);
              },
            ),
            options: CarouselOptions(
              height: 0.55 * height,
              aspectRatio: 16 / 9,
              viewportFraction: 0.85,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              //autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.linear,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              onPageChanged: (v, d) {},
              scrollDirection: Axis.horizontal,
            ),
          ),
          Spacer(),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    spreadRadius: 12,
                    blurRadius: 8,
                    color: Colors.grey.shade300,
                    offset: Offset(0, 4),
                  )
                ]),
                //padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                          5,
                          (index) => Expanded(
                            child: Container(
                              height: activeIndex == index ? 2 : 0,
                              color: Colors.red,
                              width: width / 6,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _getButton(
                          title: "News",
                          icon: AppImages.newsMore,
                          onTap: () {
                            setState(() {
                              activeIndex = 0;
                            });
                          },
                          isSelected: activeIndex == 0,
                        ),
                        _getButton(
                          title: "My News",
                          icon: AppImages.news,
                          onTap: () {
                            setState(() {
                              activeIndex = 1;
                            });
                          },
                          isSelected: activeIndex == 1,
                        ),
                        _getButton(
                          title: "Add News",
                          icon: "",
                          onTap: () {
                            setState(() {
                              activeIndex = 2;
                            });
                          },
                          isSelected: activeIndex == 2,
                        ),
                        _getButton(
                          title: "Saved",
                          icon: AppImages.bookmark,
                          onTap: () {
                            setState(() {
                              activeIndex = 3;
                            });
                          },
                          isSelected: activeIndex == 3,
                        ),
                        _getButton(
                          title: "Settings",
                          icon: AppImages.settings,
                          onTap: () {
                            setState(() {
                              activeIndex = 4;
                            });
                          },
                          isSelected: activeIndex == 4,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                child: Center(
                  child: FloatingActionButton(
                    backgroundColor: AppColors.black,
                    shape: OvalBorder(),
                    onPressed: () {},
                    child: SvgPicture.asset(
                      AppImages.plus,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _getButton({
    required String title,
    required String icon,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return SizedBox(
      width: width / 6,
      child: Column(
        children: [
          if (icon.isNotEmpty)
            IconButton(
              onPressed: onTap,
              icon: SvgPicture.asset(
                icon,
                width: 20,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.c_E91B1B : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          Text(
            title,
            style: AppTextStyle.interMedium.copyWith(
              fontSize: 12,
              color: isSelected
                  ? AppColors.c_E91B1B
                  : icon.isNotEmpty
                      ? Colors.grey
                      : AppColors.black,
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}

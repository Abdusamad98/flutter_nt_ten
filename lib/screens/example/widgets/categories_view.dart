import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class CategoriesView extends SliverPersistentHeaderDelegate {
  final VoidCallback onTap;

  CategoriesView({required this.onTap});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 100,
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
              5,
              (index) => Expanded(
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: onTap,
                      child: const Icon(Icons.currency_exchange),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Transfer",
                      style: AppTextStyle.interSemiBold.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

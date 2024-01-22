import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class TransactionHistoryItem extends StatelessWidget {
  const TransactionHistoryItem({
    super.key,
    required this.price,
    required this.subtitle,
    required this.onTap,
  });

  final String price;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$20.99",
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 16,
                    color: AppColors.c_2A3256,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "10.00 AM - #TRX0101211113 TRX0101211113",
                  style: AppTextStyle.interMedium.copyWith(
                    fontSize: 12,
                    color: AppColors.c_2A3256,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.c_1A72DD,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onTap,
            child: Text(
              "PAID OFF",
              style: AppTextStyle.interMedium
                  .copyWith(fontSize: 12, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/global_widgets/global_appbar.dart';
import 'package:flutter_nt_ten/screens/history_transaction/widgets/title_item.dart';
import 'package:flutter_nt_ten/screens/history_transaction/widgets/transaction_item.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryTransactionScreen extends StatelessWidget {
  const HistoryTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateTransactionsModel> transactions = [
      DateTransactionsModel(
        dateTime: "Sunday, 02 August 2020",
        dateTransactions: [
          TransactionModel(
            title: "05.00 PM - #TRX0101211113",
            price: "\$20.99",
          ),
          TransactionModel(
            title: "04.00 PM - #TRX0101211113",
            price: "\$12.99",
          ),
          TransactionModel(
            title: "02.00 PM - #TRX0101211113",
            price: "\$10.99",
          ),
        ],
      ),
      DateTransactionsModel(
        dateTime: "Sunday, 03 August 2020",
        dateTransactions: [
          TransactionModel(
            title: "05.00 PM - #TRX0101211113",
            price: "\$20.99",
          ),
        ],
      )
    ];
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "History Transaction",
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            color: AppColors.c_D1D1D1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppImages.filter),
                ),
                Text(
                  'Filter set date & time',
                  style: AppTextStyle.interMedium
                      .copyWith(color: AppColors.c_2A3256),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppImages.arrowForwardIos),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            color: Colors.grey,
            child: Column(
              children: [
                ...List.generate(
                  transactions.length,
                  (index) => Column(
                    children: [
                      TitleItem(
                        title: transactions[index].dateTime,
                        priceText: "290 som",
                      ),
                      ...List.generate(
                        transactions[index].dateTransactions.length,
                        (ind) => TransactionHistoryItem(
                          price: transactions[index].dateTransactions[ind].price,
                          subtitle: transactions[index].dateTransactions[ind].title,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TransactionModel {
  final String price;
  final String title;

  TransactionModel({required this.title, required this.price});
}

class DateTransactionsModel {
  final List<TransactionModel> dateTransactions;
  final String dateTime;

  DateTransactionsModel({
    required this.dateTime,
    required this.dateTransactions,
  });
}

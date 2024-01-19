import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(2, 4),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.red,
                    focusColor: Colors.green,
                    hoverColor: Colors.yellow,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.access_time_filled_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.flag),
                ),
              ],
            ),
          ),

          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         height: 100,
          //         color: Colors.yellow,
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

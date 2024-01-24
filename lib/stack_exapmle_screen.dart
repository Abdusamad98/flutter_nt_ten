import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/basket_item.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StackExampleScreen extends StatelessWidget {
  const StackExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STACK"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: 400,
                color: Colors.red,
              ),
              Positioned(
                right: 0,
                left: 60,
                child: Container(
                  height: 120,
                  width: 120,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          BasketIcon(count: 12.toString()),
        ],
      ),
    );
  }
}

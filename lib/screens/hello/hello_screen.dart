import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/hello/widgets/location_item.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_FEFEFF,
      appBar: AppBar(
        title: const Text("Deafult"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            LocationItem(
              title: "Order Location",
              subTitle: "8502 Preston Rd",
              buttonText: null,
            ),
            LocationItem(
              title: "Deliver To",
              subTitle: "4517 Washington Ave. Manchester, Kentucky 39495",
              buttonText: "set location",
            ),
            LocationItem(
              title: "Deliver To",
              subTitle: "4517 Washington Ave. Manchester, Kentucky 39495 4517 Washington Ave. Manchester, Kentucky 39495",
              buttonText: "set location",
            ),
          ],
        ),
      ),
    );
  }
}

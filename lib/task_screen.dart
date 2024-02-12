import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/product_model.dart';
import 'package:flutter_nt_ten/models/repo.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<ProductCategory> categories = [
    ProductCategory.all,
    ProductCategory.jeans,
    ProductCategory.shoes,
    ProductCategory.jackets,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                ...List.generate(
                  categories.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                        child: Text(
                          categories[index].name,
                          style: AppTextStyle.interMedium
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  ...List.generate(
                    products.length,
                    (index) => Container(
                      child: Image.asset(products[index].image),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

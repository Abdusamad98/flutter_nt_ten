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

  List<ProductModel> temp = [];

  int categoryIndex = 0;

  @override
  void initState() {
    temp = products;
    super.initState();
  }

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
                          backgroundColor: categoryIndex == index
                              ? Colors.black
                              : Colors.blue,
                        ),
                        onPressed: () {
                          temp = [];
                          if (index == 0) {
                            categoryIndex = 0;
                            temp = products;
                          } else {
                            temp = products
                                .where((element) =>
                                    element.category == categories[index])
                                .toList();
                          }

                          print("PRODUCT LENGTH:${temp.length}");

                          categoryIndex = index;
                          setState(() {});
                        },
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
                    temp.length,
                    (index) => Container(
                      child: Image.asset(temp[index].image),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

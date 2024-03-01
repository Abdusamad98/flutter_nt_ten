import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nt_ten/data/local/local_database.dart';
import 'package:flutter_nt_ten/data/models/category/category_model.dart';
import 'package:flutter_nt_ten/screens/routes.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';

showCategorySelectDialog({
  required BuildContext context,
  required ValueChanged<int> categorySelection,
  required int category,
}) async {
  int selectedCategoryId = category;

  List<CategoryModel> categories = await LocalDatabase.getAllCategories();
  if (!context.mounted) return;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            color: Colors.white,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: height / 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Task Priority"),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: List.generate(categories.length + 1, (index) {
                      if (index == categories.length) {
                        return TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteNames.addCategory,
                                  arguments: () async {
                                categories =
                                    await LocalDatabase.getAllCategories();
                                setState(() {});
                              });
                            },
                            child: const Text("Add NEW"));
                      }
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategoryId = categories[index].id!;
                              });
                            },
                            child: Icon(
                              IconData(
                                int.parse(categories[index].iconPath),
                                fontFamily: "MaterialIcons",
                              ),
                              color: selectedCategoryId == categories[index].id
                                  ? Colors.green
                                  : Colors.black,
                            ),
                          ),
                          Text(categories[index].name),
                        ],
                      );
                    }),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("CANCEL"),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          categorySelection.call(selectedCategoryId);
                          Navigator.pop(context);
                        },
                        child: const Text("SAVE"),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      );
    },
  );
}

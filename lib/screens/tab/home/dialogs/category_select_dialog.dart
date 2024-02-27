import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';

showCategorySelectDialog({
  required BuildContext context,
  required ValueChanged<String> categorySelection,
  required String category,
}) {
  String selectedCategory = category;

  List<String> categories = [
    "work",
    "study",
    "sport",
    "design",
    "music",
    "home",
    "movie"
  ];

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
                SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: List.generate(categories.length, (index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = categories[index];
                              });
                            },
                            child: Icon(
                              Icons.category,
                              color: selectedCategory == categories[index]
                                  ? Colors.green
                                  : Colors.black,
                            ),
                          ),
                          Text(categories[index]),
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
                        child: Text("CANCEL"),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          categorySelection.call(selectedCategory);
                          Navigator.pop(context);
                        },
                        child: Text("SAVE"),
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

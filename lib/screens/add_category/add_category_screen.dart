import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nt_ten/data/local/local_database.dart';
import 'package:flutter_nt_ten/data/models/category/category_model.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key, this.onCategoryAdded});

  final VoidCallback? onCategoryAdded;

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  String categoryName = '';
  int selectedIconIndex = -1;
  int selectedColorIndex = -1;

  List<Color> colors = [
    Colors.white,
    Colors.black,
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
  ];

  List<IconData> icons = [
    Icons.add,
    Icons.account_circle,
    Icons.ac_unit,
    Icons.access_time_filled_outlined,
    Icons.arrow_back,
    Icons.abc,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Catgeory"),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              onChanged: (v) {
                categoryName = v;
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    icons.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        onPressed: () {
                          selectedIconIndex = index;
                          setState(() {});
                        },
                        icon: Icon(
                          icons[index],
                          color: selectedIconIndex == index
                              ? Colors.green
                              : Colors.white,
                          size: 42,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    colors.length,
                    (index) => IconButton(
                      onPressed: () {
                        selectedColorIndex = index;
                        setState(() {});
                      },
                      icon: Stack(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                color: colors[index], shape: BoxShape.circle),
                          ),
                          if (selectedColorIndex == index)
                            const Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () async {
                  if (selectedColorIndex > -1 &&
                      selectedIconIndex > -1 &&
                      categoryName.isNotEmpty) {
                    await LocalDatabase.insertCategory(
                      CategoryModel(
                        iconPath: icons[selectedIconIndex].codePoint.toString(),
                        name: categoryName,
                        color: colors[selectedColorIndex],
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Category saved!!"),
                      ),
                    );
                    await Future.delayed(const Duration(seconds: 4), () {
                      Navigator.pop(context);
                      if (widget.onCategoryAdded != null) {
                        widget.onCategoryAdded!.call();
                      }
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("ERROR"),
                      ),
                    );
                  }
                },
                child: const Text("ADD CATEGORY"))
          ],
        ),
      ),
    );
  }
}

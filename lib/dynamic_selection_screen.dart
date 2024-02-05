import 'package:flutter/material.dart';

class DynamicSelectionScreen extends StatefulWidget {
  const DynamicSelectionScreen({super.key});

  @override
  State<DynamicSelectionScreen> createState() => _DynamicSelectionScreenState();
}

class _DynamicSelectionScreenState extends State<DynamicSelectionScreen> {
  int activeIndex = -1;

  List<String> variants = [
    "Variant 1",
    "Variant 2",
    "Variant 3",
    "Variant 4",
    "Variant 5",
    "Variant 6",
    "Variant 7",
    "Variant 8",
    "Variant 9",
    "Variant 10",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple selection"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...List.generate(variants.length, (index) {
              return _getButton(
                activeIndex == index,
                () {
                  activeIndex = index;
                  setState(() {});
                },
                variants[index],
              );
            })
          ],
        ),
      ),
    );
  }

  _getButton(
    bool isSelected,
    VoidCallback onTap,
    String text,
  ) =>
      TextButton(
        style: TextButton.styleFrom(
            backgroundColor: isSelected ? Colors.orange : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: isSelected ? Colors.red : Colors.grey,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            )),
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      );
}

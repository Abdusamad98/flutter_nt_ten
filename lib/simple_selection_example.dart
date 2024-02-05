import 'package:flutter/material.dart';

class SimpleSelectionExample extends StatefulWidget {
  const SimpleSelectionExample({super.key});

  @override
  State<SimpleSelectionExample> createState() => _SimpleSelectionExampleState();
}

class _SimpleSelectionExampleState extends State<SimpleSelectionExample> {
  int activeIndex = 0;

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
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor:
                      activeIndex == 1 ? Colors.orange : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side:  BorderSide(
                      color: activeIndex == 1 ? Colors.red : Colors.grey,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  )),
              onPressed: () {
                activeIndex = 1;
                setState(() {});
              },
              child: const Center(
                child: Text(
                  "A. varaiant",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = 2;
                });
              },
              child: Container(
                width: double.infinity,
                height: 58,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: activeIndex == 2 ? Colors.red : Colors.grey,
                    width: 2,
                  ),
                  color: activeIndex == 2 ? Colors.orange : Colors.white,
                ),
                child: const Center(
                  child: Text(
                    "B. varaiant",
                    style: TextStyle(fontSize: 34, color: Colors.black),
                  ),
                ),
              ),
            ),
            Ink(
              width: double.infinity,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: activeIndex == 3 ? Colors.red : Colors.grey,
                  width: 2,
                ),
                color: activeIndex == 3 ? Colors.orange : Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    activeIndex = 3;
                  });
                },
                child: const Center(
                  child: Text(
                    "C. varaiant",
                    style: TextStyle(fontSize: 34),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

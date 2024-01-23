import 'package:flutter/material.dart';

class ScrollExampleScreen extends StatelessWidget {
  const ScrollExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scroll Example Screen"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        padding: const EdgeInsets.all(24),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(24),
              width: width,
              height: height / 3,
              color: Colors.green,
            ),
            Container(
              width: width,
              height: height / 3,
              color: Colors.yellow,
            ),
            Container(
              width: width,
              height: height / 3,
              color: Colors.red,
            ),
            Container(
              width: width,
              height: height / 3,
              color: Colors.deepOrangeAccent,
            )
          ],
        ),
      ),
    );
  }
}

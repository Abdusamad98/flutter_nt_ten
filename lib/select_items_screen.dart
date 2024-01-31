import 'package:flutter/material.dart';

class SelectLogicScreen extends StatefulWidget {
  const SelectLogicScreen({super.key});

  @override
  State<SelectLogicScreen> createState() => _SelectLogicScreenState();
}

class _SelectLogicScreenState extends State<SelectLogicScreen> {
  List<ImageModel> images = [
    ImageModel(
      text: "Image Text",
      id: 1,
    ),
    ImageModel(
      text: "Any Text",
      id: 2,
    ),
    ImageModel(
      text: "Flutter",
      id: 3,
    ),
    ImageModel(
      text: "Nimadur",
      id: 4,
    ),
  ];
  int activeIndex = 1;
  final ScrollController scrollController = ScrollController();
  late double screenWidth;

  @override
  void initState() {
    scrollController.addListener(() {
      // print(scrollController.position.pixels);
      double currentPixel = scrollController.position.pixels;
      print(currentPixel / screenWidth);
      setState(() {
        activeIndex = (currentPixel / screenWidth + 1.1).toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200,
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(images.length, (index) {
                      return Container(
                        width: screenWidth - 32,
                        height: 200,
                        margin: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16)),
                      );
                    })
                  ],
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      images.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: activeIndex == images[index].id
                              ? Colors.blue
                              : Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ImageModel {
  ImageModel({
    required this.text,
    required this.id,
  });

  final int id;
  final String text;
}

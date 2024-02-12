import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class GridViewBuilderExample extends StatefulWidget {
  const GridViewBuilderExample({super.key});

  @override
  State<GridViewBuilderExample> createState() => _GridViewBuilderExampleState();
}

class _GridViewBuilderExampleState extends State<GridViewBuilderExample> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      print(scrollController.position.pixels);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text("Gridview"),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  itemCount: 100,
                  padding: EdgeInsets.all(24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 24,
                  ),
                  itemBuilder: (context, index) {
                    return getWidget();
                  }),
            ),
            TextButton(onPressed: () {}, child: Text("BUTTON")),
          ],
        ));
  }

  Widget getWidget() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
            )
          ],
        ),
        SizedBox(height: 11),
        Text("Roller Rabbit"),
        Text(
          "Vado Odelle Dress hdebdnffbnn fbjgbf  jfbgbfjg fjf dff",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Text("\$200"),
      ],
    );
  }
}

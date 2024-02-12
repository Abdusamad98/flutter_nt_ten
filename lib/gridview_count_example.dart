import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class GridViewCount extends StatefulWidget {
  const GridViewCount({super.key});

  @override
  State<GridViewCount> createState() => _GridViewCountState();
}

class _GridViewCountState extends State<GridViewCount> {

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
      body: GridView.count(
        physics: AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(25),
        mainAxisSpacing: 24,
        //vertically
        crossAxisSpacing: 15,
        //horizontally
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        //Axis.vertica=> childAspectRatio = width/height.
        //Axis.horizontal=> childAspectRatio = height/width.

        children: [
          ...List.generate(
            1000,
            (index) => getWidget(),
          )
        ],
      ),
    );
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

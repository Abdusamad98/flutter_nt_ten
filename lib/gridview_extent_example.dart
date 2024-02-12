import 'package:flutter/material.dart';

class GridviewExtentExample extends StatefulWidget {
  const GridviewExtentExample({super.key});

  @override
  State<GridviewExtentExample> createState() => _GridviewExtentExampleState();
}

class _GridviewExtentExampleState extends State<GridviewExtentExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.extent(
        scrollDirection: Axis.horizontal,
        maxCrossAxisExtent: 70.0,
        // maximum item width
        mainAxisSpacing: 8.0,
        // spacing between rows
        crossAxisSpacing: 8.0,
        // spacing between columns
        padding: EdgeInsets.all(8.0),
        // padding around the grid
        children: [
          ...List.generate(
              100,
              (index) => Container(
                    color: Colors.blue, // color of grid items
                    child: Center(
                      child: Text(
                        "With GridView.builder, you can efficiently build grids with a large number of items, as it only creates and renders the items that are currently visible on the screen, improving performance and reducing memory usage. It also allows you to customize the grid layout and item creation process, giving you full control over the appearance and functionality of the grid.",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}

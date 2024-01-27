import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      print("SCROLLED TO ${controller.position.pixels}");
      print("maxScrollExtent ${controller.position.maxScrollExtent}");
      print("minScrollExtent ${controller.position.minScrollExtent}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Deafult"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("ListViewExample $index"),
          );
        },
        //  itemCount: 100,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Icon(
            Icons.shopping_basket,
            size: 100,
            color: Colors.red,
          ),
          TextButton(
            onPressed: () {

              Navigator.pop(context);
            },
            child: Text("My Basket"),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Switch(value: true, onChanged: (v) {}),
                Text("Switch theme")
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text("Uzbek")
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text("Russian")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/home/widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: MyDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
            //Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ),
    );
  }
}

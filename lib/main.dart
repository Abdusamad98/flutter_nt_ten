import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/list_view_example.dart';
import 'package:flutter_nt_ten/task_screen.dart';

void main() {
  runApp(MyApp());






}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: TaskScreen(),
    );
  }
}

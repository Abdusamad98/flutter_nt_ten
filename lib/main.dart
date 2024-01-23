import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/login/login_screen.dart';
import 'package:flutter_nt_ten/screens/scroll/scroll_example_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: ScrollExampleScreen(),
    ),
  );
}

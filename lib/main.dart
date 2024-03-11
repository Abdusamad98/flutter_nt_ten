import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/example/example_screen.dart';
import 'package:flutter_nt_ten/screens/hello/hello_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: ExampleScreen(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/tab_box1.dart';
import 'package:flutter_nt_ten/screens/tab_box2.dart';
import 'package:flutter_nt_ten/screens/tab_box3.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: TabBox3(),
    ),
  );
}

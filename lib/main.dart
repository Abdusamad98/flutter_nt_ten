import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/examples/aligned.dart';
import 'package:flutter_nt_ten/examples/masonry.dart';
import 'package:flutter_nt_ten/examples/staggered.dart';
import 'package:flutter_nt_ten/gridview_builder_example.dart';
import 'package:flutter_nt_ten/gridview_count_example.dart';
import 'package:flutter_nt_ten/gridview_extent_example.dart';
import 'package:flutter_nt_ten/task_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: TaskScreen(),
    ),
  );
}

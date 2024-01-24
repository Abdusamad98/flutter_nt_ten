import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/background_image_screen.dart';
import 'package:flutter_nt_ten/rich_text_screen.dart';
import 'package:flutter_nt_ten/stack_exapmle_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: BackgroundImageScreen(),
    ),
  );
}

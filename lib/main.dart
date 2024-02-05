import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/dynamic_selection_screen.dart';
import 'package:flutter_nt_ten/simple_selection_example.dart';
import 'package:flutter_nt_ten/switch_button_example.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: SwitchButtonExample(),
    ),
  );
}

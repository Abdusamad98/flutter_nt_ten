import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/simple_selection_example.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: SimpleSelectionExample(),
    ),
  );
}

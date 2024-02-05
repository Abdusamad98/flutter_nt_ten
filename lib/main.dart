import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/text_form_example.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: TextFormExample(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/all_news_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: AllNewsScreen(),
    ),
  );
}

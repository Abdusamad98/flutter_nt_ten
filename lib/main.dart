import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/discount_screen.dart';
import 'package:flutter_nt_ten/profile_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: DiscountScreen(),
    ),
  );
}

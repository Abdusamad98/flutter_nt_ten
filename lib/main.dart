import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/contact/contact_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: ContactScreen(),
    ),
  );
}

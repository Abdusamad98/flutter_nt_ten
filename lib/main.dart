import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/home_screen.dart';
import 'package:flutter_nt_ten/screens/user_data/user_data_screen.dart';
import 'package:flutter_nt_ten/screens/users/users_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: HomeScreen(),
    ),
  );
}

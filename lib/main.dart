import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/fetch_data_screen.dart';
import 'package:flutter_nt_ten/fetch_userdata_screen.dart';
import 'package:flutter_nt_ten/usa_fetch_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: USAFetchScreen(),
    ),
  );
}

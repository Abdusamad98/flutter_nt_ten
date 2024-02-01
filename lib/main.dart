import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/splash/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: SplashScreen(),
    ),
  );
}

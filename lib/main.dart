import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/counter_screen.dart';

void main() {
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: CounterScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/stateful_lifecycle_example.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: StatefulLifecycleExample(),
    ),
  );
}

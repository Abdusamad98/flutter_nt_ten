import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/hello_screen.dart';
import 'package:flutter_nt_ten/screens/simple_weather/widgets/simple_weather_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: SimpleWeatherScreen(),
    ),
  );
}

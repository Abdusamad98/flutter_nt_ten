import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/counter/view/counter_screen.dart';
import 'package:flutter_nt_ten/screens/currency/view/currency_screen.dart';
import 'package:flutter_nt_ten/screens/shimmer_example/shimmer_example_screen.dart';
import 'package:flutter_nt_ten/utils/translations/messages.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      translations: Messages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const CurrencyScreen(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/network/api_provider.dart';
import 'package:flutter_nt_ten/data/repository/currency_repository.dart';
import 'package:flutter_nt_ten/screens/currencies/currencies_screen.dart';
import 'package:flutter_nt_ten/view_models/counter_view_model.dart';
import 'package:flutter_nt_ten/view_models/currencies_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  ApiProvider apiProvider = ApiProvider();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterViewModel()),
        ChangeNotifierProvider(
          create: (_) => CurrenciesViewModel(
            currencyRepository: CurrencyRepository(apiProvider: apiProvider),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const CurrenciesScreen(),
    );
  }
}

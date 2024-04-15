import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/cubits/calculator/calculator_cubit.dart';
import 'package:flutter_nt_ten/cubits/cards/card_cubit.dart';
import 'package:flutter_nt_ten/cubits/currency/currency_cubit.dart';
import 'package:flutter_nt_ten/data/repositories/currency_repository.dart';
import 'package:flutter_nt_ten/screens/calculator/calculator_screen.dart';
import 'package:flutter_nt_ten/screens/card/card_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => CurrencyRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CardCubit()),
          BlocProvider(
            create: (_) => CurrencyCubit(
                currencyRepository: context.read<CurrencyRepository>())
              ..fetchCurrencies(),
          ),
          BlocProvider(create: (_) => CalculatorCubit()),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const CardScreen(),
    );
  }
}

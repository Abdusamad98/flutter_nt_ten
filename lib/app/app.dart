import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/calculator/calculator_cubit.dart';
import 'package:flutter_nt_ten/blocs/cards/card_bloc.dart';
import 'package:flutter_nt_ten/blocs/currency/currency_bloc.dart';
import 'package:flutter_nt_ten/blocs/currency/currency_event.dart';
import 'package:flutter_nt_ten/data/repositories/currency_repository.dart';
import 'package:flutter_nt_ten/screens/card/card_screen.dart';
import 'package:flutter_nt_ten/screens/currencies/currencies_screen.dart';

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
          BlocProvider(create: (_) => CardBloc()),
          BlocProvider(
            create: (_) => CurrencyBloc()..add(GetCurrenciesEvent()),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/cubits/cards/card_cubit.dart';
import 'package:flutter_nt_ten/cubits/currency/currency_cubit.dart';
import 'package:flutter_nt_ten/screens/card/card_screen.dart';
import 'package:flutter_nt_ten/screens/currencies/currencies_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CardCubit()),
        BlocProvider(create: (_) => CurrenciesCubit()..fetchCurrencies()),
      ],
      child: MyApp(),
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
      home: CurrenciesScreen(),
    );
  }
}

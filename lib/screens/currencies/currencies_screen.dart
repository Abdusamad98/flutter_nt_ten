import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/view_models/currencies_view_model.dart';
import 'package:provider/provider.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<CurrenciesViewModel>().fetchCurrencies();
      //   },
      //   child: const Icon(Icons.get_app),
      // ),
      body: context.watch<CurrenciesViewModel>().isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () {
                return Future<void>.delayed(
                  const Duration(seconds: 2),
                  () {
                    context.read<CurrenciesViewModel>().fetchCurrencies();
                  },
                );
              },
              child: ListView(
                children: [
                  ...List.generate(
                    context.watch<CurrenciesViewModel>().currencies.length,
                    (index) {
                      CurrencyModel currency = context
                          .watch<CurrenciesViewModel>()
                          .currencies[index];
                      return ListTile(
                        title: Text(currency.ccyNmUZ),
                        subtitle: Text(currency.rate),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

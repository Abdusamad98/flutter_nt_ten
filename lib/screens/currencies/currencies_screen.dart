import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/cubits/currency/currency_cubit.dart';
import 'package:flutter_nt_ten/cubits/currency/currency_state.dart';
import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/data/models/forms_status.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
      ),
      body: BlocBuilder<CurrenciesCubit, CurrencyState>(
        builder: (context, state) {
          if (state.formsStatus == FormsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.formsStatus == FormsStatus.error) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.statusText),
              ],
            );
          }
          return ListView(
            children: List.generate(state.currencies.length, (index) {
              CurrencyModel currencyModel = state.currencies[index];
              return ListTile(
                title: Text("${currencyModel.nominal} ${currencyModel.cyNmUZ}"),
                subtitle: Text("Qiymati: ${currencyModel.rate}"),
              );
            }),
          );
        },
      ),
    );
  }
}

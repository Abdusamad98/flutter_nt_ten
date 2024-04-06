import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/currency/currency_bloc.dart';
import 'package:flutter_nt_ten/blocs/currency/currency_event.dart';
import 'package:flutter_nt_ten/blocs/currency/currency_state.dart';
import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Currencies")),
      body: Column(
        children: [
          BlocBuilder<CurrencyBloc, CurrencyState>(
            buildWhen: (previous, current) {
              return true;
            },
            builder: (context, state) {
              if (state is CurrencyLoadingState) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
              if (state is CurrencyErrorState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.errorText),
                  ],
                );
              } else if (state is CurrencySuccessState) {
                return Expanded(
                  child: ListView(
                    children: List.generate(state.currencies.length, (index) {
                      CurrencyModel currencyModel = state.currencies[index];
                      return ListTile(
                        onTap: () {
                          context.read<CurrencyBloc>().add(DeleteCurrencyEvent(
                              currencyId: currencyModel.id));
                        },
                        title: Text(
                            "${currencyModel.nominal} ${currencyModel.cyNmUZ}"),
                        subtitle: Text("Qiymati: ${currencyModel.rate}"),
                      );
                    }),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          // BlocListener<CurrencyBloc, CurrencyState>(
          //   listener: (context, state) {
          //     if (state is CurrencySuccessState) {
          //       if (state.currencies.isNotEmpty) {
          //         //  Navigator.
          //       }
          //     }
          //
          //     if (state is CurrencyDeletedState) {
          //       Future.microtask(
          //         () => ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             duration: Duration(seconds: 1),
          //             content: Text("DELETED"),
          //           ),
          //         ),
          //       );
          //     }
          //   },
          //   child: Container(
          //     height: 300,
          //     color: Colors.red,
          //     width: double.infinity,
          //   ),
          // )

          TextButton(
            onPressed: () {
              context.read<CurrencyBloc>().add(GetCurrenciesEvent());
            },
            child: Text(
              "GET ALL CURRENCIES",
              style: AppTextStyle.interSemiBold.copyWith(fontSize: 24),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

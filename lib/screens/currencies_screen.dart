import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/currencies_bloc.dart';
import 'package:flutter_nt_ten/blocs/currencies_state.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
      ),
      body: BlocConsumer<CurrenciesBloc, CurrenciesState>(
          builder: (context, state) {
            if (state is CurrenciesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CurrenciesErrorState) {
              return Center(
                child: Text(state.errorText),
              );
            }

            if (state is CurrenciesSuccessState) {
              return ListView(
                children: List.generate(state.currencies.length, (index) {
                  return ListTile(
                    title: Text(state.currencies[index].cyNmUZ),
                    subtitle: Text(state.currencies[index].rate),
                  );
                }),
              );
            }
            return const Center(child: Text("INITIAL"));
          },
          listener: (context, state) {}),
    );
  }
}

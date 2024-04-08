import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/cards_bloc.dart';
import 'package:flutter_nt_ten/data/models/card_model.dart';
import 'package:intl/intl.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Currencies")),
      body: Column(
        children: [
          BlocBuilder<CardsBloc, CardsState>(
            buildWhen: (previous, current) {
              return true;
            },
            builder: (context, state) {
              if (state is CardsLoadingState) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
              if (state is CardsErrorState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.errorText),
                  ],
                );
              } else if (state is CardsSuccessState) {
                return Expanded(
                  child: ListView(
                    children: List.generate(state.cards.length, (index) {
                      CardModel cardModel = state.cards[index];
                      return ListTile(
                        onTap: () {},
                        title: Text(
                            "${cardModel.ownerName} ${cardModel.expireDate}"),
                        subtitle: Text("Qiymati: ${NumberFormat.currency(locale: "uz").format(cardModel.amount)}"),
                      );
                    }),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/cards_bloc.dart';
import 'package:flutter_nt_ten/data/models/card_model.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:intl/intl.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
                      return Stack(
                        children: [
                          Container(
                            height: height / 4,
                            margin: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: cardModel.color.toColor(),
                            ),
                          ),
                          Positioned(
                              top: 12,
                              left: 20,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 24,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cardModel.ownerName,
                                      style: AppTextStyle.interMedium.copyWith(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      cardModel.cardNumber,
                                      style: AppTextStyle.interMedium.copyWith(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            cardModel.expireDate,
                                            style: AppTextStyle.interMedium
                                                .copyWith(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                          ),
                                          Text(
                                            cardModel.providerName,
                                            style: AppTextStyle.interMedium
                                                .copyWith(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            cardModel.bankName,
                                            style: AppTextStyle.interMedium
                                                .copyWith(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                          ),
                                          Text(
                                            NumberFormat.currency(locale: "uz")
                                                .format(cardModel.amount),
                                            style: AppTextStyle.interMedium
                                                .copyWith(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/cards/card_bloc.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class CardInfoScreen extends StatelessWidget {
  const CardInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Info screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Kart egasi:",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                  Text(
                    context.watch<CardBloc>().state.cardHolder,
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Karta raqami:",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                  Text(
                    context.watch<CardBloc>().state.cardNumber,
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Kart yaroqlik muddati:",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                  Text(
                    context.watch<CardBloc>().state.expireDate,
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Karta nomi:",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                  Text(
                    context.watch<CardBloc>().state.name,
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

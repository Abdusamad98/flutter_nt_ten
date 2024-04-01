import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/cubits/cards/card_cubit.dart';
import 'package:flutter_nt_ten/data/models/card_model.dart';
import 'package:flutter_nt_ten/screens/card/card_info_screen.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card insert screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
            child: Column(
          children: [
            TextField(
              onChanged: context.read<CardCubit>().insertName,
              decoration: InputDecoration(
                labelText: "Card Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (v) {
                context.read<CardCubit>().insertCardNumber(v);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Card Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: context.read<CardCubit>().insertCardHolder,
              decoration: InputDecoration(
                labelText: "Card Holder Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.datetime,
              onChanged: context.read<CardCubit>().insertExpireDate,
              decoration: InputDecoration(
                labelText: "Card Expire date",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CardInfoScreen();
                    },
                  ),
                );
              },
              child: const Text("SHOW DATA"),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Kart egasi:",
                  style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                ),
                Text(
                  context.watch<CardCubit>().state.cardHolder,
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
                  context.watch<CardCubit>().state.cardNumber,
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
                  context.watch<CardCubit>().state.expireDate,
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
                  context.watch<CardCubit>().state.name,
                  style: AppTextStyle.interSemiBold.copyWith(fontSize: 18),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}

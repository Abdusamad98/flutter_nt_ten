import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/cards/card_bloc.dart';
import 'package:flutter_nt_ten/blocs/cards/card_event.dart';
import 'package:flutter_nt_ten/blocs/cards/card_state.dart';
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
              onChanged: (v) =>
                  context.read<CardBloc>().add(CardInsertNameEvent(v)),
              decoration: InputDecoration(
                labelText: "Card Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (v) =>
                  context.read<CardBloc>().add(CardInsertNumberEvent(v)),
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
              onChanged: (v) =>
                  context.read<CardBloc>().add(CardInsertHolderNameEvent(v)),
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
              onChanged: (v) =>
                  context.read<CardBloc>().add(CardInsertExpireDateEvent(v)),
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
            ),
            BlocListener<CardBloc, CardState>(
              listenWhen: (previous, current) {
                //debugPrint("PREVIOUS:${previous.name}");
                //debugPrint("CURRENT:${current.name}");
                return previous.name != current.name;
              },
              listener: (context, state) {
                debugPrint("STATE:${state.toString()}");
                if (state.name == "Falonchi") {}
              },
              child: const SizedBox(),
            )
          ],
        )),
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/data/models/card_model.dart';

class CardCubit extends Cubit<CardModel> {
  CardCubit()
      : super(
          const CardModel(
            name: "",
            cardNumber: "",
            cardHolder: "",
            expireDate: "",
          ),
        );

  insertName(String value) {
    emit(state.copyWith(name: value));
  }

  insertCardHolder(String value) {
    emit(state.copyWith(cardHolder: value));
  }

  insertCardNumber(String value) {
    emit(state.copyWith(cardNumber: value));
  }

  insertExpireDate(String value) {
    emit(state.copyWith(expireDate: value));
  }

  setEmptyCard() {
    emit(
      const CardModel(
        name: "",
        cardNumber: "",
        cardHolder: "",
        expireDate: "",
      ),
    );
  }
}

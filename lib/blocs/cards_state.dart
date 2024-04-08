part of 'cards_bloc.dart';

sealed class CardsState {}

final class CardsInitial extends CardsState {}

class CardsLoadingState extends CardsState {}

class CardsErrorState extends CardsState {
  final String errorText;

  CardsErrorState(this.errorText);
}

class CardsSuccessState extends CardsState {
  final List<CardModel> cards ;
  CardsSuccessState({required this.cards});
}

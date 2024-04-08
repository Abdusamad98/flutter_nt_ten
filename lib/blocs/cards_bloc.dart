import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/data/cards_repo.dart';
import 'package:flutter_nt_ten/data/models/card_model.dart';

part 'cards_event.dart';

part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc({required this.cardsRepository}) : super(CardsInitial()) {
    on<GetCardsEvent>(_getCards);
  }

  final CardsRepository cardsRepository;

  Future<void> _getCards(
    GetCardsEvent event,
    Emitter<CardsState> emit,
  ) async {
    emit(CardsLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    var response = await cardsRepository.getCards();
    if (response.errorText.isNotEmpty) {
      emit(CardsErrorState(response.errorText));
    } else {
      emit(CardsSuccessState(cards: response.data as List<CardModel>));
    }
  }
}

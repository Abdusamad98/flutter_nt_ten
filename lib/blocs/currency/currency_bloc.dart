import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/currency/currency_event.dart';
import 'package:flutter_nt_ten/blocs/currency/currency_state.dart';
import 'package:flutter_nt_ten/data/api_provider.dart';
import 'package:flutter_nt_ten/data/models/currency_model.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitialState()) {
    on<GetCurrenciesEvent>(_getCurrencies);
    on<DeleteCurrencyEvent>(_deleteCurrency);
  }

  Future<void> _deleteCurrency(
    DeleteCurrencyEvent event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(CurrencyLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(CurrencyDeletedState());
   // await Future.delayed(const Duration(seconds: 1));
    add(GetCurrenciesEvent());
  }

  Future<void> _getCurrencies(
    GetCurrenciesEvent event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(CurrencyLoadingState());
    var response = await ApiProvider.getCurrencies();
    if (response.errorText.isNotEmpty) {
      emit(CurrencyErrorState(errorText: response.errorText));
    } else {
      emit(CurrencySuccessState(
          currencies: response.data as List<CurrencyModel>));
    }
  }
}

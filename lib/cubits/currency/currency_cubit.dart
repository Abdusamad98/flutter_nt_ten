import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/cubits/currency/currency_state.dart';
import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';
import 'package:flutter_nt_ten/data/repositories/currency_repository.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit({required this.currencyRepository})
      : super(CurrencyInitialState());

  final CurrencyRepository currencyRepository;

  Future<void> fetchCurrencies() async {
    emit(CurrencyLoadingState());
    NetworkResponse response = await currencyRepository.getCurrencies();
    if (response.errorText.isEmpty) {
      emit(CurrencySuccessState(
          currencies: response.data as List<CurrencyModel>));
    } else {
      emit(CurrencyErrorState(errorText: response.errorText));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/cubits/currency/currency_state.dart';
import 'package:flutter_nt_ten/data/api_provider.dart';
import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/data/models/forms_status.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';

class CurrenciesCubit extends Cubit<CurrencyState> {
  CurrenciesCubit()
      : super(
          CurrencyState(
            formsStatus: FormsStatus.pure,
            statusText: "",
            currencies: [],
          ),
        ) {
    //fetchCurrencies();
  }

  fetchCurrencies() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse response = await ApiProvider.getCurrencies();
    if (response.errorText.isEmpty) {
      emit(
        state.copyWith(
          currencies: response.data as List<CurrencyModel>,
          formsStatus: FormsStatus.success,
        ),
      );
    } else {
      emit(state.copyWith(
        statusText: response.errorText,
        formsStatus: FormsStatus.error,
      ));
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/data/repository/currency_repository.dart';

class CurrenciesViewModel extends ChangeNotifier {
  CurrenciesViewModel({
    required this.currencyRepository,
  });

  final CurrencyRepository currencyRepository;

  bool isLoading = false;
  List<CurrencyModel> currencies = [];

  fetchCurrencies() async {
    isLoading = true;
    notifyListeners();
    var cur = await currencyRepository.getCurrencies();
    isLoading = false;
    notifyListeners();
    if (cur.isEmpty) {
    } else {
      currencies = cur;
      notifyListeners();
    }
  }
}

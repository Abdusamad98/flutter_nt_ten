import 'package:flutter_nt_ten/data/api_provider.dart';
import 'package:flutter_nt_ten/data/models/currency_model.dart';

class CurrenciesRepo {
  CurrenciesRepo({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<CurrencyModel>> getCurrencies() => apiProvider.getCurrencies();
}

import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/data/network/api_provider.dart';

class CurrencyRepository {
  final ApiProvider apiProvider;

  CurrencyRepository({required this.apiProvider});

  Future<List<CurrencyModel>> getCurrencies() => apiProvider.getCurrencies();
}

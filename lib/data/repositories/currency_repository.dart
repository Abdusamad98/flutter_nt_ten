import 'package:flutter_nt_ten/data/api_provider.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';

class CurrencyRepository {
  Future<NetworkResponse> getCurrencies() async {
    return ApiProvider.getCurrencies();
  }
}

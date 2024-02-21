import 'package:flutter_nt_ten/data/models/network_response.dart';
import 'package:flutter_nt_ten/data/network/api_provider.dart';

class CountryRepository {
  Future<NetworkResponse> getCountries() async =>
      await ApiProvider.fetchCountries();
}

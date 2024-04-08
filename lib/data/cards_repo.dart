import 'package:flutter_nt_ten/data/api_provider.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';

class CardsRepository {
  CardsRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<NetworkResponse> getCards() => apiProvider.getCards();
}

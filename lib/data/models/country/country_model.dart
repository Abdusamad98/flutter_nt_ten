import 'package:flutter_nt_ten/data/models/country/continent_model.dart';

class CountryModel {
  final String code;
  final String name;
  final String phone;
  final ContinentModel continentModel;
  final String capital;
  final String currency;
  final String emoji;

  CountryModel({
    required this.name,
    required this.code,
    required this.continentModel,
    required this.phone,
    required this.currency,
    required this.capital,
    required this.emoji,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json["name"] as String? ?? "",
      code: json["code"] as String? ?? "",
      phone: json["phone"] as String? ?? "",
      currency: json["currency"] as String? ?? "",
      capital: json["capital"] as String? ?? "",
      emoji: json["emoji"] as String? ?? "",
      continentModel:
          ContinentModel.fromJson(json["continent"] as Map<String, dynamic>),
    );
  }
}

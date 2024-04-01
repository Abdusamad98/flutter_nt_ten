class CurrencyModel {
  final int id;
  final String cyNmUZ;
  final String rate;
  final String nominal;

  CurrencyModel({
    required this.nominal,
    required this.id,
    required this.rate,
    required this.cyNmUZ,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json["id"] as int? ?? 0,
      cyNmUZ: json["CcyNm_UZ"] as String? ?? "",
      rate: json["Rate"] as String? ?? "",
      nominal: json["Nominal"] as String? ?? "",
    );
  }
}

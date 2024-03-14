class CurrencyModel {
  final int id;
  final String code;
  final String ccy;
  final String ccyNmRU;
  final String ccyNmUZ;
  final String ccyNmUZC;
  final String ccyNmEN;
  final String nominal;
  final String rate;
  final String diff;
  final String date;

  CurrencyModel({
    required this.id,
    required this.code,
    required this.ccy,
    required this.ccyNmRU,
    required this.ccyNmUZ,
    required this.ccyNmUZC,
    required this.ccyNmEN,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json['id'] as int? ?? 0,
      code: json['Code'] as String? ?? "",
      ccy: json['Ccy'] as String? ?? "",
      ccyNmRU: json['CcyNm_RU'] as String? ?? "",
      ccyNmUZ: json['CcyNm_UZ'] as String? ?? "",
      ccyNmUZC: json['CcyNm_UZC'] as String? ?? "",
      ccyNmEN: json['CcyNm_EN'] as String? ?? "",
      nominal: json['Nominal'] as String? ?? "",
      rate: json['Rate'] as String? ?? "",
      diff: json['Diff'] as String? ?? "",
      date: json['Date'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Code': code,
      'Ccy': ccy,
      'CcyNm_RU': ccyNmRU,
      'CcyNm_UZ': ccyNmUZ,
      'CcyNm_UZC': ccyNmUZC,
      'CcyNm_EN': ccyNmEN,
      'Nominal': nominal,
      'Rate': rate,
      'Diff': diff,
      'Date': date,
    };
  }
}

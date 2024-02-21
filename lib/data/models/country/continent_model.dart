class ContinentModel {
  final String code;
  final String name;

  ContinentModel({
    required this.name,
    required this.code,
  });

  factory ContinentModel.fromJson(Map<String, dynamic> json) {
    return ContinentModel(
      name: json["name"] as String? ?? "",
      code: json["code"] as String? ?? "",
    );
  }
}

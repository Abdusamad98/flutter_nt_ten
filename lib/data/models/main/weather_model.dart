class WeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherModel({
    required this.id,
    required this.icon,
    required this.description,
    required this.main,
  });

  factory WeatherModel.fromJson(Map<String, Object?> json) {
    return WeatherModel(
      id: json["id"] as int? ?? 0,
      main: json["main"] as String? ?? "",
      description: json["description"] as String? ?? "",
      icon: json["icon"] as String? ?? "",
    );
  }
}

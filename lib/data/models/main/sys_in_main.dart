class SysInMain {
  final int type;
  final int id;
  final int sunrise;
  final int sunset;
  final String country;

  SysInMain({
    required this.id,
    required this.type,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysInMain.fromJson(Map<String, Object?> json) {
    return SysInMain(
      id: json["id"] as int? ?? 0,
      type: json["type"] as int? ?? 0,
      sunrise: json["sunrise"] as int? ?? 0,
      country: json["country"] as String? ?? '',
      sunset: json["sunset"] as int? ?? 0,
    );
  }
}

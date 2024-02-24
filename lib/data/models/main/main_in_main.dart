class MainInMain {
  final double temp;

  final double feelsLike;

  final double tempMin;

  final double tempMax;

  final int pressure;

  final int humidity;

  final int seaLevel;

  final int grndLevel;

  MainInMain({
    required this.feelsLike,
    required this.grndLevel,
    required this.humidity,
    required this.pressure,
    required this.seaLevel,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
  });

  factory MainInMain.fromJson(Map<String, Object?> json) {
    return MainInMain(
      temp: json["temp"] as double? ?? 0.0,
      feelsLike: json["feels_like"] as double? ?? 0.0,
      tempMin: json["temp_min"] as double? ?? 0.0,
      tempMax: json["temp_max"] as double? ?? 0.0,
      pressure: json["pressure"] as int? ?? 0,
      humidity: json["humidity"] as int? ?? 0,
      seaLevel: json["sea_level"] as int? ?? 0,
      grndLevel: json["grnd_level"] as int? ?? 0,
    );
  }
}

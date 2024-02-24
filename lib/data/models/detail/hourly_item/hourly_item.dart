import 'package:flutter_nt_ten/data/models/main/weather_model.dart';

class HourlyItem {
  final int dt;
  final double temp;
  final double feelsLike;

  final int pressure;

  final int humidity;

  final double dewPoint;

  final double uvi;

  final int clouds;

  final int visibility;

  final double windSpeed;

  final int windDeg;

  final double windGust;

  final List<WeatherModel> weather;

  final double pop;

  HourlyItem({
    required this.weather,
    required this.visibility,
    required this.dt,
    required this.clouds,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.feelsLike,
    required this.pop,
    required this.dewPoint,
    required this.uvi,
    required this.windDeg,
    required this.windGust,
    required this.windSpeed,
  });

  factory HourlyItem.fromJson(Map<String, dynamic> json) => HourlyItem(
        weather: (json['weather'] as List<dynamic>?)
                ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        visibility: json['visibility'] as int? ?? 0,
        dt: json['dt'] as int? ?? 0,
        clouds: json['clouds'] as int? ?? 0,
        temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
        pressure: json['pressure'] as int? ?? 0,
        humidity: json['humidity'] as int? ?? 0,
        feelsLike: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
        pop: (json['pop'] as num?)?.toDouble() ?? 0.0,
        dewPoint: (json['dew_point'] as num?)?.toDouble() ?? 0.0,
        uvi: (json['uvi'] as num?)?.toDouble() ?? 0.0,
        windDeg: json['wind_deg'] as int? ?? 0,
        windGust: (json['wind_gust'] as num?)?.toDouble() ?? 0.0,
        windSpeed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,
      );

  @override
  String toString() {
    return '''
     dt: $dt,
     temp: $temp
     feelsLike: $feelsLike
     pressure: $pressure
     humidity: $humidity
     dew_point: $dewPoint
     uvi: $uvi
     clouds: $clouds
     windSpeed: $windSpeed
     windDeg: $windDeg
     windGust: $windGust
     weather: ${weather.toString()}
    ''';
  }
}

import 'package:flutter_nt_ten/data/models/detail/daily_item/daily_feels_like.dart';
import 'package:flutter_nt_ten/data/models/detail/daily_item/daily_temp.dart';
import 'package:flutter_nt_ten/data/models/main/weather_model.dart';

class DailyItem {
  final int dt;

  final int sunrise;

  final int sunset;

  final int moonrise;

  final int moonset;

  final double moonPhase;

  final DailyTemp dailyTemp;

  final DailyFeelsLike dailyFeelsLike;

  final int pressure;

  final int humidity;

  final double dewPoint;

  final double windSpeed;

  final int windDeg;

  final double windGust;

  final List<WeatherModel> weather;

  final int clouds;

  final double pop;

  final double uvi;

  DailyItem({
    required this.dailyFeelsLike,
    required this.dailyTemp,
    required this.windSpeed,
    required this.windGust,
    required this.windDeg,
    required this.uvi,
    required this.dewPoint,
    required this.pop,
    required this.humidity,
    required this.clouds,
    required this.pressure,
    required this.dt,
    required this.weather,
    required this.sunset,
    required this.sunrise,
    required this.moonPhase,
    required this.moonrise,
    required this.moonset,
  });

  factory DailyItem.fromJson(Map<String, dynamic> json) => DailyItem(
        dailyFeelsLike:
            DailyFeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
        dailyTemp: DailyTemp.fromJson(json['temp'] as Map<String, dynamic>),
        windSpeed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,
        windGust: (json['wind_gust'] as num?)?.toDouble() ?? 0.0,
        windDeg: json['wind_deg'] as int? ?? 0,
        uvi: (json['uvi'] as num?)?.toDouble() ?? 0.0,
        dewPoint: (json['dew_point'] as num?)?.toDouble() ?? 0.0,
        pop: (json['pop'] as num?)?.toDouble() ?? 0.0,
        humidity: json['humidity'] as int? ?? 0,
        clouds: json['clouds'] as int? ?? 0,
        pressure: json['pressure'] as int? ?? 0,
        dt: json['dt'] as int? ?? 0,
        weather: (json['weather'] as List<dynamic>?)
                ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        sunset: json['sunset'] as int? ?? 0,
        sunrise: json['sunrise'] as int? ?? 0,
        moonPhase: (json['moon_phase'] as num?)?.toDouble() ?? 0.0,
        moonrise: json['moonrise'] as int? ?? 0,
        moonset: json['moonset'] as int? ?? 0,
      );

  @override
  String toString() {
    return '''
     dt: $dt,
     sunrise: $sunrise
     sunset: $sunset
     moonrise: $moonrise
     moonset: $moonset
     dailyTemp: ${dailyTemp.toString()}
     dailyFeelsLike: ${dailyFeelsLike.toString()}
     pressure: $pressure
     humidity: $humidity
     dewPoint: $dewPoint
     windSpeed: $windSpeed
     windDeg: $windDeg
     windGust: $windGust
     weather: ${weather.toString()}
     clouds: $clouds
     pop: $pop
     uvi: $uvi
    ''';
  }
}

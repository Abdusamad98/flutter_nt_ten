import 'package:flutter_nt_ten/data/models/main/coord_model.dart';
import 'package:flutter_nt_ten/data/models/main/main_in_main.dart';
import 'package:flutter_nt_ten/data/models/main/sys_in_main.dart';
import 'package:flutter_nt_ten/data/models/main/weather_model.dart';
import 'package:flutter_nt_ten/data/models/main/wind_in_main.dart';

class WeatherMainModel {
  final CoordModel coordModel;
  final List<WeatherModel> weatherModel;
  final String base;
  final MainInMain mainInMain;
  final int visibility;
  final WindInMain windInMain;
  final int cloudsAll;
  final int dateTime;
  final SysInMain sysInMain;
  final int timezone;
  final int id;
  final String name;
  final int code;

  WeatherMainModel({
    required this.sysInMain,
    required this.windInMain,
    required this.coordModel,
    required this.id,
    required this.name,
    required this.code,
    required this.dateTime,
    required this.base,
    required this.cloudsAll,
    required this.mainInMain,
    required this.timezone,
    required this.visibility,
    required this.weatherModel,
  });

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) {
    return WeatherMainModel(
      sysInMain: SysInMain.fromJson(json["sys"]),
      windInMain: WindInMain.fromJson(json["wind"]),
      coordModel: CoordModel.fromJson(json["coord"]),
      id: json["id"],
      name: json["name"],
      code: json["cod"],
      dateTime: json["dt"],
      base: json["base"],
      cloudsAll: json["clouds"]["all"],
      mainInMain: MainInMain.fromJson(json["main"]),
      timezone: json["timezone"],
      visibility: json["visibility"],
      weatherModel: (json["weather"] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
    );
  }
}

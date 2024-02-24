import 'package:flutter_nt_ten/data/models/my_response.dart';
import 'package:flutter_nt_ten/data/network/api_provider.dart';

class WeatherRepository {
  Future<MyResponse> getSimpleWeatherInfo(String city) =>
      ApiProvider.getSimpleWeatherInfo(city);

  Future<MyResponse> getComplexWeatherInfo() =>
      ApiProvider.getComplexWeatherInfo();
}

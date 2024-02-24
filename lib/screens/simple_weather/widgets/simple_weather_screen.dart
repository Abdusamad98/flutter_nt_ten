import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/detail/one_call_data.dart';
import 'package:flutter_nt_ten/data/models/my_response.dart';
import 'package:flutter_nt_ten/data/models/simple/weather_main_model.dart';
import 'package:flutter_nt_ten/data/repository/weather_repository.dart';
import 'package:flutter_nt_ten/utils/extensions/my_extensions.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class SimpleWeatherScreen extends StatefulWidget {
  const SimpleWeatherScreen({super.key});

  @override
  State<SimpleWeatherScreen> createState() => _SimpleWeatherScreenState();
}

class _SimpleWeatherScreenState extends State<SimpleWeatherScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Simple Weather"),
        ),
        body: Column(
          children: [
            FutureBuilder<MyResponse>(
              future: weatherRepository.getSimpleWeatherInfo("Beijing"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.hasData) {
                  WeatherMainModel weatherMainModel =
                      (snapshot.data as MyResponse).data as WeatherMainModel;
                  return Column(
                    children: [
                      Text(
                        weatherMainModel.name,
                        style:
                            AppTextStyle.interSemiBold.copyWith(fontSize: 24),
                      ),
                      Text(
                        weatherMainModel.dateTime.getParsedDate().toString(),
                        style:
                            AppTextStyle.interSemiBold.copyWith(fontSize: 24),
                      ),
                      Image.network(
                        weatherMainModel.weatherModel[0].icon
                            .getWeatherIconUrl(),
                      ),
                      Text(
                        "${(weatherMainModel.mainInMain.temp - 273.15).toStringAsFixed(2)} C",
                        style:
                            AppTextStyle.interSemiBold.copyWith(fontSize: 24),
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            FutureBuilder<MyResponse>(
              future: weatherRepository.getComplexWeatherInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.hasData) {
                  OneCallData oneCallData =
                      (snapshot.data as MyResponse).data as OneCallData;
                  return Column(
                    children: [
                      const Row(
                        children: [
                          Text("Today"),
                          Text("Tomorrow"),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(oneCallData.hourly.length,
                                (index) {
                              var hourData = oneCallData.hourly[index];
                              return Column(
                                children: [
                                  Text(hourData.dt.getParsedHour()),
                                  Image.network(
                                    hourData.weather[0].icon
                                        .getWeatherIconUrl(),
                                  ),
                                  Text(
                                    "${hourData.temp} C",
                                  ),
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(oneCallData.daily.length, (index) {
                              var daily = oneCallData.daily[index];
                              return Row(
                                children: [
                                  Text(daily.dt.getParsedDateDay()),
                                  Image.network(
                                    daily.weather[0].icon.getWeatherIconUrl(),
                                  ),
                                  Text(
                                    "${daily.dailyTemp.day} C",
                                  ),
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                      Text(
                        oneCallData.timezone,
                        style:
                            AppTextStyle.interSemiBold.copyWith(fontSize: 24),
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ));
  }
}

import 'package:intl/intl.dart';

extension ParseToStringDate on int {
  String getParsedDate() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat.yMMMMEEEEd("en_US").format(dateTime);
  }

  String getParsedDateDay() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat.E().format(dateTime);
  }


  String getParsedHour() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat(" HH:mm ").format(dateTime);
  }
}

extension ParseImageURL on String {
  String getWeatherIconUrl() {
    return "https://openweathermap.org/img/wn/$this@2x.png";
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_nt_ten/data/api_client.dart';
import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/utils/constants/app_constants.dart';

class ApiProvider extends ApiClient {

  Future<List<CardModel>> getCurrencies() async {
    List<CardModel> currencies = [];

    try {
      Response response = await dio.get(AppConstants.currenciesEndPoint);
      if (response.statusCode == 200) {
        currencies = (response.data as List?)
                ?.map((e) => CardModel.fromJson(e))
                .toList() ??
            [];
        return currencies;
      }
    } catch (error) {
      debugPrint("ERROR:$error");
    }
    return currencies;
  }

// static Future<String> sendNotificationToUsers({
//   String? topicName,
//   String? fcmToken,
//   required String title,
//   required String body,
// }) async {
//   Dio dio = Dio();
//
//   Options options = Options(
//     sendTimeout: const Duration(seconds: 15),
//     receiveTimeout: const Duration(seconds: 30),
//     responseType: ResponseType.json,
//     headers: {
//       "Authorization":
//           "key=AAAAotu5XVc:APA91bE_R7BXT7D5eo38OKdb1cIsKc2ypeSshau8DFngw1lfpKL_RuDr-H2xzshkDvB5548DoCflrzkDqGkvXsYDD2Nw-Bcc-xKOsdBniqu1MSaQ6Qkm2J-bOHgMGTEA49n0VTlprhL3",
//       "Content-Type": "application/json",
//     },
//   );
//
//   try {
//     Response response = await dio.post(
//       "/fcm/send",
//       options: options,
//       onReceiveProgress: (current, total) {},
//       queryParameters: {},
//       data: {
//         "to": topicName != null ? "/topics/$topicName" : fcmToken,
//         "notification": {
//           "title": title,
//           "body": body,
//           "sound": "default",
//           "priority": "high"
//         },
//         "data": {
//           "news_image":
//               "https://top.uz/upload/iblock/0de/0dec725e4583a0698a8732ca646a4994.png",
//           "news_title": "Test",
//           "news_text":
//               "Finland's national carrier Finnair has started weighing passengers on its flights from the capital city of Helsinki. The weigh-ins are being done on a voluntary basis and are completely anonymous. A company spokesperson said the new initiative is to ensure safety standards on flights are adhered to. He said any airplane should not exceed the prescribed maximum weight for safe take-offs and landings."
//         }
//       },
//     );
//
//     if (response.statusCode == 200) {
//       return response.data;
//     }
//   } catch (error) {
//     debugPrint("FAILED TO SEND NOTIFICATION");
//   }
//   return "UNKNOWN ERROR";
// }
}

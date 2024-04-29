import 'dart:convert';
import 'dart:io';

import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';
import 'package:flutter_nt_ten/data/my_custom_exception.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<NetworkResponse> getCurrencies() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/"));

      if (response.statusCode == HttpStatus.ok) {
        return NetworkResponse(
          statusCode: response.statusCode,
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => CurrencyModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return NetworkResponse(
        errorText: getErrorMessage(response.statusCode),
        statusCode: response.statusCode,
      );
    } on SocketException {
      return NetworkResponse(errorText: "INTERNETNI YOQING!");
    } on FormatException {
      return NetworkResponse(errorText: "FILE FORMATI XATO");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}

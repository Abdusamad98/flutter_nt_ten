import 'dart:convert';
import 'dart:io';

import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
   Future<NetworkResponse> getCurrencies() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/"));

      if (response.statusCode == HttpStatus.ok) {
        return NetworkResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => CurrencyModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return NetworkResponse(errorText: "Noma'lum xatolik");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
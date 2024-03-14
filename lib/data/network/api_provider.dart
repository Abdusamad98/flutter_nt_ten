import 'dart:convert';
import 'dart:io';

import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<List<CurrencyModel>> getCurrencies() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/"),
      );
      if (response.statusCode == HttpStatus.ok) {
        return (jsonDecode(response.body) as List?)
                ?.map((e) => CurrencyModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }

    return [];
  }
}

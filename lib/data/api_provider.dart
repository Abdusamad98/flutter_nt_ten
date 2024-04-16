
import 'dart:io';

import 'package:flutter_nt_ten/data/models/currency_model.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {

   Future<NetworkResponse> getCurrencies() async {
    try {
     Response response = await get("https://cbu.uz/uz/arkhiv-kursov-valyut/json/");

      if (response.statusCode == HttpStatus.ok) {
        return NetworkResponse(
          data: (response.body as List?)
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

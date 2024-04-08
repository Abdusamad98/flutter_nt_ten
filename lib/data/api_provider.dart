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
}

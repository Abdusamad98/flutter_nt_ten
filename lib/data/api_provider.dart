import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_nt_ten/data/api_client.dart';
import 'package:flutter_nt_ten/data/models/card_model.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';

class ApiProvider extends ApiClient {
  Future<NetworkResponse> getCards() async {
    try {
      Response response = await dio.get("/api/v1/cards");
      if (response.statusCode == 200) {
        List<CardModel> cards = (response.data as List?)
                ?.map((e) => CardModel.fromJson(e))
                .toList() ??
            [];
        return NetworkResponse(data: cards);
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }
}

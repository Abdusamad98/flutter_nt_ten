import 'dart:convert';

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
        List<CardModel> cards = (response.data["items"] as List?)
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

  Future<NetworkResponse> addCard(CardModel cardModel) async {
    try {
      Response response = await dio.post("/api/v1/cards",
          data: jsonEncode([cardModel.toJson()]));
      if (response.statusCode == 201) {
        List<CardModel> cards = (response.data["items"] as List?)
                ?.map((e) => CardModel.fromJson(e))
                .toList() ??
            [];
        cards.isNotEmpty
            ? NetworkResponse(data: cards[0])
            : NetworkResponse(errorText: "ERROR");
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }

  Future<NetworkResponse> updateCard(CardModel cardModel) async {
    try {
      Response response = await dio.put("/api/v1/cards",
          data: jsonEncode([cardModel.toJsonForUpdate()]));
      if (response.statusCode == 200) {
        List<CardModel> cards = (response.data["items"] as List?)
                ?.map((e) => CardModel.fromJson(e))
                .toList() ??
            [];
        cards.isNotEmpty
            ? NetworkResponse(data: cards[0])
            : NetworkResponse(errorText: "ERROR");
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }

  Future<NetworkResponse> deleteCard(String id) async {
    try {
      Response response = await dio.put(
        "/api/v1/cards",
        data: jsonEncode(
          [
            {
              "_uuid": id,
            }
          ],
        ),
      );
      if (response.statusCode == 200) {
        return NetworkResponse(data: "deleted");
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }
}

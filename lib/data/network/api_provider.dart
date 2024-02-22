import 'dart:convert';

import 'package:flutter_nt_ten/data/models/country/country_model.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';
import 'package:flutter_nt_ten/data/models/user/user_model.dart';
import 'package:flutter_nt_ten/utils/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<NetworkResponse> fetchSingleUserData(int id) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response =
          await http.get(Uri.parse("${AppConstants.baseURL}/albums/$id"));

      if (response.statusCode == 200) {
        networkResponse.data = UserModel.fromJson(jsonDecode(response.body));
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> fetchUsers() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response =
          await http.get(Uri.parse("${AppConstants.baseURL}/albums"));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => UserModel.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> fetchCountries() async {
    try {
      http.Response response = await http
          .get(Uri.parse("${AppConstants.baseURL2}/countries"));
      if (response.statusCode == 200) {
        List<CountryModel> countries =
            (jsonDecode(response.body)["data"]["countries"] as List?)
                    ?.map((e) => CountryModel.fromJson(e))
                    .toList() ??
                [];
        return NetworkResponse(data: countries);
      } else {
        return NetworkResponse(errorText: "ERROR");
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}

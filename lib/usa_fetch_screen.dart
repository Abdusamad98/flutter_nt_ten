import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/usa/usa_info.dart';

import 'package:http/http.dart' as http;

class USAFetchScreen extends StatefulWidget {
  const USAFetchScreen({super.key});

  @override
  State<USAFetchScreen> createState() => _USAFetchScreenState();
}

class _USAFetchScreenState extends State<USAFetchScreen> {
  Future<USAInfo?> _fetchUSAData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://datausa.io/api/data?drilldowns=Nation&measures=Population"));

      if (response.statusCode == 200) {
        return USAInfo.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      print("ERROR:$error");
      throw Exception(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("USA DATA"),
      ),
      body: FutureBuilder<USAInfo?>(
        future: _fetchUSAData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<USAInfo?> data,
        ) {
          if (data.hasError) {
            return Center(
              child: Text(data.error.toString()),
            );
          } else if (data.hasData) {
            USAInfo usaInfo = data.data as USAInfo;
            return Text(usaInfo.sources[0].name);
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

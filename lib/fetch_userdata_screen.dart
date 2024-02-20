import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/user/user_model.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:http/http.dart' as http;

class FetchUserDataScreen extends StatefulWidget {
  const FetchUserDataScreen({super.key});

  @override
  State<FetchUserDataScreen> createState() => _FetchUserDataScreenState();
}

class _FetchUserDataScreenState extends State<FetchUserDataScreen> {
  Future<List<UserModel>?> _fetchUsersData() async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/albums/"),
      );
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List?)
                ?.map((e) => UserModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Fetch Data"),
      ),
      body: FutureBuilder<List<UserModel>?>(
        future: _fetchUsersData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<UserModel>?> snapshot,
        ) {
          if (snapshot.data != null) {
            List<UserModel> users = snapshot.data as List<UserModel>;
            return ListView(
              children: List.generate(users.length, (index) {
                UserModel userModel = users[index];
                return ListTile(
                  onTap: () {},
                  title: Text(userModel.title),
                  subtitle: Text(userModel.userId.toString()),
                  trailing: Text(userModel.id.toString()),
                );
              }),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

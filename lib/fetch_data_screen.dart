import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/user/user_model.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:http/http.dart' as http;

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({super.key});

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  UserModel? userModel;

  bool isLoading = true;

  Future<void> _fetchSingleUserData(int id) async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/albums/$id"),
      );
      if (response.statusCode == 200) {
        userModel = UserModel.fromJson(jsonDecode(response.body));
        isLoading = false;
        setState(() {});
      }
    } catch (error) {
      isLoading = false;
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
      }

      setState(() {});
    }
  }






  @override
  void initState() {
    _fetchSingleUserData(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Fetch Data"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (userModel != null)
                  ListTile(
                    title: Text(userModel!.title),
                    subtitle: Text(userModel!.userId.toString()),
                    trailing: Text(userModel!.id.toString()),
                  )
              ],
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';
import 'package:flutter_nt_ten/data/models/user/user_model.dart';
import 'package:flutter_nt_ten/data/repositories/user_repository.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key, required this.id});

  final int id;

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("User Data"),
      ),
      body: FutureBuilder(
        future: userRepository.getUserDataById(widget.id),
        builder: (
          BuildContext context,
          AsyncSnapshot<NetworkResponse> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            UserModel userModel =
                (snapshot.data as NetworkResponse).data as UserModel;
            return ListTile(
              title: Text(userModel.title),
              subtitle: Text(userModel.userId.toString()),
              trailing: Text(userModel.id.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

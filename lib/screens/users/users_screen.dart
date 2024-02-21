import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';
import 'package:flutter_nt_ten/data/models/user/user_model.dart';
import 'package:flutter_nt_ten/data/repositories/user_repository.dart';
import 'package:flutter_nt_ten/screens/user_data/user_data_screen.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UserRepository usersRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("All Users"),
      ),
      body: FutureBuilder(
        future: usersRepository.getAllUsers(),
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
            List<UserModel> users =
                (snapshot.data as NetworkResponse).data as List<UserModel>;

            return ListView(
              children: List.generate(
                users.length,
                (index) {
                  UserModel userModel = users[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UserDataScreen(
                              id: userModel.id,
                            );
                          },
                        ),
                      );
                    },
                    title: Text(userModel.title),
                    subtitle: Text(userModel.userId.toString()),
                    trailing: Text(userModel.id.toString()),
                  );
                },
              ),
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

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/profile/profile_update_screen.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_nt_ten/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final ProfileViewModel profileViewModel = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    debugPrint("BIR MARTA CHIZILDI");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile detail"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfileUpdateScreen(
                      profileViewModel: profileViewModel,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => profileViewModel,
        child: Consumer<ProfileViewModel>(
          builder: (context, viewModel, child) {
            return Center(
              child: Text(
                "NAME:${viewModel.userName}",
                style: AppTextStyle.interSemiBold.copyWith(fontSize: 25),
              ),
            );
          },
        ),
      ),
    );
  }
}

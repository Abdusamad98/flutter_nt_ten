import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/view_models/profile_view_model.dart';

class ProfileUpdateScreen extends StatelessWidget {
  const ProfileUpdateScreen({super.key, required this.profileViewModel});

  final ProfileViewModel profileViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: (v) {
              profileViewModel.updateName(v);
            },
          ),
        ),
      ),
    );
  }
}

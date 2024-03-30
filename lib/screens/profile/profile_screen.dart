import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/profile/dialogs/image_picker_dialog.dart';
import 'package:flutter_nt_ten/screens/profile_update/profile_update_screen.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_nt_ten/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.getLoader) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              const SizedBox(height: 24),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: viewModel.profileModel.imageUrl.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: viewModel.profileModel.imageUrl,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: 100,
                                height: 100,
                                decoration:
                                    const BoxDecoration(color: Colors.blue),
                              ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () async {
                          imagePickerDialog(
                            context: context,
                            onImageSelected: (selectedImage) async {
                              await context
                                  .read<ProfileViewModel>()
                                  .uploadImage(
                                    pickedFile: selectedImage.image,
                                    storagePath: selectedImage.storagePathMade,
                                  );
                            },
                          );
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfileUpdateScreen();
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "UPDATE USER",
                      style: AppTextStyle.interSemiBold
                          .copyWith(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(width: 24),
                    const Icon(
                      Icons.update,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

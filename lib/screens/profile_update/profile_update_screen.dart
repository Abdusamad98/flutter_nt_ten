import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/profile_fields.dart';
import 'package:flutter_nt_ten/screens/map/google_maps_screen.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_nt_ten/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  Country? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Profile Update"),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<ProfileViewModel>().updateProfile();
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.getLoader) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: TextField(
                    onChanged: (v) {
                      context.read<ProfileViewModel>().updateFields(
                            value: v,
                            field: ProfileFields.fullName,
                          );
                    },
                    decoration: InputDecoration(
                        labelText: "FullName",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: TextField(
                    onChanged: (v) {
                      context.read<ProfileViewModel>().updateFields(
                            value: v,
                            field: ProfileFields.nickName,
                          );
                    },
                    decoration: InputDecoration(
                        labelText: "Nickname",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: TextField(
                    onChanged: (v) {
                      context.read<ProfileViewModel>().updateFields(
                            value: v,
                            field: ProfileFields.email,
                          );
                    },
                    decoration: InputDecoration(
                        labelText: "E-mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        context.read<ProfileViewModel>().updateFields(
                              value: country.name,
                              field: ProfileFields.country,
                            );
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        viewModel.profileModel.country.isEmpty
                            ? "Select Country"
                            : viewModel.profileModel.country,
                        style: AppTextStyle.interSemiBold
                            .copyWith(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [],
                    onChanged: (v) {
                      String phonePrefix =
                          country != null ? country!.phoneCode : "+998";
                      context.read<ProfileViewModel>().updateFields(
                            value: phonePrefix + v,
                            field: ProfileFields.phone,
                          );
                    },
                    decoration: InputDecoration(
                        prefixText:
                            country != null ? country!.phoneCode : "+998",
                        prefixIcon: GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              onSelect: (Country c) {
                                country = c;
                                setState(() {});
                              },
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.sell),
                          ),
                        ),
                        labelText: "Phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const GoogleMapsScreen();
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Text(
                      viewModel.profileModel.address.isEmpty
                          ? "SELECT ADDRESS"
                          : viewModel.profileModel.address,
                      style: AppTextStyle.interSemiBold.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

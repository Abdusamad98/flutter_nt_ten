import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/contact_model.dart';
import 'package:flutter_nt_ten/models/repository.dart';
import 'package:flutter_nt_ten/screens/add_contact/widgets/universal_textfiled.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/extensions/project_extensions.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String phoneNumber = "";
    String firstName = "";
    String lastName = "";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add',
          style: AppTextStyle.interSemiBold.copyWith(
            fontSize: 20,
          ),
        ),
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ContactModel newContact = ContactModel(
                lastName: lastName,
                firstName: firstName,
                phoneNumber: phoneNumber,
              );

              if (newContact.firstName.isEmpty ||
                  newContact.lastName.isEmpty ||
                  newContact.phoneNumber.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      "Contact ma'lumotlari xato!",
                      style: AppTextStyle.interMedium
                          .copyWith(color: Colors.white),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Contact saqlandi",
                    ),
                  ),
                );
                contacts.add(newContact);
                Navigator.pop(context);
              }

              print(newContact);
            },
            icon: const Icon(
              Icons.done,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w(),
          vertical: 15.h(),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.getH(),
              UniversalTextField(
                title: "Name",
                hintText: "Enter name",
                onChanged: (value) {
                  firstName = value;
                },
                onSubmit: (v) {
                  firstName = v;
                },
              ),
              20.getH(),
              UniversalTextField(
                title: "Surname",
                hintText: "Enter surname",
                onChanged: (value) {
                  lastName = value;
                },
                onSubmit: (v) {
                  lastName = v;
                },
              ),
              20.getH(),
              UniversalTextField(
                title: "Phone number",
                hintText: "_ _   _ _ _   _ _   _ _",
                onChanged: (value) {
                  phoneNumber = "+998$value";
                },
                onSubmit: (v) {
                  phoneNumber = "+998$v";
                },
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

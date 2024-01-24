import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/contact_model.dart';
import 'package:flutter_nt_ten/screens/contact/widgets/contact_item.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ContactModel> contacts = [
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      ),
      ContactModel(
        lastName: "Falonchiyev",
        firstName: "Pistonchi",
        phoneNumber: "+99899 123 45 67",
      )
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Contacts",
          style: AppTextStyle.interSemiBold.copyWith(
            fontSize: 20,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ...List.generate(
            //   contacts.length,
            //   (index) => ContactItem(
            //     onCallTap: () {},
            //     onContactTap: () {},
            //     contactModel: contacts[index],
            //   ),
            // ),
            for (int i = 0; i < contacts.length; i++)
              ContactItem(
                onCallTap: () {},
                onContactTap: () {},
                contactModel: contacts[i],
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

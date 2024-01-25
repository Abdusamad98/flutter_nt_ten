import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/contact_model.dart';
import 'package:flutter_nt_ten/screens/add_contact/add_contact_screen.dart';
import 'package:flutter_nt_ten/screens/contact/widgets/contact_item.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/extensions/project_extensions.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

import '../../models/repository.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddContactScreen();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

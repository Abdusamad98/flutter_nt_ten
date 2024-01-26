import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/contact_model.dart';
import 'package:flutter_nt_ten/screens/add_contact/add_contact_screen.dart';
import 'package:flutter_nt_ten/screens/contact/widgets/contact_item.dart';
import 'package:flutter_nt_ten/screens/contact_info/contact_info_screen.dart';
import 'package:flutter_nt_ten/screens/widgets/global_app_bar.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/extensions/project_extensions.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
      appBar: GlobalAppBar(
        onMoreTap: () {},
        onSearchTap: () {
          print("SEARCH bosildi");
        },
        backIsVisible: false,
      ),
      body: contacts.isEmpty
          ? Center(child: SvgPicture.asset(AppImages.emptyBox))
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < contacts.length; i++)
                    ContactItem(
                      onCallTap: () {
                        Uri uri = Uri.parse("tel:${contacts[i].phoneNumber}");
                        launchUrl(uri);
                      },
                      onContactTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ContactInfoScreen(
                                clickedContactIndex: i,
                              );
                            },
                          ),
                        );
                      },
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
                return AddContactScreen(
                  onChanged: () {
                    setState(() {});
                  },
                );
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ...List.generate(
//   contacts.length,
//   (index) => ContactItem(
//     onCallTap: () {},
//     onContactTap: () {},
//     contactModel: contacts[index],
//   ),
// ),

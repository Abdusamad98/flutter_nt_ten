import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/contact_model.dart';
import 'package:flutter_nt_ten/models/repository.dart';
import 'package:flutter_nt_ten/screens/add_contact/widgets/universal_textfiled.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/extensions/project_extensions.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class UpdateContactScreen extends StatefulWidget {
  const UpdateContactScreen({
    super.key,
    required this.onChanged,
    required this.updateContactIndex,
  });

  final Function onChanged;
  final int updateContactIndex;

  @override
  State<UpdateContactScreen> createState() => _UpdateContactScreenState();
}

class _UpdateContactScreenState extends State<UpdateContactScreen> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  @override
  void initState() {
    ContactModel contactModel = contacts[widget.updateContactIndex];
    firstNameController.text = contactModel.firstName;
    lastNameController.text = contactModel.lastName;

    String phone = contactModel.phoneNumber.replaceAll(" ", "").substring(4);

    phoneController.text = phone;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Contact',
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
              String phoneNumber = "+998 ${phoneController.text}";
              String firstName = firstNameController.text;
              String lastName = lastNameController.text;

              ContactModel newContact = ContactModel(
                lastName: lastName,
                firstName: firstName,
                phoneNumber: phoneNumber,
              );

              if (newContact.firstName.isEmpty ||
                  newContact.lastName.isEmpty ||
                  newContact.phoneNumber.length < 9) {
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
                contacts[widget.updateContactIndex] = newContact;
                widget.onChanged.call();
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
                controller: firstNameController,
              ),
              20.getH(),
              UniversalTextField(
                title: "Surname",
                hintText: "Enter surname",
                controller: lastNameController,
              ),
              20.getH(),
              UniversalTextField(
                title: "Phone number",
                hintText: "_ _   _ _ _   _ _   _ _",
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

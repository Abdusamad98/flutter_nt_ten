import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/models/contact_model.dart';
import 'package:flutter_nt_ten/models/repository.dart';
import 'package:flutter_nt_ten/screens/update_contact/update_contact_screen.dart';
import 'package:flutter_nt_ten/screens/widgets/global_app_bar.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/extensions/project_extensions.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen(
      {super.key, required this.clickedContactIndex, required this.onChanged});

  final int clickedContactIndex;
  final Function onChanged;

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  late ContactModel contactModel;

  @override
  void initState() {
    contactModel = contacts[widget.clickedContactIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        backIsVisible: true,
        onMoreTap: () {},
        onSearchTap: () {},
      ),
      body: Column(
        children: [
          52.getH(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.account_circle,
                size: 100,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.red,
                            elevation: 2.0,
                            iconColor: Colors.green,
                            icon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.account_circle),
                            ),
                            title: const Text("Ogohlantirish!"),
                            content: const Text(
                                "Siz haqiqatdan ham ushbu kontaktingizni o'chirmoqchimisiz?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  contacts.removeAt(widget.clickedContactIndex);
                                  widget.onChanged.call();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('NO'),
                              ),
                            ],
                          );
                        },
                      );

                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return Material(
                      //         color: Colors.transparent,
                      //         child: Container(
                      //             margin: EdgeInsets.all(100),
                      //             width: 300,
                      //             height: 400,
                      //             color: Colors.white,
                      //             child: Text("dhjfgbn")),
                      //       );
                      //     });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return UpdateContactScreen(
                              onChanged: () {
                                widget.onChanged.call();
                                setState(() {
                                  contactModel =
                                      contacts[widget.clickedContactIndex];
                                });
                              },
                              updateContactIndex: widget.clickedContactIndex);
                        }),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  7.getW(),
                ],
              )),
            ],
          ),
          20.getH(),
          Text(
            "${contactModel.firstName} ${contactModel.lastName}",
            style: AppTextStyle.interSemiBold.copyWith(
              fontSize: 22,
            ),
          ),
          25.getH(),
          Row(
            children: [
              15.getW(),
              Text(
                contactModel.phoneNumber,
                style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  Uri uri = Uri.parse("tel:${contactModel.phoneNumber}");
                  launchUrl(uri);
                },
                backgroundColor: AppColors.c_08AE2D,
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              15.getW(),
              FloatingActionButton(
                onPressed: () {
                  Uri uri = Uri.parse("sms:Hello World");
                  launchUrl(uri);
                },
                backgroundColor: Colors.orange,
                child: const Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              ),
              15.getW(),
            ],
          )
        ],
      ),
    );
  }
}

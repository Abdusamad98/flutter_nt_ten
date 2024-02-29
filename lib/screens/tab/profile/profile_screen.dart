import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
      ),
      body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.addCategory);
                  },
                  icon: const Icon(
                    Icons.category,
                    color: Colors.white,
                  ))
            ],
          )),
    );
  }
}

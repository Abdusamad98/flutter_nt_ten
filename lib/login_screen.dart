import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    print("WIDTH:$width");
    print("HEIGHT:$height");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Log in',
          style: TextStyle(
            color: Color(0xFF1A72DD),
            fontSize: 22,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            "assets/icons/back_button.svg",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            const Text(
              'Welcome to MokPOS!',
              style: TextStyle(
                color: Color(0xFF2A3256),
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Select login as the owner or employee first to continue.',
              style: TextStyle(
                color: Color(0xFF2A3256),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(height: 50.getSize()),
            Center(
              child: Image.asset(
                "assets/images/login_image.png",
                height: 187.getSize(),
              ),
            ),
            SizedBox(height: 50.getSize()),
            _myButton(
              iconPath: "assets/icons/person.svg",
              title: 'Log in as Owner',
              height: height,
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Or',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2A3256),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 12),
            _myButton(
              iconPath: "assets/icons/union.svg",
              title: 'Log in as Employee',
              height: height,
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Color(0xFF2A3256),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF1A72DD),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _myButton({
    required String iconPath,
    required String title,
    required double height,
  }) {
    return SizedBox(
      height: 57.getSize(),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFF1A72DD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(iconPath),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

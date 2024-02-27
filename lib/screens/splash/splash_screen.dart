import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/storage_repository.dart';
import 'package:flutter_nt_ten/screens/routes.dart';
import 'package:flutter_nt_ten/utils/constants/storage_keys.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    StorageRepository();
    bool isEnteredBefore =
        StorageRepository.getBool(key: StorageKeys.onBoardingState);
    print("ON BOARDING STATE:$isEnteredBefore");
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (isEnteredBefore) {
          Navigator.pushNamed(context, RouteNames.tabBox);
        } else {
          Navigator.pushNamed(context, RouteNames.onBoarding);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width  = MediaQuery.of(context).size.width;
    height  = MediaQuery.of(context).size.height;
    return Scaffold();
  }
}

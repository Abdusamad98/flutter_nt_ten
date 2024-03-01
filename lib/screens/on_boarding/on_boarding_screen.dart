import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/storage_repository.dart';
import 'package:flutter_nt_ten/screens/on_boarding/pages/on_boarding_pageone.dart';
import 'package:flutter_nt_ten/screens/on_boarding/pages/on_boarding_pagethree.dart';
import 'package:flutter_nt_ten/screens/on_boarding/pages/on_boarding_pagetwo.dart';
import 'package:flutter_nt_ten/screens/routes.dart';
import 'package:flutter_nt_ten/utils/constants/storage_keys.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.tabBox);
                  StorageRepository.setBool(
                    key: StorageKeys.onBoardingState,
                    value: true,
                  );
                },
                child: Text("Skip")),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  OnBoardingPageOne(),
                  OnBoardingPageTwo(),
                  OnBoardingPageThree(),
                ],
              ),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      if (activeIndex > 0) {
                        activeIndex--;
                      }
                      _scrollPage(activeIndex);
                      setState(() {});
                    },
                    child: Text("Back")),
                TextButton(
                    onPressed: () async {
                      if (activeIndex < 2) {
                        activeIndex++;
                      } else {
                        await StorageRepository.setBool(
                          key: StorageKeys.onBoardingState,
                          value: true,
                        );
                        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
                      }

                      _scrollPage(activeIndex);

                      setState(() {});
                    },
                    child: Text("Next")),
              ],
            )
          ],
        ),
      ),
    );
  }

  _scrollPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }
}

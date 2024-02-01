import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nt_ten/models/page_data_model.dart';
import 'package:flutter_nt_ten/screens/auth/auth_option_screen.dart';
import 'package:flutter_nt_ten/screens/on_boarding/widgets/boarding_bottom_view.dart';
import 'package:flutter_nt_ten/screens/on_boarding/widgets/page_item.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int activeIndex = 0;
  final PageController pageController = PageController();

  List<PageDataModel> pagesData = [
    PageDataModel(
      iconPath: AppImages.onBoardingOne,
      title: "View and buy Medicine online",
      subtitle:
          "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.",
    ),
    PageDataModel(
      iconPath: AppImages.onBoardingTwo,
      title: "Online medical & Healthcare",
      subtitle:
          "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.",
    ),
    PageDataModel(
      iconPath: AppImages.onBoardingThree,
      title: "Get Delivery on time",
      subtitle:
          "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  ...List.generate(
                    pagesData.length,
                    (index) => PageItem(
                      pageDataModel: pagesData[index],
                      horizontalPadding: index == 0 ? 70.getW() : 55.getW(),
                    ),
                  )
                ],
              ),
            ),
            BoardingBottomView(
              pagesData: pagesData,
              activeIndex: activeIndex,
              onTap: () {
                if (activeIndex < pagesData.length - 1) {
                  setState(() {
                    activeIndex++;
                  });
                  pageController.jumpToPage(activeIndex);
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AuthOptionScreen();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 30.getH()),
          ],
        ),
      ),
    );
  }
}

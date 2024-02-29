import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/add_category/add_category_screen.dart';
import 'package:flutter_nt_ten/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter_nt_ten/screens/splash/splash_screen.dart';
import 'package:flutter_nt_ten/screens/tab/tab_box.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return navigate(const SplashScreen());
      case RouteNames.tabBox:
        return navigate(const TabBox());
      case RouteNames.onBoarding:
        return navigate(const OnBoardingScreen());
      case RouteNames.addCategory:
        return navigate(const AddCategoryScreen());
      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splash = "/";
  static const String tabBox = "/tab_route";
  static const String onBoarding = "/on_boarding_route";
  static const String addCategory = "/add_category";
}

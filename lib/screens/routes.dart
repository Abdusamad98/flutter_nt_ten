import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/user_model.dart';
import 'package:flutter_nt_ten/screens/first/first_screen.dart';
import 'package:flutter_nt_ten/screens/home/home_screen.dart';
import 'package:flutter_nt_ten/screens/second/second_screen.dart';
import 'package:flutter_nt_ten/screens/third/third_screen.dart';

// TODO Step 2
class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.helloScreen:
        return navigate(const HomeScreen());

      case RouteNames.firstScreen:
        return navigate(FirstScreen(number: settings.arguments as int));

      case RouteNames.secondScreen:
        {
          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
          return navigate(
            SecondScreen(
              numberOne: map["number_1"] as int,
              numberTwo: map["number_2"] as int,
              name: map["name"] as String,
            ),
          );
        }

      case RouteNames.thirdScreen:
        return navigate(
          ThirdScreen(
            userModel: settings.arguments as UserModel,
          ),
        );

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

// TODO Step 3
class RouteNames {
  static const String helloScreen = "/";
  static const String firstScreen = "/first_route";
  static const String secondScreen = "/second_route";
  static const String thirdScreen = "/third_route";
}

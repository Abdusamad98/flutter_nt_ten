import 'package:flutter/cupertino.dart';

double height = 0.0;
double width = 0.0;

extension Size on int {
  double h() {
    return (this / 620) * height;
  }

  double w() {
    return (this / 360) * width;
  }

  SizedBox getH() {
    return SizedBox(
      height: (this / 620) * height,
    );
  }

  SizedBox getW() {
    return SizedBox(
      width: (this / 360) * width,
    );
  }
}

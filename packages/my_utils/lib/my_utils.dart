double height = 0.0;
double width = 0.0;

extension SizeUtils on int {
  double get h => (this / 812) * height;

  double get w => (this / 375) * width;
}

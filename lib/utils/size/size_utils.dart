double width = 0;
double height = 0;

extension Size on int {
  double getH() {
    return (this / 812) * height;
  }

  double getW() {
    return (this / 375) * width;
  }
}

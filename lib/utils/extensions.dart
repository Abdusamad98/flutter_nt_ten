double height = 0;
double width = 0;

extension Size on  int {
  double getSize() {
    return (this / 812) * height;
  }
}

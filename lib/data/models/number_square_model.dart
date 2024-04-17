class NumberSquareModel {
  final int index;
  final bool isFilled;
  final String number;

  NumberSquareModel({
    required this.index,
    required this.number,
    required this.isFilled,
  });
}

var t = NumberSquareModel(
  index: 2,
  isFilled: false,
  number: "",
);

var t1 = NumberSquareModel(
  index: 2,
  isFilled: true,
  number: "3",
);

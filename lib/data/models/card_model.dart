class CardModel {
  CardModel({
    required this.name,
    required this.cardNumber,
    required this.cardHolder,
    required this.expireDate,
  });

  String name;
  String cardNumber;
  String expireDate;
  String cardHolder;

  CardModel copyWith({
    String? name,
    String? cardNumber,
    String? expireDate,
    String? cardHolder,
  }) =>
      CardModel(
        name: name ?? this.name,
        cardNumber: cardNumber ?? this.cardNumber,
        expireDate: expireDate ?? this.expireDate,
        cardHolder: cardHolder ?? this.cardHolder,
      );
}

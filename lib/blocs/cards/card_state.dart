class CardState {
  CardState({
    required this.name,
    required this.cardNumber,
    required this.cardHolder,
    required this.expireDate,
  });

  String name;
  String cardNumber;
  String expireDate;
  String cardHolder;

  CardState copyWith({
    String? name,
    String? cardNumber,
    String? expireDate,
    String? cardHolder,
  }) =>
      CardState(
        name: name ?? this.name,
        cardNumber: cardNumber ?? this.cardNumber,
        expireDate: expireDate ?? this.expireDate,
        cardHolder: cardHolder ?? this.cardHolder,
      );

  @override
  String toString() {
    return '''
      NAME:$name,
      CARD_NUMBER:$cardNumber,
      EXPIRE_DATE:$expireDate,
      CARD_HOLDER:$cardHolder
    ''';
  }
}

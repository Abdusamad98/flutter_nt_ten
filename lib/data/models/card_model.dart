import 'package:equatable/equatable.dart';

class CardModel extends Equatable {
  const CardModel({
    required this.name,
    required this.cardNumber,
    required this.cardHolder,
    required this.expireDate,
  });

  final String name;
  final String cardNumber;
  final String expireDate;
  final String cardHolder;

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

  @override
  List<Object?> get props => [
        name,
        cardNumber,
        expireDate,
        cardHolder,
      ];
}

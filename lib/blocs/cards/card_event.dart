abstract class CardEvent {}

class CardInsertNameEvent extends CardEvent {
  final String name;

  CardInsertNameEvent(this.name);
}

class CardInsertNumberEvent extends CardEvent {
  final String cardNumber;

  CardInsertNumberEvent(this.cardNumber);
}

class CardInsertHolderNameEvent extends CardEvent {
  final String cardHolder;

  CardInsertHolderNameEvent(this.cardHolder);
}

class CardInsertExpireDateEvent extends CardEvent {
  final String cardExpireDate;

  CardInsertExpireDateEvent(this.cardExpireDate);
}

class CardSetEmptyEvent extends CardEvent {}

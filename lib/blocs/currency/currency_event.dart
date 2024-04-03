abstract class CurrencyEvent {}

class GetCurrenciesEvent extends CurrencyEvent {}

class DeleteCurrencyEvent extends CurrencyEvent {
  final int currencyId;

  DeleteCurrencyEvent({required this.currencyId});
}

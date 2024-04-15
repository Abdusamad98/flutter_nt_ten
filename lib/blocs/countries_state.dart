part of 'countries_bloc.dart';

sealed class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesError extends CountriesState {
  final String errorMessage;

  CountriesError(this.errorMessage);
}

class CountriesSuccess extends CountriesState {
  final List<CountryModel> countries;

  CountriesSuccess(this.countries);
}

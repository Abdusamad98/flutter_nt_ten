import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/data/api/api_client.dart';
import 'package:flutter_nt_ten/data/models/country_model.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';

part 'countries_event.dart';

part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc({required this.apiClient}) : super(CountriesInitial()) {
    on<FetchCountries>((FetchCountries event, emit) async {
      emit(CountriesLoading());

      NetworkResponse networkResponse =
          await apiClient.getCountriesByContinents("EU");

      if (networkResponse.errorText.isEmpty) {
        emit(CountriesSuccess(networkResponse.data as List<CountryModel>));
      } else {
        emit(CountriesError(networkResponse.errorText));
      }
    });
  }

  final ApiClient apiClient;
}

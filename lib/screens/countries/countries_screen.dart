import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/country/country_model.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';
import 'package:flutter_nt_ten/data/repositories/country_repository.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  final CountryRepository countryRepository = CountryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
      ),
      body: FutureBuilder(
        future: countryRepository.getCountries(),
        builder: (
          BuildContext context,
          AsyncSnapshot<NetworkResponse> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<CountryModel> countries =
                (snapshot.data as NetworkResponse).data as List<CountryModel>;

            return ListView(
              children: List.generate(
                countries.length,
                (index) {
                  CountryModel countryModel = countries[index];
                  return ListTile(
                    title: Text(countryModel.name),
                    subtitle: Text(countryModel.capital),
                    trailing: Text(countryModel.emoji),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

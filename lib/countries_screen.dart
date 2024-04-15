import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/countries_bloc.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("EUROPE COUNTRIES"),
      ),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CountriesError) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is CountriesSuccess) {
            return ListView(
              children: List.generate(
                state.countries.length,
                (index) => ListTile(
                  title: Text(state.countries[index].name),
                  trailing: Text(state.countries[index].emoji),
                  subtitle: Text(state.countries[index].continentName),
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

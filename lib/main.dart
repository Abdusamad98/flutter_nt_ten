import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/countries_bloc.dart';
import 'package:flutter_nt_ten/countries_screen.dart';
import 'package:flutter_nt_ten/data/api/api_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ApiClient apiClient =
      ApiClient(graphQLClient: ApiClient.create().graphQLClient);

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => CountriesBloc(apiClient: apiClient)..add(FetchCountries()),
    )
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountriesScreen(),
    );
  }
}

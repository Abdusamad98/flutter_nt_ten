import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/cards_bloc.dart';
import 'package:flutter_nt_ten/data/api_provider.dart';
import 'package:flutter_nt_ten/data/cards_repo.dart';
import 'package:flutter_nt_ten/screens/cards_screen.dart';
import 'package:flutter_nt_ten/screens/tab_box.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (_) => CardsRepository(apiProvider: apiProvider)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CardsBloc(cardsRepository: context.read<CardsRepository>())
                  ..add(GetCardsEvent()),
          )
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: TabBox(),
    );
  }
}

import 'package:flutter_nt_ten/data/api_provider.dart';
import 'package:flutter_nt_ten/data/repositories/game_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setUpDI() {
  locator.registerSingleton<GameRepository>(GameRepository());
  //locator.registerSingleton<GameRepository>(GameRepository.createEmpty());
  locator.registerSingleton<ApiProvider>(ApiProvider());
}

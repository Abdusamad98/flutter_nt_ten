import 'package:flutter_nt_ten/data/repsitories/product_repository.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.I;

void setUp() {
  getIt.registerSingleton<ProductRepository>(ProductRepository());
}

import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;

  increment() => counter++;

  decrement() => counter--;
}

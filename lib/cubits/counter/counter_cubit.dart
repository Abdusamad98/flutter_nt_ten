import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

 void increment() {
    // int currentState = state;
    // currentState++;
    emit(state + 1);
  }

 void decrement() {
    // int currentState = state;
    // currentState++;
    emit(state - 1);
  }
}

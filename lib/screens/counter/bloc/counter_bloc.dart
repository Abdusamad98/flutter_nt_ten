import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/screens/counter/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  void _increment(IncrementEvent event, Emitter<int> emit) {
    addError(Exception("Bu xatolik"));
    emit(state + event.value);
  }

  void _decrement(DecrementEvent event, Emitter<int> emit) {
    emit(state - 1);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint("ON ERROR: ${error.toString()}\n");
    super.onError(error, stackTrace);
  }
}

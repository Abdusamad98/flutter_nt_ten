import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/screens/counter/bloc/counter_event.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("ON CHANGE: ${change.nextState.toString()}\n");

    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("ON CREATE: ${bloc.state.toString()}\n");

    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("ON ERROR: ${error.toString()}\n");

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (event is IncrementEvent) {}

    debugPrint("ON EVENT: ${event.toString()}\n");

    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("ON TRANSITION: ${transition.currentState.toString()}\n");

    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("ON CLOSE: ${bloc.state.toString()}\n");

    super.onClose(bloc);
  }
}

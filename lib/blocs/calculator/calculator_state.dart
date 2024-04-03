part of 'calculator_cubit.dart';

abstract class CalculatorState {}

class CalculatorInitialState extends CalculatorState {}

class CalculatorResultState extends CalculatorState {
  final String result;

  CalculatorResultState(this.result);
}

class CalculatorCalculatingState extends CalculatorState {}

class CalculatorInputErrorState extends CalculatorState {
  final String errorCause;

  CalculatorInputErrorState(this.errorCause);
}

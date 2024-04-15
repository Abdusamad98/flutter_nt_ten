part of 'calculator_cubit.dart';

abstract class CalculatorState extends Equatable {}

class CalculatorInitialState extends CalculatorState {
  @override
  List<Object?> get props => [];
}

class CalculatorResultState extends CalculatorState {
  final String result;

  CalculatorResultState(this.result);

  @override
  List<Object?> get props => [result];
}

class CalculatorCalculatingState extends CalculatorState {
  @override
  List<Object?> get props => [];
}

class CalculatorInputErrorState extends CalculatorState {
  final String errorCause;

  CalculatorInputErrorState(this.errorCause);

  @override
  List<Object?> get props => [errorCause];
}

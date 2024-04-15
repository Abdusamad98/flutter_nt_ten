import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitialState());

  void addition(double a, double b) {
    emit(CalculatorCalculatingState());

    double result = a + b;

    emit(CalculatorResultState("Qo'shish natijasi:$result"));
  }

  void subtruction(double a, double b) {
    emit(CalculatorCalculatingState());
    if (a > b) {
      double result = a - b;
      emit(CalculatorResultState("Ayrish natijasi:$result"));
    } else {
      emit(CalculatorInputErrorState(
          "a soni b sonidan kichik! Natija musbat bo'lishi uchun to'g'ri input kiriting!"));
    }
  }

  void multiplication(double a, double b) {
    emit(CalculatorCalculatingState());

    double result = a * b;

    emit(CalculatorResultState("Ko'paytma:$result"));
  }

  void division(double a, double b) {
    emit(CalculatorCalculatingState());
    if (b != 0) {
      double result = a / b;
      emit(CalculatorResultState("Bo'linma:$result"));
    } else {
      emit(
        CalculatorInputErrorState("Bo'luvchi nolga teng bo'lmasligi kerak!"),
      );
    }
  }
}

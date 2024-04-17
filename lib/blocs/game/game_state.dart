part of 'game_bloc.dart';

class GameState extends Equatable {
  const GameState({
    required this.allQuestions,
    required this.currentQuestionIndex,
    required this.trueCount,
    required this.lettersList,
    required this.enteredAnswer,
  });

  final int currentQuestionIndex;
  final List<QuestionModel> allQuestions;
  final int trueCount;
  final List<String> lettersList;
  final String enteredAnswer;

  GameState copyWith({
    int? currentQuestionIndex,
    List<QuestionModel>? allQuestions,
    int? trueCount,
    List<String>? lettersList,
    String? enteredAnswer,
  }) {
    return GameState(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      allQuestions: allQuestions ?? this.allQuestions,
      trueCount: trueCount ?? this.trueCount,
      lettersList: lettersList ?? this.lettersList,
      enteredAnswer: enteredAnswer ?? this.enteredAnswer,
    );
  }

  @override
  List<Object?> get props => [
        allQuestions,
        currentQuestionIndex,
        trueCount,
        lettersList,
        enteredAnswer,
      ];
}

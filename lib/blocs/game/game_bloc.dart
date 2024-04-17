import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/data/models/question_model.dart';
import 'package:flutter_nt_ten/data/repositories/game_repository.dart';
import 'package:flutter_nt_ten/services/service_locator.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(
          const GameState(
            allQuestions: [],
            currentQuestionIndex: 0,
            trueCount: 0,
            lettersList: [],
            enteredAnswer: "",
          ),
        ) {
    on<LoadQuestions>(onInit);
    on<NextQuestions>(onNext);
    on<CollectEnteredLetter>(onCollect);
  }

  onInit(LoadQuestions event, emit) {
    List<QuestionModel> questions = locator.get<GameRepository>().questions;
    String answerText = questions[state.currentQuestionIndex].answer;

    emit(
      state.copyWith(
        allQuestions: questions,
        lettersList: getOptionLetters(answerText),
      ),
    );
  }

  onNext(NextQuestions event, emit) {
    if (state.enteredAnswer.toLowerCase() ==
        state.allQuestions[state.currentQuestionIndex].answer.toLowerCase()) {
      if (state.allQuestions.length - 1 >= state.currentQuestionIndex + 1) {
        int newQuestionIndex = state.currentQuestionIndex + 1;
        emit(
          state.copyWith(
            lettersList:
                getOptionLetters(state.allQuestions[newQuestionIndex].answer),
            trueCount: state.trueCount + 1,
            currentQuestionIndex: newQuestionIndex,
            enteredAnswer: "",
          ),
        );
      }
    }
  }

  onCollect(CollectEnteredLetter event, emit) {
    if (state.allQuestions[state.currentQuestionIndex].answer.length >
        state.enteredAnswer.length) {
      emit(state.copyWith(enteredAnswer: state.enteredAnswer + event.letter));
    }
  }
}

String alphabet = "qwertyuiopasdfghjklzxcvbnm";

List<String> getOptionLetters(String answerText) {
  int len = answerText.length;

  for (int i = 0; i < (12 - len); i++) {
    Random random = Random();
    int index = random.nextInt(26);
    answerText += alphabet[index];
  }
  List<String> letterList = answerText.split('');
  letterList.shuffle();
  debugPrint("LENGTH:${letterList.length}:$letterList");
  return letterList;
}

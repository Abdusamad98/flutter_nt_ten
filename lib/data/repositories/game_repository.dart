import 'package:flutter_nt_ten/data/models/question_model.dart';

class GameRepository {
  GameRepository();

  List<QuestionModel> questions = [
    QuestionModel(
        answer: "toshkent",
        questionText: "O'zbekistonning poytaxti qaysi shaxar?"),
    QuestionModel(
        answer: "toshkent",
        questionText: "O'zbekistonning poytaxti qaysi shaxar?"),
    QuestionModel(
        answer: "toshkent",
        questionText: "O'zbekistonning poytaxti qaysi shaxar?"),
  ];

  GameRepository.createEmpty() {
    questions = [];
  }
}

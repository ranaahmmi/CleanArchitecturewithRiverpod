import 'package:riverpod_test_project/data/models/quiz_model.dart';

abstract class QuizState {
  const QuizState();
}

class InitalQuizState extends QuizState {
  const InitalQuizState();
}

class QuizLoadingState extends QuizState {
  const QuizLoadingState();
}

class QuizLoadedState extends QuizState {
  final List<QuizModel>? quizList;
  const QuizLoadedState(this.quizList);
}

class QuizErrorState extends QuizState {
  final String message;
  const QuizErrorState(this.message);
}
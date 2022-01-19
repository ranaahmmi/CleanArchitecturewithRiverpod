import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/data/interfaces/iquiz_repository.dart';
import 'package:riverpod_test_project/data/network/network_exception.dart';
import 'package:riverpod_test_project/data/riverpod/quiz/quiz_state.dart';

class QuizNotifier extends StateNotifier<QuizState> {
  final IquizRepository _quizRepository;

  QuizNotifier(this._quizRepository) : super(const InitalQuizState()) {
    getQuiz();
  }

  Future<void> getQuiz() async {
    try {
      state = const QuizLoadingState();
      final quiz = await _quizRepository.fatchQuiz();
      state = QuizLoadedState(quiz);
    } on NetworkException {
      state = const QuizErrorState('something_went_wrong');
    }
  }
}

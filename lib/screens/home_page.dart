import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:riverpod_test_project/data/models/quiz_model.dart';
import 'package:riverpod_test_project/data/riverpod/quiz/quiz_notifier_provider.dart';
import 'package:riverpod_test_project/data/riverpod/quiz/quiz_state.dart';
import 'package:riverpod_test_project/helper/error_widget.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(quizNotifierProvider.notifier).getQuiz();
    final quizState = ref.watch(quizNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: quizState is QuizLoadedState
            ? PageView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return QuestionPage(
                      quiz: quizState.quizList![index], quiestionNumber: index);
                },
              )
            : quizState is QuizErrorState
                ? ErrorMessageWidget(quizState.message)
                : quizState is QuizLoadingState
                    ? const CircularProgressIndicator()
                    : Container(),
      ),
    );
  }
}

class QuestionPage extends StatelessWidget {
  const QuestionPage(
      {Key? key, required this.quiz, required this.quiestionNumber})
      : super(key: key);

  final QuizModel quiz;
  final int quiestionNumber;

  @override
  Widget build(BuildContext context) {
    final List<String> optionList = [
      quiz.correctAnswer!,
      ...quiz.incorrectAnswers!
    ]..shuffle();
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'Question ${quiestionNumber + 1}',
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            quiz.question!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(flex: 1),
        ...optionList.map((answer) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AppButton(
              child: Text(answer),
              onTap: () {
                snackBar(
                  context,
                  title: answer == quiz.correctAnswer ? 'Correct' : 'Wrong',
                  textColor: Colors.white,
                  backgroundColor:
                      answer == quiz.correctAnswer ? Colors.green : Colors.red,
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: radius(8)),
                  margin: const EdgeInsets.all(16),
                  duration: const Duration(milliseconds: 100),
                );
              },
            ),
          );
        }),
        const Spacer(flex: 2),
      ],
    );
  }
}

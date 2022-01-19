import 'package:riverpod_test_project/data/models/quiz_model.dart';


abstract class IquizRepository {
    Future<List<QuizModel>> fatchQuiz();  
}
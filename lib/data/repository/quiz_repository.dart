import 'package:riverpod_test_project/data/interfaces/iquiz_repository.dart';
import 'package:riverpod_test_project/data/models/quiz_model.dart';
import 'package:riverpod_test_project/data/network/network_exception.dart';
import 'package:riverpod_test_project/data/network/network_utils.dart';

class QuizRepository implements IquizRepository {
  @override
  Future<List<QuizModel>> fatchQuiz() async {
    var responseBody = await handleResponse(
      await getRequest(
      '',
      bearerToken: false,
    ));
    if (responseBody.runtimeType == int) {
      if (responseBody > 206) throw NetworkException();
    }

    return List<QuizModel>.from(
        responseBody['results'].map((x) => QuizModel.fromJson(x)));
  }
}

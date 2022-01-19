class QuizModel {
  final String? category;
  final String? type;
  final String? difficulty;
  final String? question;
  final String? correctAnswer;
  final List<String>? incorrectAnswers;

  QuizModel({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  QuizModel copyWith({
    String? category,
    String? type,
    String? difficulty,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
  }) {
    return QuizModel(
      category: category ?? this.category,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
    );
  }

  QuizModel.fromJson(Map<String, dynamic> json)
    : category = json['category'] as String?,
      type = json['type'] as String?,
      difficulty = json['difficulty'] as String?,
      question = json['question'] as String?,
      correctAnswer = json['correct_answer'] as String?,
      incorrectAnswers = (json['incorrect_answers'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'category' : category,
    'type' : type,
    'difficulty' : difficulty,
    'question' : question,
    'correct_answer' : correctAnswer,
    'incorrect_answers' : incorrectAnswers
  };
}
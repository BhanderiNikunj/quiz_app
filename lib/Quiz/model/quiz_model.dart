class QuizModel {
  int responseCode;
  List<Result> results;

  QuizModel({
    required this.responseCode,
    required this.results,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    responseCode: json["response_code"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Category category;
  Type type;
  Difficulty difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  Result({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: categoryValues.map[json["category"]]!,
    type: typeValues.map[json["type"]]!,
    difficulty: difficultyValues.map[json["difficulty"]]!,
    question: json["question"],
    correctAnswer: json["correct_answer"],
    incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "category": categoryValues.reverse[category],
    "type": typeValues.reverse[type],
    "difficulty": difficultyValues.reverse[difficulty],
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
  };
}

enum Category {ANIMALS}

final categoryValues = EnumValues({
  "Animals": Category.ANIMALS
});

enum Difficulty {MEDIUM}

final difficultyValues = EnumValues({
  "medium": Difficulty.MEDIUM
});

enum Type {MULTIPLE}

final typeValues = EnumValues({
  "multiple": Type.MULTIPLE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

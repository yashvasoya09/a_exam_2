// To parse this JSON data, do
//
//     final eModel = eModelFromJson(jsonString);

import 'dart:convert';

EModel eModelFromJson(String str) => EModel.fromJson(json.decode(str));

String eModelToJson(EModel data) => json.encode(data.toJson());

class EModel {
  int? responseCode;
  List<Result>? results;

  EModel({
    this.responseCode,
    this.results,
  });

  factory EModel.fromJson(Map<String, dynamic> json) => EModel(
    responseCode: json["response_code"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Category? category;
  Type? type;
  Difficulty? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  Result({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: categoryValues.map[json["category"]]!,
    type: typeValues.map[json["type"]]!,
    difficulty: difficultyValues.map[json["difficulty"]]!,
    question: json["question"],
    correctAnswer: json["correct_answer"],
    incorrectAnswers: json["incorrect_answers"] == null ? [] : List<String>.from(json["incorrect_answers"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "category": categoryValues.reverse[category],
    "type": typeValues.reverse[type],
    "difficulty": difficultyValues.reverse[difficulty],
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": incorrectAnswers == null ? [] : List<dynamic>.from(incorrectAnswers!.map((x) => x)),
  };
}

enum Category { VEHICLES }

final categoryValues = EnumValues({
  "Vehicles": Category.VEHICLES
});

enum Difficulty { MEDIUM }

final difficultyValues = EnumValues({
  "medium": Difficulty.MEDIUM
});

enum Type { MULTIPLE }

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

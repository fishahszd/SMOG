import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

part 'scenario.g.dart';

@JsonSerializable()
class Scenario {
  String title;
  List<ResolutionQuestion> resolutionQuestions = [];

  Scenario(this.title);
  factory Scenario.fromJson(Map<String, dynamic> json) => _$ScenarioFromJson(json);
  Map<String, dynamic> toJson() => _$ScenarioToJson(this);

  @override
  String toString() {
    return 'Scenario{title: $title, resultionQuestions: $resolutionQuestions}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Scenario &&
              runtimeType == other.runtimeType &&
              title == other.title;

  @override
  int get hashCode => title.hashCode;
}

@JsonSerializable()
class ResolutionQuestion {
  String question;
  Map<String, String> answers;
  String answer;

  ResolutionQuestion();
  factory ResolutionQuestion.fromJson(Map<String, dynamic> json) => _$ResolutionQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$ResolutionQuestionToJson(this);

  @override
  String toString() {
    return 'ResolutionQuestion{question: $question, answers: $answers, answer: $answer}';
  }
}

@JsonSerializable()
class Scenarios {
  List<Scenario> allScenario;

  Scenarios();

  factory Scenarios.fromJson(Map<String, dynamic> json) =>
      _$ScenariosFromJson(json);

  Map<String, dynamic> toJson() => _$ScenariosToJson(this);

  static Future<Scenarios> loadFromAsset() async {
    print("loading scnearios from asset");
    var loaded = await rootBundle.loadString("assets/scenarios.json");
    var result = Scenarios.fromJson(jsonDecode(loaded));
    print("scenarios loaded: $result");
    return result;
  }

  @override
  String toString() {
    return 'Gears{allGear: $allScenario}';
  }
}
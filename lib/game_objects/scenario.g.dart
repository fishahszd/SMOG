// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scenario _$ScenarioFromJson(Map<String, dynamic> json) {
  return Scenario(json['title'] as String)
    ..resolutionQuestions = (json['resolutionQuestions'] as List)
        ?.map((e) => e == null
            ? null
            : ResolutionQuestion.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ScenarioToJson(Scenario instance) => <String, dynamic>{
      'title': instance.title,
      'resolutionQuestions': instance.resolutionQuestions
    };

ResolutionQuestion _$ResolutionQuestionFromJson(Map<String, dynamic> json) {
  return ResolutionQuestion()
    ..question = json['question'] as String
    ..answers = (json['answers'] as Map<String, dynamic>)
        ?.map((k, e) => MapEntry(k, e as String))
    ..answer = json['answer'] as String;
}

Map<String, dynamic> _$ResolutionQuestionToJson(ResolutionQuestion instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
      'answer': instance.answer
    };

Scenarios _$ScenariosFromJson(Map<String, dynamic> json) {
  return Scenarios()
    ..allScenario = (json['allScenario'] as List)
        ?.map((e) =>
            e == null ? null : Scenario.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ScenariosToJson(Scenarios instance) =>
    <String, dynamic>{'allScenario': instance.allScenario};

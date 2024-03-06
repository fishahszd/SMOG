// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Play _$PlayFromJson(Map<String, dynamic> json) {
  return Play(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String))
    ..nemesis = json['nemesis'] == null
        ? null
        : Nemesis.fromJson(json['nemesis'] as Map<String, dynamic>)
    ..characters = (json['characters'] as List)
        ?.map((e) =>
            e == null ? null : Gentleman.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..scenario = json['scenario'] == null
        ? null
        : Scenario.fromJson(json['scenario'] as Map<String, dynamic>)
    ..gentlemenSuccess = json['gentlemenSuccess'] as bool;
}

Map<String, dynamic> _$PlayToJson(Play instance) => <String, dynamic>{
      'nemesis': instance.nemesis,
      'characters': instance.characters,
      'date': instance.date?.toIso8601String(),
      'scenario': instance.scenario,
      'gentlemenSuccess': instance.gentlemenSuccess
    };

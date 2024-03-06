// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artefact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artefact _$ArtefactFromJson(Map<String, dynamic> json) {
  return Artefact(name: json['name'] as String);
}

Map<String, dynamic> _$ArtefactToJson(Artefact instance) =>
    <String, dynamic>{'name': instance.name};

Artefacts _$ArtefactsFromJson(Map<String, dynamic> json) {
  return Artefacts()
    ..allArtefact = (json['allArtefact'] as List)
        ?.map((e) =>
            e == null ? null : Artefact.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ArtefactsToJson(Artefacts instance) =>
    <String, dynamic>{'allArtefact': instance.allArtefact};

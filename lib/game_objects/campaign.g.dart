// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campaign _$CampaignFromJson(Map<String, dynamic> json) {
  return Campaign()
    ..name = json['name'] as String
    ..plays = (json['plays'] as List)
        ?.map(
            (e) => e == null ? null : Play.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..characters = (json['characters'] as List)
        ?.map((e) =>
            e == null ? null : Gentleman.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..nemesis = json['nemesis'] == null
        ? null
        : Nemesis.fromJson(json['nemesis'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CampaignToJson(Campaign instance) => <String, dynamic>{
      'name': instance.name,
      'plays': instance.plays,
      'characters': instance.characters,
      'nemesis': instance.nemesis
    };

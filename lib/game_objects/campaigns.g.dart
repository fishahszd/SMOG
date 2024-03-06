// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaigns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campaigns _$CampaignsFromJson(Map<String, dynamic> json) {
  return Campaigns()
    ..campaigns = (json['campaigns'] as List)
        ?.map((e) =>
            e == null ? null : Campaign.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CampaignsToJson(Campaigns instance) =>
    <String, dynamic>{'campaigns': instance.campaigns};

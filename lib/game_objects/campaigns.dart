import 'package:json_annotation/json_annotation.dart';
import 'campaign.dart';

part 'campaigns.g.dart';

@JsonSerializable()
class Campaigns {
  List<Campaign> campaigns = [];

  Campaigns();

  factory Campaigns.fromJson(Map<String, dynamic> json) => _$CampaignsFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignsToJson(this);
}

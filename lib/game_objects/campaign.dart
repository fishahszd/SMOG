import 'package:json_annotation/json_annotation.dart';
import 'nemesis.dart';
import 'gentleman.dart';
import 'play.dart';

part 'campaign.g.dart';

@JsonSerializable()
class Campaign {
  String name;
  List<Play> plays = [];
  List<Gentleman> characters = [Gentleman(), Gentleman(), Gentleman(), Gentleman()];
  Nemesis nemesis = new Nemesis();

  Campaign();
  Campaign.fromName(this.name);
  Campaign.fromAll(this.name, this.plays);

  factory Campaign.fromJson(Map<String, dynamic> json) => _$CampaignFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignToJson(this);

  Play get lastPlay {
    if (this.plays.isNotEmpty) {
      return this.plays.last;
    }
  }

  List<Role> getUsedRoles() {
    return this.characters.map((Gentleman gentleman) {
      return gentleman.role;
    }).toList();
  }

  List<Role> getAvailableRoles(Gentleman gentleman) {
    List<Role> result = [];
    Role.values.forEach((Role role) {
      if (gentleman.role == role || !this.getUsedRoles().contains(role)) {
        result.add(role);
      }
    });
    result.sort((a,b) => a.toString().compareTo(b.toString()));
    return result;
  }

  List<Job> getUsedJobs() {
    return this.characters.map((Gentleman gentleman) {
      return gentleman.job;
    }).toList();
  }

  List<Gentleman> getAvailableGentleman(Gentleman gentleman) {
    List<Gentleman> result = [];
    Gentleman.GENTLEMEN.values.forEach((Gentleman aGentleman) {
      print(aGentleman.picture);
      if (aGentleman.job == gentleman.job || !this.getUsedJobs().contains(aGentleman.job)) {
        result.add(aGentleman);
      }
    });
    result.sort((a,b) => a.name.compareTo(b.name));
    return result;
  }

  bool hasLeader() {
    bool result  = false;
    for(Gentleman gentleman in characters ) {
      if (gentleman.role == Role.Leader) {
        result = true;
        break;
      }
    }
    return result;
  }
}


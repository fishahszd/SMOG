import 'package:json_annotation/json_annotation.dart';
import 'gentleman.dart';
import 'package:smog_moloch/multi_select_list.dart';

part 'upgrade.g.dart';

@JsonSerializable()
class Upgrade implements MultiSelectListItem{
  String name;

  Upgrade(this.name);
  factory Upgrade.fromJson(Map<String, dynamic> json) => _$UpgradeFromJson(json);
  Map<String, dynamic> toJson() => _$UpgradeToJson(this);

  static List<Upgrade> getAvaliableUpgrades(Job job) {
    List<Upgrade> result = [];
    switch (job) {
      case Job.Knight:
        result = [
          Upgrade("Superior tactics"),
          Upgrade("Relentless"),
          Upgrade("Out of my way"),
          Upgrade("Taunt"),
          Upgrade("Guardian"),
          Upgrade("Touchy"),
          Upgrade("Stalwart"),
          Upgrade("Hard boiled")
        ];
        break;
      case Job.Arcanist:
        result = [
          Upgrade("Spirit of vengeance"),
          Upgrade("Life drain"),
          Upgrade("Protection aura"),
          Upgrade("Reap vitae"),
          Upgrade("Posession"),
          Upgrade("Soul fire"),
          Upgrade("Healing wave"),
          Upgrade("Spectral bolt")
        ];
        break;
      case Job.Mekamancer:
        result = [
          Upgrade("Propeller"),
          Upgrade("Cooling chamber"),
          Upgrade("Precision eyepiece"),
          Upgrade("High tension"),
          Upgrade("Ether tank"),
          Upgrade("Nanny tin"),
          Upgrade("Enhanced suit"),
          Upgrade("Homing device")
        ];
        break;
      case Job.Dilettante:
        result = [
          Upgrade("Impetuous"),
          Upgrade("Insipartion"),
          Upgrade("Copycat"),
          Upgrade("Resourceful"),
          Upgrade("Reflexes"),
          Upgrade("Luck of the devil"),
          Upgrade("Sportsman"),
          Upgrade("Top of the line")
        ];
        break;
      case Job.Monster:
        result = [
          Upgrade("Bloodthirst"),
          Upgrade("Killer instinct"),
          Upgrade("Open season"),
          Upgrade("Berserk"),
          Upgrade("Lash out"),
          Upgrade("Rabid"),
          Upgrade("Inhuman stand"),
          Upgrade("Survival instinct")
        ];
        break;
    };

    result.sort((a,b) => a.name.compareTo(b.name));
    return result;
  }

  @override
  bool operator ==(other) {
    return this.name == other.name;
  }

  @override
  String getListItemSubtitle() {
    return null;
  }

  @override
  String getListItemTitle() {
    return this.name;
  }
}

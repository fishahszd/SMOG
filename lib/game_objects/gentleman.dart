import 'package:json_annotation/json_annotation.dart';
import 'arsenal.dart';
import 'gear.dart';
import 'upgrade.dart';
import 'artefact.dart';
import 'player.dart';
import 'moloch_stone.dart';

part 'gentleman.g.dart';

@JsonSerializable()
class Gentleman extends Player{
  static final Map<String, Gentleman> GENTLEMEN = {
    //"Phileas Fogg": new Gentleman.fromStat("Phileas Fogg", Job.Mekamancer, 3, 3, 3, 'assets/cavendish.jpg'),
    "Emma Swanson": new Gentleman.fromStat("Emma Swanson", Job.Dilettante, 3, 4, 0, 'assets/swanson.jpg'),
    "Walther Cavendish": new Gentleman.fromStat("Walther Cavendish", Job.Mekamancer, 3, 3, 2, 'assets/cavendish.jpg'),
    "Major Dreadful": new Gentleman.fromStat("Major Dreadful", Job.Knight, 3, 3, 3, 'assets/dreadful.jpg'),
    "Abigail Sutherland": new Gentleman.fromStat("Abigail Sutherland", Job.Arcanist, 3, 2, 3, 'assets/sutherland.jpg'),
    "Drago": new Gentleman.fromStat("Drago", Job.Monster, 3, 2, 3, 'assets/drago.jpg')
  };

  String name;
  Job job;
  Role role;
  int agility;
  int trigger;
  int punch;
  List<Gear> gears = [];
  List<Arsenal> arsenals = [];
  List<Artefact> artefacts = [];
  List<Upgrade> upgrades = [];
  String picture;

  Gentleman();

  factory Gentleman.fromName(String name) {
    return new Gentleman.fromGentleman(GENTLEMEN[name]);
  }

  Gentleman.fromGentleman(Gentleman gentleman) {
    this.name = gentleman.name;
    this.job = gentleman.job;
    this.punch = gentleman.punch;
    this.trigger = gentleman.trigger;
    this.agility = gentleman.agility;
    this.picture = gentleman.picture;
  }
  Gentleman.fromStat(this.name, this.job, this.agility, this.trigger, this.punch, this.picture);
  factory Gentleman.fromJson(Map<String, dynamic> json) => _$GentlemanFromJson(json);
  Map<String, dynamic> toJson() => _$GentlemanToJson(this);

  String get shortRole => role.toString().split(".").last;

  void updateMainData(Gentleman gentleman) {
    this.name = gentleman.name;
    this.job = gentleman.job;
    this.punch = gentleman.punch;
    this.agility = gentleman.agility;
    this.trigger = gentleman.trigger;
    this.picture = gentleman.picture;
  }

  @override
  bool operator ==(other) {
    return this?.name == (other?.name ?? null);
  }

  @override
  String toString() {
    return 'Gentleman{name: $name, job: $job, role: $role, agility: $agility, trigger: $trigger, punch: $punch, gears: $gears, arsenals: $arsenals, artefacts: $artefacts, upgrades: $upgrades}';
  }


}

enum Job {Arcanist, Dilettante, Knight, Mekamancer, Monster}
enum Role {Executioner, Samaritan, Scout, Leader, Bruiser, Bouncer,}


import 'package:json_annotation/json_annotation.dart';
import '../multi_select_list.dart';

part 'power.g.dart';

@JsonSerializable()
class Power implements MultiSelectListItem, Comparable {
  static final List<Power> POWERS = [
    Power("Pyromaniac"),
    Power("Life siphon"),
    Power("Dark guidane"),
    Power("Summon minions"),
    Power("Instill chaos"),
    Power("Sinister Purpose"),
    Power("Shadow grasp"),
    Power("Command minions"),
  ];
  String name;

  static List<Power> getAll() {
    var result = POWERS;
    result.sort();
    return result;
  }

  Power(this.name);
  factory Power.fromJson(Map<String, dynamic> json) => _$PowerFromJson(json);
  Map<String, dynamic> toJson() => _$PowerToJson(this);

  @override
  int compareTo(other) {
    return this.name.compareTo(other.name);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Power &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String getListItemSubtitle() {
    return null;
  }

  @override
  String getListItemTitle() {
    return this.name;
  }

  @override
  String toString() {
    return 'Power{name: $name}';
  }
}
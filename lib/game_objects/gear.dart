import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../multi_select_list.dart';

part 'gear.g.dart';

@JsonSerializable()
class Gear implements MultiSelectListItem, Comparable{
  String name;

  Gear({this.name});
  factory Gear.fromJson(Map<String, dynamic> json) => _$GearFromJson(json);
  Map<String, dynamic> toJson() => _$GearToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Gear &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  int compareTo(other) {
    return this.name.compareTo(other.name);
  }

  @override
  String getListItemSubtitle() {
    return null;
  }

  @override
  String getListItemTitle() {
    return "${this.name}";
  }

  @override
  String toString() {
    return 'Gear{name: $name}';
  }
}

@JsonSerializable()
class Gears {
  List<Gear> allGear;

  Gears();
  factory Gears.fromJson(Map<String, dynamic> json) => _$GearsFromJson(json);
  Map<String, dynamic> toJson() => _$GearsToJson(this);

  static Future<Gears> loadFromAsset() async {
    print("loading gears from asset");
    var loaded = await rootBundle.loadString("assets/gears.json");
    var result = Gears.fromJson(jsonDecode(loaded));
    result.allGear.sort();
    print("gears loaded: $result");
    return result;
  }

  @override
  String toString() {
    return 'Gears{allGear: $allGear}';
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../multi_select_list.dart';

part 'moloch_stone.g.dart';

@JsonSerializable()
class MolochStone implements MultiSelectListItem, Comparable{
  String name;

  MolochStone({this.name});
  factory MolochStone.fromJson(Map<String, dynamic> json) => _$MolochStoneFromJson(json);
  Map<String, dynamic> toJson() => _$MolochStoneToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MolochStone &&
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
    return 'MolochStone{name: $name}';
  }
}

@JsonSerializable()
class MolochStones {
  List<MolochStone> allMolochStone;

  MolochStones();
  factory MolochStones.fromJson(Map<String, dynamic> json) => _$MolochStonesFromJson(json);
  Map<String, dynamic> toJson() => _$MolochStonesToJson(this);

  static Future<MolochStones> loadFromAsset() async {
    print("loading moloch stones from asset");
    var loaded = await rootBundle.loadString("assets/moloch_stones.json");
    var result = MolochStones.fromJson(jsonDecode(loaded));
    result.allMolochStone.sort();
    print("moloch stones loaded: $result");
    return result;
  }

  @override
  String toString() {
    return 'MolochStones{allMolochStone: $allMolochStone}';
  }
}

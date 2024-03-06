import 'package:json_annotation/json_annotation.dart';
import '../multi_select_list.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

part 'arsenal.g.dart';

@JsonSerializable()
class Arsenal implements MultiSelectListItem, Comparable{
  ArsenalType type;
  String name;

  Arsenal({this.name, this.type});
  factory Arsenal.fromJson(Map<String, dynamic> json) => _$ArsenalFromJson(json);
  Map<String, dynamic> toJson() => _$ArsenalToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Arsenal &&
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
    return "${this.name} (${this.type.toString().split('.').last})";
  }
}

enum ArsenalType {Common, Expert, Royal}

@JsonSerializable()
class Arsenals {
  List<Arsenal> allArsenal;

  Arsenals();

  static Future<Arsenals> loadFromAsset() async {
      print("loading arsenals from asset");
      var loaded = await rootBundle.loadString("assets/arsenals.json");
      var result = Arsenals.fromJson(jsonDecode(loaded));
      result.allArsenal.sort();
      print("arsenals loaded: $result");
      return result;
  }

  factory Arsenals.fromJson(Map<String, dynamic> json) => _$ArsenalsFromJson(json);
  Map<String, dynamic> toJson() => _$ArsenalsToJson(this);

  @override
  String toString() {
    return 'Arsenals{allArsenal: $allArsenal}';
  }
}

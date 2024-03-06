import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../multi_select_list.dart';

part 'artefact.g.dart';

@JsonSerializable()
class Artefact implements MultiSelectListItem, Comparable{
  String name;

  Artefact({this.name});
  factory Artefact.fromJson(Map<String, dynamic> json) => _$ArtefactFromJson(json);
  Map<String, dynamic> toJson() => _$ArtefactToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Artefact &&
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
    return 'Artefact{name: $name}';
  }
}

@JsonSerializable()
class Artefacts {
  List<Artefact> allArtefact;

  Artefacts();
  factory Artefacts.fromJson(Map<String, dynamic> json) => _$ArtefactsFromJson(json);
  Map<String, dynamic> toJson() => _$ArtefactsToJson(this);

  static Future<Artefacts> loadFromAsset() async {
    print("loading artefacts from asset");
    var loaded = await rootBundle.loadString("assets/artefacts.json");
    var result = Artefacts.fromJson(jsonDecode(loaded));
    result.allArtefact.sort();
    print("artefacts loaded: $result");
    return result;
  }

  @override
  String toString() {
    return 'Artefact{allArtefact: $allArtefact}';
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'nemesis.dart';
import 'gentleman.dart';
import 'scenario.dart';

part 'play.g.dart';

@JsonSerializable()
class Play {

  factory Play.fromJson(Map<String, dynamic> json) => _$PlayFromJson(json);
  Map<String, dynamic> toJson() => _$PlayToJson(this);

  Nemesis nemesis;
  List<Gentleman> characters = [];
  DateTime date = DateTime.now();
  Scenario scenario;
  bool gentlemenSuccess;

  Play({this.date}) {
    this.date = (this.date ?? DateTime.now());
  }
}

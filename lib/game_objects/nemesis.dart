import 'package:json_annotation/json_annotation.dart';
import 'player.dart';
import 'power.dart';
import 'moloch_stone.dart';

part 'nemesis.g.dart';

@JsonSerializable()
class Nemesis extends Player{
  List<Power> powers = [];

  Nemesis();
  factory Nemesis.fromJson(Map<String, dynamic> json) => _$NemesisFromJson(json);
  Map<String, dynamic> toJson() => _$NemesisToJson(this);

  List<Power> getAvailablePowers() {
    List<Power> result = [];
    Power.POWERS.forEach((Power power) {
      if (!this.powers.contains(power)) {
        result.add(power);
      }
    });
    result.sort();
    return result;
  }

  @override
  String toString() {
    return 'Nemesis{powers: $powers}';
  }


}

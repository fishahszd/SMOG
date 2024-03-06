// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nemesis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nemesis _$NemesisFromJson(Map<String, dynamic> json) {
  return Nemesis()
    ..playerName = json['playerName'] as String
    ..molochStones = (json['molochStones'] as List)
        ?.map((e) =>
            e == null ? null : MolochStone.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..powers = (json['powers'] as List)
        ?.map(
            (e) => e == null ? null : Power.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NemesisToJson(Nemesis instance) => <String, dynamic>{
      'playerName': instance.playerName,
      'molochStones': instance.molochStones,
      'powers': instance.powers
    };

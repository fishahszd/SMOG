// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moloch_stone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MolochStone _$MolochStoneFromJson(Map<String, dynamic> json) {
  return MolochStone(name: json['name'] as String);
}

Map<String, dynamic> _$MolochStoneToJson(MolochStone instance) =>
    <String, dynamic>{'name': instance.name};

MolochStones _$MolochStonesFromJson(Map<String, dynamic> json) {
  return MolochStones()
    ..allMolochStone = (json['allMolochStone'] as List)
        ?.map((e) =>
            e == null ? null : MolochStone.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MolochStonesToJson(MolochStones instance) =>
    <String, dynamic>{'allMolochStone': instance.allMolochStone};

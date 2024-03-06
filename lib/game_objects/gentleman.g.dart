// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gentleman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gentleman _$GentlemanFromJson(Map<String, dynamic> json) {
  return Gentleman()
    ..playerName = json['playerName'] as String
    ..molochStones = (json['molochStones'] as List)
        ?.map((e) =>
            e == null ? null : MolochStone.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..name = json['name'] as String
    ..job = _$enumDecodeNullable(_$JobEnumMap, json['job'])
    ..role = _$enumDecodeNullable(_$RoleEnumMap, json['role'])
    ..agility = json['agility'] as int
    ..trigger = json['trigger'] as int
    ..punch = json['punch'] as int
    ..gears = (json['gears'] as List)
        ?.map(
            (e) => e == null ? null : Gear.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..arsenals = (json['arsenals'] as List)
        ?.map((e) =>
            e == null ? null : Arsenal.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..artefacts = (json['artefacts'] as List)
        ?.map((e) =>
            e == null ? null : Artefact.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..upgrades = (json['upgrades'] as List)
        ?.map((e) =>
            e == null ? null : Upgrade.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..picture = json['picture'] as String;
}

Map<String, dynamic> _$GentlemanToJson(Gentleman instance) => <String, dynamic>{
      'playerName': instance.playerName,
      'molochStones': instance.molochStones,
      'name': instance.name,
      'job': _$JobEnumMap[instance.job],
      'role': _$RoleEnumMap[instance.role],
      'agility': instance.agility,
      'trigger': instance.trigger,
      'punch': instance.punch,
      'gears': instance.gears,
      'arsenals': instance.arsenals,
      'artefacts': instance.artefacts,
      'upgrades': instance.upgrades,
      'picture': instance.picture
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$JobEnumMap = <Job, dynamic>{
  Job.Arcanist: 'Arcanist',
  Job.Dilettante: 'Dilettante',
  Job.Knight: 'Knight',
  Job.Mekamancer: 'Mekamancer',
  Job.Monster: 'Monster'
};

const _$RoleEnumMap = <Role, dynamic>{
  Role.Executioner: 'Executioner',
  Role.Samaritan: 'Samaritan',
  Role.Scout: 'Scout',
  Role.Leader: 'Leader',
  Role.Bruiser: 'Bruiser',
  Role.Bouncer: 'Bouncer'
};

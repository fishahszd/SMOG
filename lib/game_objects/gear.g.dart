// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gear.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gear _$GearFromJson(Map<String, dynamic> json) {
  return Gear(name: json['name'] as String);
}

Map<String, dynamic> _$GearToJson(Gear instance) =>
    <String, dynamic>{'name': instance.name};

Gears _$GearsFromJson(Map<String, dynamic> json) {
  return Gears()
    ..allGear = (json['allGear'] as List)
        ?.map(
            (e) => e == null ? null : Gear.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GearsToJson(Gears instance) =>
    <String, dynamic>{'allGear': instance.allGear};

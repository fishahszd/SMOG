// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arsenal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Arsenal _$ArsenalFromJson(Map<String, dynamic> json) {
  return Arsenal(
      name: json['name'] as String,
      type: _$enumDecodeNullable(_$ArsenalTypeEnumMap, json['type']));
}

Map<String, dynamic> _$ArsenalToJson(Arsenal instance) => <String, dynamic>{
      'type': _$ArsenalTypeEnumMap[instance.type],
      'name': instance.name
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

const _$ArsenalTypeEnumMap = <ArsenalType, dynamic>{
  ArsenalType.Common: 'Common',
  ArsenalType.Expert: 'Expert',
  ArsenalType.Royal: 'Royal'
};

Arsenals _$ArsenalsFromJson(Map<String, dynamic> json) {
  return Arsenals()
    ..allArsenal = (json['allArsenal'] as List)
        ?.map((e) =>
            e == null ? null : Arsenal.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ArsenalsToJson(Arsenals instance) =>
    <String, dynamic>{'allArsenal': instance.allArsenal};

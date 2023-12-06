// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreSchemaImpl _$$ScoreSchemaImplFromJson(Map<String, dynamic> json) =>
    _$ScoreSchemaImpl(
      name: json['name'] as String? ?? '',
      deathCount: json['deathCount'] as int? ?? 0,
      bounceCount: json['bounceCount'] as int? ?? 0,
      startUnixMs: json['startUnixMs'] as int? ?? 0,
      timeMs: json['timeMs'] as int? ?? 0,
    );

Map<String, dynamic> _$$ScoreSchemaImplToJson(_$ScoreSchemaImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deathCount': instance.deathCount,
      'bounceCount': instance.bounceCount,
      'startUnixMs': instance.startUnixMs,
      'timeMs': instance.timeMs,
    };

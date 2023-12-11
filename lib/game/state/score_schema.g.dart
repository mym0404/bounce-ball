// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreSchemaImpl _$$ScoreSchemaImplFromJson(Map<String, dynamic> json) =>
    _$ScoreSchemaImpl(
      signaturePoints: (json['signaturePoints'] as List<dynamic>?)
              ?.map((e) =>
                  const SignaturePointJsonConverter().fromJson(e as String))
              .toList() ??
          const [],
      deathCount: json['deathCount'] as int? ?? 0,
      bounceCount: json['bounceCount'] as int? ?? 0,
      startUnixMs: json['startUnixMs'] as int? ?? 0,
      timeMs: json['timeMs'] as int? ?? 0,
    );

Map<String, dynamic> _$$ScoreSchemaImplToJson(_$ScoreSchemaImpl instance) =>
    <String, dynamic>{
      'signaturePoints': instance.signaturePoints
          .map(const SignaturePointJsonConverter().toJson)
          .toList(),
      'deathCount': instance.deathCount,
      'bounceCount': instance.bounceCount,
      'startUnixMs': instance.startUnixMs,
      'timeMs': instance.timeMs,
    };

import '../../export.dart';

part 'score_schema.freezed.dart';
part 'score_schema.g.dart';

@freezed
class ScoreSchema with _$ScoreSchema {
  const ScoreSchema._();
  const factory ScoreSchema({
    @Default('') String name,
    @Default(0) int deathCount,
    @Default(0) int bounceCount,
    @Default(0) int startUnixMs,
    @Default(0) int timeMs,
  }) = _ScoreSchema;

  factory ScoreSchema.fromJson(Map<String, dynamic> json) => _$ScoreSchemaFromJson(json);
  factory ScoreSchema.initial({int deathCount = 0, int startUnixMs = 0}) =>
      ScoreSchema(deathCount: deathCount, startUnixMs: startUnixMs);
}

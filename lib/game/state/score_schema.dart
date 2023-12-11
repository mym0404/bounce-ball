import 'package:signature/signature.dart' show Point;

import '../../export.dart' hide Point;
import '../../feature/common/util/signature_point_json_converter.dart';

part 'score_schema.freezed.dart';
part 'score_schema.g.dart';

@freezed
class ScoreSchema with _$ScoreSchema {
  const ScoreSchema._();
  const factory ScoreSchema({
    @Default([]) @SignaturePointJsonConverter() List<Point> signaturePoints,
    @Default(0) int deathCount,
    @Default(0) int bounceCount,
    @Default(0) int startUnixMs,
    @Default(0) int timeMs,
  }) = _ScoreSchema;

  factory ScoreSchema.fromJson(Map<String, dynamic> json) => _$ScoreSchemaFromJson(json);
  factory ScoreSchema.initial({int deathCount = 0, int startUnixMs = 0}) =>
      ScoreSchema(deathCount: deathCount, startUnixMs: startUnixMs);

  DateTime get created => DateTime.fromMillisecondsSinceEpoch(startUnixMs + timeMs);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScoreSchema _$ScoreSchemaFromJson(Map<String, dynamic> json) {
  return _ScoreSchema.fromJson(json);
}

/// @nodoc
mixin _$ScoreSchema {
  @SignaturePointJsonConverter()
  List<Point> get signaturePoints => throw _privateConstructorUsedError;
  int get deathCount => throw _privateConstructorUsedError;
  int get bounceCount => throw _privateConstructorUsedError;
  int get startUnixMs => throw _privateConstructorUsedError;
  int get timeMs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreSchemaCopyWith<ScoreSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreSchemaCopyWith<$Res> {
  factory $ScoreSchemaCopyWith(
          ScoreSchema value, $Res Function(ScoreSchema) then) =
      _$ScoreSchemaCopyWithImpl<$Res, ScoreSchema>;
  @useResult
  $Res call(
      {@SignaturePointJsonConverter() List<Point> signaturePoints,
      int deathCount,
      int bounceCount,
      int startUnixMs,
      int timeMs});
}

/// @nodoc
class _$ScoreSchemaCopyWithImpl<$Res, $Val extends ScoreSchema>
    implements $ScoreSchemaCopyWith<$Res> {
  _$ScoreSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signaturePoints = null,
    Object? deathCount = null,
    Object? bounceCount = null,
    Object? startUnixMs = null,
    Object? timeMs = null,
  }) {
    return _then(_value.copyWith(
      signaturePoints: null == signaturePoints
          ? _value.signaturePoints
          : signaturePoints // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      deathCount: null == deathCount
          ? _value.deathCount
          : deathCount // ignore: cast_nullable_to_non_nullable
              as int,
      bounceCount: null == bounceCount
          ? _value.bounceCount
          : bounceCount // ignore: cast_nullable_to_non_nullable
              as int,
      startUnixMs: null == startUnixMs
          ? _value.startUnixMs
          : startUnixMs // ignore: cast_nullable_to_non_nullable
              as int,
      timeMs: null == timeMs
          ? _value.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreSchemaImplCopyWith<$Res>
    implements $ScoreSchemaCopyWith<$Res> {
  factory _$$ScoreSchemaImplCopyWith(
          _$ScoreSchemaImpl value, $Res Function(_$ScoreSchemaImpl) then) =
      __$$ScoreSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@SignaturePointJsonConverter() List<Point> signaturePoints,
      int deathCount,
      int bounceCount,
      int startUnixMs,
      int timeMs});
}

/// @nodoc
class __$$ScoreSchemaImplCopyWithImpl<$Res>
    extends _$ScoreSchemaCopyWithImpl<$Res, _$ScoreSchemaImpl>
    implements _$$ScoreSchemaImplCopyWith<$Res> {
  __$$ScoreSchemaImplCopyWithImpl(
      _$ScoreSchemaImpl _value, $Res Function(_$ScoreSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signaturePoints = null,
    Object? deathCount = null,
    Object? bounceCount = null,
    Object? startUnixMs = null,
    Object? timeMs = null,
  }) {
    return _then(_$ScoreSchemaImpl(
      signaturePoints: null == signaturePoints
          ? _value._signaturePoints
          : signaturePoints // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      deathCount: null == deathCount
          ? _value.deathCount
          : deathCount // ignore: cast_nullable_to_non_nullable
              as int,
      bounceCount: null == bounceCount
          ? _value.bounceCount
          : bounceCount // ignore: cast_nullable_to_non_nullable
              as int,
      startUnixMs: null == startUnixMs
          ? _value.startUnixMs
          : startUnixMs // ignore: cast_nullable_to_non_nullable
              as int,
      timeMs: null == timeMs
          ? _value.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreSchemaImpl extends _ScoreSchema with DiagnosticableTreeMixin {
  const _$ScoreSchemaImpl(
      {@SignaturePointJsonConverter()
      final List<Point> signaturePoints = const [],
      this.deathCount = 0,
      this.bounceCount = 0,
      this.startUnixMs = 0,
      this.timeMs = 0})
      : _signaturePoints = signaturePoints,
        super._();

  factory _$ScoreSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreSchemaImplFromJson(json);

  final List<Point> _signaturePoints;
  @override
  @JsonKey()
  @SignaturePointJsonConverter()
  List<Point> get signaturePoints {
    if (_signaturePoints is EqualUnmodifiableListView) return _signaturePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signaturePoints);
  }

  @override
  @JsonKey()
  final int deathCount;
  @override
  @JsonKey()
  final int bounceCount;
  @override
  @JsonKey()
  final int startUnixMs;
  @override
  @JsonKey()
  final int timeMs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScoreSchema(signaturePoints: $signaturePoints, deathCount: $deathCount, bounceCount: $bounceCount, startUnixMs: $startUnixMs, timeMs: $timeMs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScoreSchema'))
      ..add(DiagnosticsProperty('signaturePoints', signaturePoints))
      ..add(DiagnosticsProperty('deathCount', deathCount))
      ..add(DiagnosticsProperty('bounceCount', bounceCount))
      ..add(DiagnosticsProperty('startUnixMs', startUnixMs))
      ..add(DiagnosticsProperty('timeMs', timeMs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreSchemaImpl &&
            const DeepCollectionEquality()
                .equals(other._signaturePoints, _signaturePoints) &&
            (identical(other.deathCount, deathCount) ||
                other.deathCount == deathCount) &&
            (identical(other.bounceCount, bounceCount) ||
                other.bounceCount == bounceCount) &&
            (identical(other.startUnixMs, startUnixMs) ||
                other.startUnixMs == startUnixMs) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_signaturePoints),
      deathCount,
      bounceCount,
      startUnixMs,
      timeMs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreSchemaImplCopyWith<_$ScoreSchemaImpl> get copyWith =>
      __$$ScoreSchemaImplCopyWithImpl<_$ScoreSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreSchemaImplToJson(
      this,
    );
  }
}

abstract class _ScoreSchema extends ScoreSchema {
  const factory _ScoreSchema(
      {@SignaturePointJsonConverter() final List<Point> signaturePoints,
      final int deathCount,
      final int bounceCount,
      final int startUnixMs,
      final int timeMs}) = _$ScoreSchemaImpl;
  const _ScoreSchema._() : super._();

  factory _ScoreSchema.fromJson(Map<String, dynamic> json) =
      _$ScoreSchemaImpl.fromJson;

  @override
  @SignaturePointJsonConverter()
  List<Point> get signaturePoints;
  @override
  int get deathCount;
  @override
  int get bounceCount;
  @override
  int get startUnixMs;
  @override
  int get timeMs;
  @override
  @JsonKey(ignore: true)
  _$$ScoreSchemaImplCopyWith<_$ScoreSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPreferencesData _$UserPreferencesDataFromJson(Map<String, dynamic> json) {
  return _UserPreferencesData.fromJson(json);
}

/// @nodoc
mixin _$UserPreferencesData {
  bool get isShowArrowControls => throw _privateConstructorUsedError;
  double get cameraZoomScale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesDataCopyWith<UserPreferencesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesDataCopyWith<$Res> {
  factory $UserPreferencesDataCopyWith(
          UserPreferencesData value, $Res Function(UserPreferencesData) then) =
      _$UserPreferencesDataCopyWithImpl<$Res, UserPreferencesData>;
  @useResult
  $Res call({bool isShowArrowControls, double cameraZoomScale});
}

/// @nodoc
class _$UserPreferencesDataCopyWithImpl<$Res, $Val extends UserPreferencesData>
    implements $UserPreferencesDataCopyWith<$Res> {
  _$UserPreferencesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowArrowControls = null,
    Object? cameraZoomScale = null,
  }) {
    return _then(_value.copyWith(
      isShowArrowControls: null == isShowArrowControls
          ? _value.isShowArrowControls
          : isShowArrowControls // ignore: cast_nullable_to_non_nullable
              as bool,
      cameraZoomScale: null == cameraZoomScale
          ? _value.cameraZoomScale
          : cameraZoomScale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesDataImplCopyWith<$Res>
    implements $UserPreferencesDataCopyWith<$Res> {
  factory _$$UserPreferencesDataImplCopyWith(_$UserPreferencesDataImpl value,
          $Res Function(_$UserPreferencesDataImpl) then) =
      __$$UserPreferencesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isShowArrowControls, double cameraZoomScale});
}

/// @nodoc
class __$$UserPreferencesDataImplCopyWithImpl<$Res>
    extends _$UserPreferencesDataCopyWithImpl<$Res, _$UserPreferencesDataImpl>
    implements _$$UserPreferencesDataImplCopyWith<$Res> {
  __$$UserPreferencesDataImplCopyWithImpl(_$UserPreferencesDataImpl _value,
      $Res Function(_$UserPreferencesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowArrowControls = null,
    Object? cameraZoomScale = null,
  }) {
    return _then(_$UserPreferencesDataImpl(
      isShowArrowControls: null == isShowArrowControls
          ? _value.isShowArrowControls
          : isShowArrowControls // ignore: cast_nullable_to_non_nullable
              as bool,
      cameraZoomScale: null == cameraZoomScale
          ? _value.cameraZoomScale
          : cameraZoomScale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesDataImpl extends _UserPreferencesData
    with DiagnosticableTreeMixin {
  const _$UserPreferencesDataImpl(
      {this.isShowArrowControls = true, this.cameraZoomScale = 1})
      : super._();

  factory _$UserPreferencesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesDataImplFromJson(json);

  @override
  @JsonKey()
  final bool isShowArrowControls;
  @override
  @JsonKey()
  final double cameraZoomScale;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserPreferencesData(isShowArrowControls: $isShowArrowControls, cameraZoomScale: $cameraZoomScale)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserPreferencesData'))
      ..add(DiagnosticsProperty('isShowArrowControls', isShowArrowControls))
      ..add(DiagnosticsProperty('cameraZoomScale', cameraZoomScale));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesDataImpl &&
            (identical(other.isShowArrowControls, isShowArrowControls) ||
                other.isShowArrowControls == isShowArrowControls) &&
            (identical(other.cameraZoomScale, cameraZoomScale) ||
                other.cameraZoomScale == cameraZoomScale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isShowArrowControls, cameraZoomScale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesDataImplCopyWith<_$UserPreferencesDataImpl> get copyWith =>
      __$$UserPreferencesDataImplCopyWithImpl<_$UserPreferencesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesDataImplToJson(
      this,
    );
  }
}

abstract class _UserPreferencesData extends UserPreferencesData {
  const factory _UserPreferencesData(
      {final bool isShowArrowControls,
      final double cameraZoomScale}) = _$UserPreferencesDataImpl;
  const _UserPreferencesData._() : super._();

  factory _UserPreferencesData.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesDataImpl.fromJson;

  @override
  bool get isShowArrowControls;
  @override
  double get cameraZoomScale;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesDataImplCopyWith<_$UserPreferencesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

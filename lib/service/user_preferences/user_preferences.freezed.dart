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
  double get bgmVolumn => throw _privateConstructorUsedError;
  double get effectVolumn => throw _privateConstructorUsedError;
  bool get isBgmSoundEnable => throw _privateConstructorUsedError;
  bool get isEffectSoundEnable => throw _privateConstructorUsedError;

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
  $Res call(
      {bool isShowArrowControls,
      double cameraZoomScale,
      double bgmVolumn,
      double effectVolumn,
      bool isBgmSoundEnable,
      bool isEffectSoundEnable});
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
    Object? bgmVolumn = null,
    Object? effectVolumn = null,
    Object? isBgmSoundEnable = null,
    Object? isEffectSoundEnable = null,
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
      bgmVolumn: null == bgmVolumn
          ? _value.bgmVolumn
          : bgmVolumn // ignore: cast_nullable_to_non_nullable
              as double,
      effectVolumn: null == effectVolumn
          ? _value.effectVolumn
          : effectVolumn // ignore: cast_nullable_to_non_nullable
              as double,
      isBgmSoundEnable: null == isBgmSoundEnable
          ? _value.isBgmSoundEnable
          : isBgmSoundEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      isEffectSoundEnable: null == isEffectSoundEnable
          ? _value.isEffectSoundEnable
          : isEffectSoundEnable // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {bool isShowArrowControls,
      double cameraZoomScale,
      double bgmVolumn,
      double effectVolumn,
      bool isBgmSoundEnable,
      bool isEffectSoundEnable});
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
    Object? bgmVolumn = null,
    Object? effectVolumn = null,
    Object? isBgmSoundEnable = null,
    Object? isEffectSoundEnable = null,
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
      bgmVolumn: null == bgmVolumn
          ? _value.bgmVolumn
          : bgmVolumn // ignore: cast_nullable_to_non_nullable
              as double,
      effectVolumn: null == effectVolumn
          ? _value.effectVolumn
          : effectVolumn // ignore: cast_nullable_to_non_nullable
              as double,
      isBgmSoundEnable: null == isBgmSoundEnable
          ? _value.isBgmSoundEnable
          : isBgmSoundEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      isEffectSoundEnable: null == isEffectSoundEnable
          ? _value.isEffectSoundEnable
          : isEffectSoundEnable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesDataImpl extends _UserPreferencesData
    with DiagnosticableTreeMixin {
  const _$UserPreferencesDataImpl(
      {this.isShowArrowControls = true,
      this.cameraZoomScale = 1,
      this.bgmVolumn = 0.3,
      this.effectVolumn = 0.5,
      this.isBgmSoundEnable = true,
      this.isEffectSoundEnable = true})
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
  @JsonKey()
  final double bgmVolumn;
  @override
  @JsonKey()
  final double effectVolumn;
  @override
  @JsonKey()
  final bool isBgmSoundEnable;
  @override
  @JsonKey()
  final bool isEffectSoundEnable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserPreferencesData(isShowArrowControls: $isShowArrowControls, cameraZoomScale: $cameraZoomScale, bgmVolumn: $bgmVolumn, effectVolumn: $effectVolumn, isBgmSoundEnable: $isBgmSoundEnable, isEffectSoundEnable: $isEffectSoundEnable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserPreferencesData'))
      ..add(DiagnosticsProperty('isShowArrowControls', isShowArrowControls))
      ..add(DiagnosticsProperty('cameraZoomScale', cameraZoomScale))
      ..add(DiagnosticsProperty('bgmVolumn', bgmVolumn))
      ..add(DiagnosticsProperty('effectVolumn', effectVolumn))
      ..add(DiagnosticsProperty('isBgmSoundEnable', isBgmSoundEnable))
      ..add(DiagnosticsProperty('isEffectSoundEnable', isEffectSoundEnable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesDataImpl &&
            (identical(other.isShowArrowControls, isShowArrowControls) ||
                other.isShowArrowControls == isShowArrowControls) &&
            (identical(other.cameraZoomScale, cameraZoomScale) ||
                other.cameraZoomScale == cameraZoomScale) &&
            (identical(other.bgmVolumn, bgmVolumn) ||
                other.bgmVolumn == bgmVolumn) &&
            (identical(other.effectVolumn, effectVolumn) ||
                other.effectVolumn == effectVolumn) &&
            (identical(other.isBgmSoundEnable, isBgmSoundEnable) ||
                other.isBgmSoundEnable == isBgmSoundEnable) &&
            (identical(other.isEffectSoundEnable, isEffectSoundEnable) ||
                other.isEffectSoundEnable == isEffectSoundEnable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isShowArrowControls,
      cameraZoomScale,
      bgmVolumn,
      effectVolumn,
      isBgmSoundEnable,
      isEffectSoundEnable);

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
      final double cameraZoomScale,
      final double bgmVolumn,
      final double effectVolumn,
      final bool isBgmSoundEnable,
      final bool isEffectSoundEnable}) = _$UserPreferencesDataImpl;
  const _UserPreferencesData._() : super._();

  factory _UserPreferencesData.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesDataImpl.fromJson;

  @override
  bool get isShowArrowControls;
  @override
  double get cameraZoomScale;
  @override
  double get bgmVolumn;
  @override
  double get effectVolumn;
  @override
  bool get isBgmSoundEnable;
  @override
  bool get isEffectSoundEnable;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesDataImplCopyWith<_$UserPreferencesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

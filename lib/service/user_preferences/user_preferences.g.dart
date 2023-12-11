// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesDataImpl _$$UserPreferencesDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesDataImpl(
      isShowArrowControls: json['isShowArrowControls'] as bool? ?? true,
      cameraZoomScale: (json['cameraZoomScale'] as num?)?.toDouble() ?? 1,
      bgmVolumn: (json['bgmVolumn'] as num?)?.toDouble() ?? 0.3,
      effectVolumn: (json['effectVolumn'] as num?)?.toDouble() ?? 0.5,
      isBgmSoundEnable: json['isBgmSoundEnable'] as bool? ?? true,
      isEffectSoundEnable: json['isEffectSoundEnable'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserPreferencesDataImplToJson(
        _$UserPreferencesDataImpl instance) =>
    <String, dynamic>{
      'isShowArrowControls': instance.isShowArrowControls,
      'cameraZoomScale': instance.cameraZoomScale,
      'bgmVolumn': instance.bgmVolumn,
      'effectVolumn': instance.effectVolumn,
      'isBgmSoundEnable': instance.isBgmSoundEnable,
      'isEffectSoundEnable': instance.isEffectSoundEnable,
    };

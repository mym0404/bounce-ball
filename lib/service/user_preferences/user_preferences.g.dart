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
    );

Map<String, dynamic> _$$UserPreferencesDataImplToJson(
        _$UserPreferencesDataImpl instance) =>
    <String, dynamic>{
      'isShowArrowControls': instance.isShowArrowControls,
      'cameraZoomScale': instance.cameraZoomScale,
    };

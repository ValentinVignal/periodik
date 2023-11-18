// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      displayPredictions: json['displayPredictions'] as bool? ?? false,
      displayHiddenSignals: json['displayHiddenSignals'] as bool? ?? false,
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'displayPredictions': instance.displayPredictions,
      'displayHiddenSignals': instance.displayHiddenSignals,
    };

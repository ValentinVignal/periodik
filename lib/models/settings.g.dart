// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
  displayPredictions: json['displayPredictions'] as bool? ?? false,
  displayHiddenSignals: json['displayHiddenSignals'] as bool? ?? false,
);

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
  'displayPredictions': instance.displayPredictions,
  'displayHiddenSignals': instance.displayHiddenSignals,
};

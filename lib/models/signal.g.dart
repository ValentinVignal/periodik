// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Signal _$SignalFromJson(Map<String, dynamic> json) => _Signal(
  id: json['id'] as String,
  name: json['name'] as String,
  hidden: json['hidden'] as bool? ?? false,
);

Map<String, dynamic> _$SignalToJson(_Signal instance) => <String, dynamic>{
  'name': instance.name,
  'hidden': instance.hidden,
};

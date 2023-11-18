// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignalImpl _$$SignalImplFromJson(Map<String, dynamic> json) => _$SignalImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      hidden: json['hidden'] as bool? ?? false,
    );

Map<String, dynamic> _$$SignalImplToJson(_$SignalImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hidden': instance.hidden,
    };

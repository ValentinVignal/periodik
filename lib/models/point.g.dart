// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Point _$PointFromJson(Map<String, dynamic> json) => _Point(
  id: json['id'] as String,
  date: const TimestampDateTimeConverter().fromJson(json['date'] as Timestamp),
  state: json['state'] as bool? ?? false,
);

Map<String, dynamic> _$PointToJson(_Point instance) => <String, dynamic>{
  'date': const TimestampDateTimeConverter().toJson(instance.date),
  'state': instance.state,
};

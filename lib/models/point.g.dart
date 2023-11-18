// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointImpl _$$PointImplFromJson(Map<String, dynamic> json) => _$PointImpl(
      id: json['id'] as String,
      date: const TimestampDateTimeConverter()
          .fromJson(json['date'] as Timestamp),
      state: json['state'] as bool? ?? false,
    );

Map<String, dynamic> _$$PointImplToJson(_$PointImpl instance) =>
    <String, dynamic>{
      'date': const TimestampDateTimeConverter().toJson(instance.date),
      'state': instance.state,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_with_signal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointWithSignal _$$_PointWithSignalFromJson(Map<String, dynamic> json) =>
    _$_PointWithSignal(
      signal: Signal.fromJson(json['signal'] as Map<String, dynamic>),
      point: Point.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PointWithSignalToJson(_$_PointWithSignal instance) =>
    <String, dynamic>{
      'signal': instance.signal,
      'point': instance.point,
    };

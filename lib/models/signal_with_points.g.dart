// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signal_with_points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignalWithPoints _$$_SignalWithPointsFromJson(Map<String, dynamic> json) =>
    _$_SignalWithPoints(
      signal: Signal.fromJson(json['signal'] as Map<String, dynamic>),
      points: (json['points'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SignalWithPointsToJson(_$_SignalWithPoints instance) =>
    <String, dynamic>{
      'signal': instance.signal,
      'points': instance.points,
    };

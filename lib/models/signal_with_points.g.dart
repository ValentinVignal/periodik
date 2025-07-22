// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signal_with_points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignalWithPoints _$SignalWithPointsFromJson(Map<String, dynamic> json) =>
    _SignalWithPoints(
      signal: Signal.fromJson(json['signal'] as Map<String, dynamic>),
      points: (json['points'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SignalWithPointsToJson(_SignalWithPoints instance) =>
    <String, dynamic>{'signal': instance.signal, 'points': instance.points};

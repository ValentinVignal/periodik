// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signal_with_points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignalWithPointsImpl _$$SignalWithPointsImplFromJson(
        Map<String, dynamic> json) =>
    _$SignalWithPointsImpl(
      signal: Signal.fromJson(json['signal'] as Map<String, dynamic>),
      points: (json['points'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SignalWithPointsImplToJson(
        _$SignalWithPointsImpl instance) =>
    <String, dynamic>{
      'signal': instance.signal,
      'points': instance.points,
    };

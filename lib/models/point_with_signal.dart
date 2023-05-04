import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/models/signal.dart';

part 'point_with_signal.freezed.dart';
part 'point_with_signal.g.dart';

@freezed
class PointWithSignal with _$PointWithSignal {
  const factory PointWithSignal({
    required Signal signal,
    required Point point,
  }) = _PointWithSignal;

  factory PointWithSignal.fromJson(Map<String, dynamic> json) =>
      _$PointWithSignalFromJson(json);

  const PointWithSignal._();
}

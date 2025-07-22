import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/models/signal.dart';

part 'signal_with_points.freezed.dart';
part 'signal_with_points.g.dart';

@freezed
abstract class SignalWithPoints with _$SignalWithPoints {
  const factory SignalWithPoints({
    required Signal signal,
    required List<Point> points,
  }) = _SignalWithPoints;

  factory SignalWithPoints.fromJson(Map<String, dynamic> json) =>
      _$SignalWithPointsFromJson(json);

  const SignalWithPoints._();
}

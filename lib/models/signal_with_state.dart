import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:periodik/models/point_state.dart';
import 'package:periodik/models/signal.dart';

part 'signal_with_state.freezed.dart';

@freezed
abstract class SignalWithState with _$SignalWithState {
  const factory SignalWithState({
    required Signal signal,
    required PointState point,
  }) = _SignalWithState;
}
